set.seed(1713)

p = 0.45

N = 1194

Fx <- function(q) {
  return (pgeom(q, prob = p))
}

generate_value <- function() {
  val = runif(1, min=0, max=1)
  
  x = 0
  while (val > Fx(x) | val <= Fx(x-1)) {
    x = x + 1
  }
  
  return (x)
}

sample <- vector("numeric", length = 0)

# gerar amostra com 1194 valores
while(length(sample) < N) {
  new_val = generate_value()
  sample <- c(sample, new_val)
}

avg = mean(sample)
sdev = sd(sample)

soma = avg + sdev
above_avg_count = sum(sample > avg)
above_soma_count = sum(sample > soma)

pp = above_soma_count/above_avg_count # 0.5368
