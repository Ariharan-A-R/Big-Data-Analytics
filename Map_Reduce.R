# Input data
lines <- c("Hello world", "Hello Hadoop")

# Map step: split into words
words <- unlist(strsplit(tolower(lines), " "))

# Create key-value pairs
mapped <- data.frame(word = words, value = 1)

# Reduce step: aggregate counts
result <- aggregate(value ~ word, data=mapped, sum)

print(result)
