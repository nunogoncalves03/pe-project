set.seed(1626)

n = 179

ordered_sample = sort(rcauchy(n, location = -3.8, scale = 1.2))

sample2 = c()
for (i in 1:n) {
  sample2 = c(sample2, qcauchy(i / (n + 1), location = -3.8, scale = 1.2))
}

sample3 = c()
for (i in 1:n) {
  sample3 = c(sample3, qnorm(i / (n + 1), mean = 2.3, sd = sqrt(2.4)))
}



plot(-40:40, -40:40, type = "l", xlab = "Quantiles", ylab = "Ordered Cauchy distribution sample", xlim=c(-20,20), ylim=c(-40,40), main = "Question 08 Plot")

abline(v = 0, col=rgb(0, 0, 0, alpha=0.2))  # linha x = 0
abline(h = 0, col=rgb(0, 0, 0, alpha=0.2)) # linha y = 0

lines(sample2, ordered_sample, type = "p", pch=20, col = "#db4861")
lines(sample3, ordered_sample, type = "p", pch=20, col = "#68a4d9")

legend("topleft", legend = c("Cauchy quantiles", "Normal quantiles", "Bisector of odd-numbered quadrants"), col = c("#db4861", "#68a4d9", "black"), lty = 1)
