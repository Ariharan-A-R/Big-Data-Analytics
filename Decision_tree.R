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

# Install required packages if not installed
# install.packages("rpart")
# install.packages("rpart.plot")

library(rpart)
library(rpart.plot)

# -----------------------------
# 1. Load your own dataset
# -----------------------------

# Example: read from CSV
# mydata <- read.csv("yourfile.csv")

# OR: Create a small dataset manually
mydata <- data.frame(
  Age = c(22, 25, 47, 52, 46, 56, 55, 60, 62, 61),
  Income = c(21000, 25000, 52000, 48000, 60000, 72000, 80000, 85000, 90000, 95000),
  Student = c("No", "Yes", "No", "No", "Yes", "No", "Yes", "Yes", "No", "Yes"),
  Buy = c("No", "No", "Yes", "Yes", "Yes", "No", "Yes", "Yes", "Yes", "Yes")
)

# Convert categorical variables to factors
mydata$Student <- as.factor(mydata$Student)
mydata$Buy <- as.factor(mydata$Buy)   # Target variable must be factor

# -----------------------------
# 2. Build decision tree
# -----------------------------
model <- rpart(Buy ~ Age + Income + Student, data = mydata, method = "class")

# Print summary
print(model)

# -----------------------------
# 3. Plot decision tree
# -----------------------------
rpart.plot(model, type = 3, extra = 101, fallen.leaves = TRUE)

# -----------------------------
# 4. Predictions
# -----------------------------
pred <- predict(model, mydata, type = "class")

# -----------------------------
# 5. Accuracy
# -----------------------------
accuracy <- mean(pred == mydata$Buy)
print(paste("Accuracy:", accuracy))
