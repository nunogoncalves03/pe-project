set.seed(1461)

m = 2691
n = 16

soma_quadrados = c()
for (i in 1:m) {
  sample = rnorm(n, 0, 1)
  soma_quadrados = c(soma_quadrados, sum(sapply(sample, function(x) x ** 2)))
}

result1 = quantile(soma_quadrados, probs = 0.22, type = 2)
result2 = qchisq(0.22, df = n)

abs(result1 - result2) # 0.0345
