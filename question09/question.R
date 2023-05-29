set.seed(1355)

k = 1000

n = c(30, 50, 100, 200, 300, 500, 1000)

p = 0.7

a = 1 - 0.97

diffs_avg = c()

first_method = function(n, avg) {
  z = qnorm((2 - a) / 2, 0, 1)
  coef_a = 1 + ((z^2) / n)
  coef_b = -2 * avg - ((z^2) / n)
  coef_c = avg^2
  binomio_disc = coef_b^2 - (4 * coef_a * coef_c)
  min = (-coef_b - sqrt(binomio_disc)) / (2 * coef_a)
  max =(-coef_b + sqrt(binomio_disc)) / (2 * coef_a)
  
  return (abs(max - min))
}

second_method = function(n, avg) {
  b = qnorm(1 - a/2, 0, 1)
  return (2 * b * sqrt(avg * (1 - avg) / n))
}

for (size in n) {
  diffs = c()
  
  for (i in 1:k) {
    sample = rbinom(n=size, size=1, prob=p)
    sample_avg = mean(sample)
    
    diffs = c(diffs, abs(second_method(size, sample_avg) - first_method(size, sample_avg)))
  }
  
  diffs_avg = c(diffs_avg, mean(diffs))
}

plot(n, diffs_avg, type = "p", pch=20,  xlab = "Sample size", ylab = "Absolute difference",
     main = "First VS Second method", col = "red")

lines(n, diffs_avg, type="l", col="red")
