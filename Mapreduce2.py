import random
from collections import defaultdict
import math

# Sample 2D data points
data_points = [
    (1, 2), (2, 3), (3, 3), (8, 7), (7, 8), (9, 7),
    (5, 5), (6, 6), (8, 8), (0, 1), (1, 0)
]

# Parameters
K = 2  # number of clusters
MAX_ITER = 10

# Step 1: Initialize centroids randomly from data points
centroids = random.sample(data_points, K)

def euclidean_distance(p1, p2):
    return math.sqrt(sum((a - b) ** 2 for a, b in zip(p1, p2)))

# ----- Map Step -----
def map_step(data_points, centroids):
    mapped = []
    for point in data_points:
        # Assign point to nearest centroid
        closest_centroid_index = min(
            range(K), key=lambda i: euclidean_distance(point, centroids[i])
        )
        mapped.append((closest_centroid_index, point))
    return mapped

# ----- Shuffle and Group Step -----
def shuffle_and_group(mapped_data):
    grouped = defaultdict(list)
    for centroid_index, point in mapped_data:
        grouped[centroid_index].append(point)
    return grouped

# ----- Reduce Step -----
def reduce_step(grouped_data):
    new_centroids = []
    for i in range(K):
        points = grouped_data[i]
        if points:
            mean_x = sum(p[0] for p in points) / len(points)
            mean_y = sum(p[1] for p in points) / len(points)
            new_centroids.append((mean_x, mean_y))
        else:
            # If no points assigned, keep the old centroid
            new_centroids.append(centroids[i])
    return new_centroids

# ----- Run MapReduce K-Means -----
for iteration in range(MAX_ITER):
    print(f"\n--- Iteration {iteration + 1} ---")
    mapped = map_step(data_points, centroids)
    grouped = shuffle_and_group(mapped)
    centroids = reduce_step(grouped)
    print("Centroids:", centroids)

# ----- Final Cluster Assignments -----
final_clusters = defaultdict(list)
for point in data_points:
    idx = min(range(K), key=lambda i: euclidean_distance(point, centroids[i]))
    final_clusters[idx].append(point)

# ----- Output Clusters -----
print("\nFinal Clusters:")
for cluster_id, points in final_clusters.items():
    print(f"Cluster {cluster_id + 1}: {points}")
