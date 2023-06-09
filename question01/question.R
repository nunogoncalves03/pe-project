#install.packages('readxl')
#install.packages('ggplot2')
library("readxl")
library("ggplot2")

df = read_excel("./question01/econ.xlsx", sheet = 1, col_names = TRUE)
df = df[df["tempo"] >= "1974-01-01", c("tempo", "ddesemp", "gcp")]

df["ddesemp"] = (df["ddesemp"] - mean(df$ddesemp)) / sd(df$ddesemp)
df["gcp"] = (df["gcp"] - mean(df$gcp)) / sd(df$gcp)

ggplot(df, aes(x=tempo)) +
  geom_line(aes(y = ddesemp, color = "ddesemp")) +
  geom_line(aes(y = gcp, color = "gcp")) +
  scale_color_manual(values = c("#68a4d9", "#db4861"),
                     name = "Legenda",
                     labels = c("ddesemp", "gcp")) +
  xlab("Tempo") +
  ylab("")
