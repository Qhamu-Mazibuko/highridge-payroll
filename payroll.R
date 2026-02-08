# Payroll Program for Highridge Construction Company

# STEP 1 & 2: Create 400 workers dynamically
set.seed(123)

workers <- data.frame(
  id = paste("Worker", 1:400),
  salary = sample(5000:35000, 400, replace = TRUE),
  gender = sample(c("Male", "Female"), 400, replace = TRUE)
)

cat("Workers created successfully.\n\n")

# STEP 3, 4 & 5: Generate payment slips with conditions
tryCatch({

  for (i in 1:nrow(workers)) {

    salary <- workers$salary[i]
    gender <- workers$gender[i]

    # Conditions for employee level
    if (salary > 10000 && salary < 20000) {
      level <- "A1"
    } else if (salary > 7500 && salary < 30000 && gender == "Female") {
      level <- "A5-F"
    } else {
      level <- "Standard"
    }

    # Print payment slip
    cat("------ PAYMENT SLIP ------\n")
    cat("Worker ID:", workers$id[i], "\n")
    cat("Salary:", salary, "\n")
    cat("Gender:", gender, "\n")
    cat("Employee Level:", level, "\n")
    cat("--------------------------\n\n")
  }

}, error = function(e) {
  cat("An error occurred:", e$message)
})
