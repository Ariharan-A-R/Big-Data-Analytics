from collections import defaultdict

# Sample input text
text = """
Hadoop is an open-source framework. Hadoop allows for the distributed processing 
of large data sets across clusters of computers using simple programming models. 
It is designed to scale up from single servers to thousands of machines.
"""

# ----- Map Step -----
def map_function(text):
    # Normalize text (lowercase, remove punctuation)
    words = text.lower().replace('.', '').replace(',', '').split()
    mapped = []
    for word in words:
        mapped.append((word, 1))
    return mapped

# ----- Shuffle & Sort (Group by key) -----
def shuffle_sort(mapped_data):
    grouped = defaultdict(list)
    for word, count in mapped_data:
        grouped[word].append(count)
    return grouped

# ----- Reduce Step -----
def reduce_function(grouped_data):
    reduced = {}
    for word, counts in grouped_data.items():
        reduced[word] = sum(counts)
    return reduced

# ----- Execute MapReduce -----
mapped_data = map_function(text)
grouped_data = shuffle_sort(mapped_data)
reduced_data = reduce_function(grouped_data)

# ----- Output -----
for word, count in sorted(reduced_data.items()):
    print(f"{word}: {count}")
