# Load iris dataset
data(iris)

# Train/Test split
set.seed(42)
index <- sample(1:nrow(iris), 0.7*nrow(iris))
train <- iris[index, ]
test  <- iris[-index, ]

# Gaussian probability density function
gaussian_prob <- function(x, mean, sd) {
  exp(-((x - mean)^2) / (2 * sd^2)) / (sqrt(2 * pi) * sd)
}

# Training function
naive_bayes_train <- function(data, target) {
  classes <- unique(data[[target]])
  model <- list()
  
  for (cls in classes) {
    subset <- data[data[[target]] == cls, ]
    probs <- list()
    
    for (feature in names(data)[names(data) != target]) {
      probs[[feature]] <- list(
        mean = mean(subset[[feature]]),
        sd = sd(subset[[feature]])
      )
    }
    model[[cls]] <- list(priors = nrow(subset)/nrow(data), features = probs)
  }
  return(model)
}

# Prediction function
naive_bayes_predict <- function(model, data) {
  preds <- c()
  for (i in 1:nrow(data)) {
    posteriors <- c()
    for (cls in names(model)) {
      prior <- log(model[[cls]]$priors)
      likelihood <- 0
      for (feature in names(data)) {
        if (feature %in% names(model[[cls]]$features)) {
          mean_val <- model[[cls]]$features[[feature]]$mean
          sd_val   <- model[[cls]]$features[[feature]]$sd
          likelihood <- likelihood + log(gaussian_prob(data[i, feature], mean_val, sd_val))
        }
      }
      posteriors[cls] <- prior + likelihood
    }
    preds <- c(preds, names(which.max(posteriors)))
  }
  return(preds)
}

# Train model
model <- naive_bayes_train(train, "Species")

# Predictions
pred <- naive_bayes_predict(model, test[, -5])

# Accuracy
acc <- mean(pred == test$Species)
cat("✅ Naive Bayes Accuracy:", round(acc*100, 2), "%\n\n")

# Show Confusion Matrix
cat("📊 Confusion Matrix:\n")
print(table(Predicted = pred, Actual = test$Species))

# Show first 10 predictions vs actual
cat("\n🔎 Sample Predictions (first 10):\n")
print(data.frame(Actual = test$Species[1:10], Predicted = pred[1:10]))
