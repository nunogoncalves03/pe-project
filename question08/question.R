set.seed(1626)

n = 179

ordered_sample = sort(rcauchy(n, location = -3.8, scale = 1.2))

sample2 = c()
for (i in 1:179) {
  sample2 = c(sample2, qcauchy(i / (179 + 1), location = -3.8, scale = 1.2))
}

sample3 = c()
for (i in 1:179) {
  sample3 = c(sample3, qnorm(i / (179 + 1), mean = 2.3, sd = sqrt(2.4)))
}

x = 1:179

plot(x, type = "n", xlab = "", ylab = "", main = "Question 08 Plot")

lines(x, ordered_sample, type = "l", col = "blue")
lines(x, sample2, type = "l", col = "red")
lines(x, sample3, type = "l", col = "green")
lines(x, x, type = "l", col = "purple")
legend("topleft", legend = c("Ordered Sample", "Cauchy quantiles", "Normal quantiles", "Bisector of odd-numbered quadrants"), col = c("blue", "red", "green", "purple"), lty = 1)
