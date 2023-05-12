P <- function(x) {
  return (log10(1 + (1 / x)))
}

result1 = P(1) + P(7)

count = 0
for (i in 2:22) {
  num_digits = floor(log10(2 ** i)) + 1
  first_digit = floor((2 ** i) / (10 ** (num_digits - 1)))
  
  if (first_digit == 1 || first_digit == 7) {
    count = count + 1
  }
}

result2 = count / (22 - 2 + 1)

abs(result1 - result2) # 0.07330766
