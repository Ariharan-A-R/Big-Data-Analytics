# Generate sample data
set.seed(42)
x <- rbind(
  matrix(rnorm(100, mean=0), ncol=2),
  matrix(rnorm(100, mean=3), ncol=2),
  matrix(rnorm(100, mean=6), ncol=2)
)
colnames(x) <- c("x1", "x2")

# Run KMeans with 3 clusters
km <- kmeans(x, centers=3, nstart=20)

# Print results
print(km$centers)

# Plot
plot(x, col=km$cluster, pch=19, main="K-Means Clustering in R")
points(km$centers, col=1:3, pch=8, cex=2)  # cluster centers
