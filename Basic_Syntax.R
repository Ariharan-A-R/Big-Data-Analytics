#######################################
# R Programming - Basic Syntax Explorer
#######################################

# 1. Print and Comments
print("Hello, R World!")   # Single-line comment
# Multi-line comments are usually written like this:
# This is line 1
# This is line 2

# 2. Variables and Assignment
x <- 10   # preferred way
y = 20    # also valid
z <<- 30  # global assignment
print(paste("x:", x, "y:", y, "z:", z))

# 3. Data Types
num <- 3.14       # numeric
int <- 42L        # integer
char <- "R Lang"  # character
bool <- TRUE      # logical
comp <- 2 + 3i    # complex
print(class(num)); print(class(int)); print(class(char))
print(class(bool)); print(class(comp))

# 4. Vectors
v1 <- c(1,2,3,4,5)   # numeric vector
v2 <- c("a","b","c") # character vector
print(v1); print(v2)

print("Sequence")
seq1 <- 1:10
seq2 <- seq(1,20, by=2)
print(seq1); print(seq2)

# Replicate
rep1 <- rep(5, times=4)
print(rep1)

# 5. Operators
a <- 15; b <- 4
print(a + b)   # addition
print(a - b)   # subtraction
print(a * b)   # multiplication
print(a / b)   # division
print(a %% b)  # modulus
print(a %/% b) # integer division
print(a ^ b)   # power

# Logical
print(a > b); print(a < b); print(a == b); print(a != b)

# 6. Data Structures
# Vector
vec <- c(1,2,3)

# Matrix
mat <- matrix(1:9, nrow=3, ncol=3)
print(mat)

# Array
arr <- array(1:12, dim=c(2,3,2))
print(arr)

# List
lst <- list(name="Raju", age=25, scores=c(80,90,85))
print(lst)

# Data Frame
df <- data.frame(ID=1:3, Name=c("A","B","C"), Score=c(90,85,88))
print(df)

# Factor
fact <- factor(c("High","Low","Medium","High"))
print(fact)

# 7. Control Structures
# If-else
val <- 15
if(val > 10){
  print("Greater than 10")
} else {
  print("10 or less")
}

# For loop
for(i in 1:5){
  print(paste("Loop i =", i))
}

# While loop
count <- 1
while(count <= 3){
  print(paste("Count =", count))
  count <- count + 1
}

# Switch
choice <- "B"
result <- switch(choice,
                 "A" = "Option A selected",
                 "B" = "Option B selected",
                 "C" = "Option C selected",
                 "Invalid choice")
print(result)

# 8. Functions
add_nums <- function(a, b){
  return(a + b)
}
print(add_nums(5,7))

# Default arguments
greet <- function(name="User"){
  print(paste("Hello", name))
}
greet()
greet("Raju")

# 9. Apply Family
nums <- c(1,2,3,4,5)
print(lapply(nums, function(x) x^2))   # list apply
print(sapply(nums, function(x) x^2))   # simplified apply
print(apply(mat, 1, sum))              # row sum of matrix
print(apply(mat, 2, mean))             # column mean

# 10. Basic Plot
plot(1:10, main="Basic Plot Example", col="blue", pch=19)

#######################################
# End of R Syntax Exploration
#######################################
