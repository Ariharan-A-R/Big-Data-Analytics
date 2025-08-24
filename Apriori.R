# Install if not already
# install.packages("arules")

library(arules)

# Sample dataset
transactions <- list(
  c("milk","bread","eggs"),
  c("bread","butter"),
  c("milk","bread","butter","eggs"),
  c("milk","bread"),
  c("bread","butter","eggs")
)

# Convert to transactions
txn <- as(transactions, "transactions")

# Summary
summary(txn)

# Run Apriori
rules <- apriori(txn, parameter = list(supp = 0.4, conf = 0.7))

# Inspect rules
inspect(rules)
