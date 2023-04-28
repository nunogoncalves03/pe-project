set.seed(1384)

# 1
e = rexp(4464, rate=2)

# 2
s = cumsum(e)

t = ceiling(s[4464])

# 3
x_values = seq(0, t, by=1)

hist_data = hist(x=s, breaks=x_values, plot=FALSE)

# 4
avg = mean(hist_data$counts)

avg_teorico = 2

abs_dev = abs(avg - avg_teorico) # 0.0169
