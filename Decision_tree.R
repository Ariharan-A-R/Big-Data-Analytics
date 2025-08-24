# Install packages if needed
# install.packages("rpart")
# install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

# Load dataset
data(iris)

# Build decision tree
model <- rpart(Species ~ ., data = iris, method = "class")

# Print summary
print(model)

# Plot decision tree
rpart.plot(model, type = 3, extra = 101, fallen.leaves = TRUE)

# Predictions
pred <- predict(model, iris, type = "class")

# Accuracy
mean(pred == iris$Species)
