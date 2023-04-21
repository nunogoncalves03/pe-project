#install.packages("ggplot2")
library("ggplot2")

data = read.csv("./question03/data.txt", sep = "\t", header = TRUE)

data = data[data$IND == "EMP3" & data$Time == 2010 & data$Country == "Lithuania", ]
data = data[data$Sex %in% c("Men", "Women") & data$Age.Group %in% c("15-24", "25-54", "55-64"), ]  

ggplot(data, aes(x=Age.Group, y=Value, fill=data$Sex)) +
  geom_bar(position='dodge', stat='identity') +
  scale_fill_manual(values=c('blue','red'),
                    name="Legend") +
  xlab("Age group") +
  ylab("EMP3 (%)")
