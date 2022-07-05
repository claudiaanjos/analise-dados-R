library(readr)
duracao <- read_csv("Downloads/datasets/duracao.csv")
View(duracao)

library(plyr)
#renomear colunas
duracao <- rename(duracao, replace = c("user_id"="aluno",
                                       "course_id"="curso",
                                       "timeToFinish"="dias"))

plot(duracao$dias)
#histograma com três barras
hist(duracao$dias, breaks = 3)

#gravando e fechando o arquivo com o gráfico 
jpeg("Documents/cursoR/histograma.jpg")
hist(duracao$dias, breaks = 20, main = "Histograma do Tempo",
     ylab = "Quantidade", xlab = "Tempo", ylim = c(0, 2500),
     col = "blue")
dev.off()

#análise estatística
mean(duracao$dias, na.rm = T)
median(duracao$dias, na.rm = T)

summary(duracao$dias)

#o tamanho da dimensão 1 = número de linhas
dim(duracao)[1]
length(unique(duracao$curso))
length(unique(duracao$aluno))

#media de dias para cada curso
sumario_estatistico <- aggregate(duracao$dias, list(duracao$curso),
                                 mean, na.rm = T)


sumario_estatistico <- rename(sumario_estatistico, replace = 
                                c("Group.1"="curso", "x"="dias"))
popularidade_cursos <- rename(popularidade_cursos, c("course_id"="curso",
                                                     "freq"="popularidade"))


popularidade_e_duracao <- merge(sumario_estatistico,
                                popularidade_cursos, by = 'curso')


plot(popularidade_e_duracao$dias, popularidade_e_duracao$popularidade)


modelo.linear <- lm(popularidade_e_duracao$popularidade~popularidade_e_duracao$dias)

#modelo não linear
abline(lm(popularidade_e_duracao$popularidade~popularidade_e_duracao$dias)
)

scatter.smooth(popularidade_e_duracao$dias, 
               popularidade_e_duracao$popularidade,
               pch = 21, col = 'blue')

#documentação do comando pch
help('pch')

library(ggplot2)

grafico <- ggplot(popularidade_e_duracao, aes(dias, popularidade))
grafico <- grafico + geom_point()
grafico <- grafico + geom_smooth()
grafico


