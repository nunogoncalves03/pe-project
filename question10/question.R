set.seed(615)

var = 4

u0 = 71.4

a = 0.1

m = 100

n = 31

u_samples = 72.6

total_accepted = 0

t0 = function(avg) {
  return ((avg - u0) / (sqrt(var / n)))
}

max_rc = qnorm(p = 1 - a/2, 0, 1)
min_rc = - max_rc

for (i in 1:m) {
  sample = rnorm(n=n, mean=u_samples, sd=sqrt(var))
  
  avg = mean(sample)
  
  if (t0(avg) > min_rc & t0(avg) < max_rc) {
    total_accepted = total_accepted + 1
  }
}

p_not_reject_H0 = total_accepted / m # 0.03
