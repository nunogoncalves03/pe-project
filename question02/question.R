data = read.csv("./question02/data.csv", sep = ",", header = TRUE)

data = data[data$País != "África do Sul" &
            data$Sexo == "Homens" &
            data$Ocupação %in% c("Cuidados pessoais", "Trabalho remunerado ou estudo"), ]

cuidados_pessoais = data[data$Ocupação == "Cuidados pessoais", ]$Tempo
trabalho_remunerado = data[data$Ocupação == "Trabalho remunerado ou estudo", ]$Tempo
boxplot(cuidados_pessoais, trabalho_remunerado, main = "",
        ylab = "Tempo médio diário (minutos)",
        names = c("Cuidados pessoais", "Trabalho remunerado ou estudo"),
        col = c("#db4861", "#68a4d9"))
