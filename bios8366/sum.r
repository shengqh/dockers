args <- commandArgs(trailingOnly = TRUE)

# Check that the correct number of arguments were passed
if (length(args) != 2) {
	  stop("Usage: script_name.R arg1 arg2")
}

# Assign the arguments to variables
arg1 <- args[1]
arg2 <- args[2]

# Print out the arguments
cat("Argument 1:", arg1, "\n")
cat("Argument 2:", arg2, "\n")

# Do something with the arguments (e.g. calculate their sum)
sum <- as.numeric(arg1) + as.numeric(arg2)
cat("The sum of the arguments is:", sum, "\n")

