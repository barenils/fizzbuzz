if (!requireNamespace("microbenchmark", quietly = TRUE)) {
  # If not installed, install the 'microbenchmark' package
  install.packages("microbenchmark")
}


library(microbenchmark)

fizzbuzz <- function(len_fizz) { # Original fizzbuzz which does not save output 
  for (i in 1:len_fizz) {
    if (i %% 3 == 0 && i %% 5 == 0) {
      print("FizzBuzz")
    } else if (i %% 3 == 0) {
      print("Fizz")
    } else if (i %% 5 == 0) {
      print("Buzz")
    } else {
      print(i)
    }
  }
}

fizzbuzz_output <- function(len_fizz) {
  results <- vector("character", len_fizz)
  
  for (i in 1:len_fizz) {
    if (i %% 3 == 0 && i %% 5 == 0) {
      results[i] <- "FizzBuzz"
    } else if (i %% 3 == 0) {
      results[i] <- "Fizz"
    } else if (i %% 5 == 0) {
      results[i] <- "Buzz"
    } else {
      results[i] <- as.character(i)
    }
  }
  print(results)
  #return(results)
}

fizz_vectorized <- function(len_fizz) {
    range = 1:len_fizz
    three = range %% 3 == 0
    five = range %% 5 == 0
    
    out <- ifelse(three & five, "FizzBuzz",
                      ifelse(three, "Fizz",
                             ifelse(five, "Buzz", as.character(range))))
    print(out)
    #return(out)
}

benchmark_result <- microbenchmark(
  loop = fizzbuzz(100),
  loop_output = fizzbuzz_output(100),
  vector = fizz_vectorized(100),
  times = 100
)

all.equal(fizzbuzz_output(100), fizz_vectorized(100))
print(benchmark_result)