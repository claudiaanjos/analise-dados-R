#dataset
attach(aulas)

#command enter na linha = run
section_id
options(max.print = 20)
head(section_id)
sort(section_id, decreasing = TRUE)

#linha, coluna
aulas[33137, 3] <- 3255
sort(aulas$section_id, decreasing = TRUE)
aulas[33137, 3]

#valores únicos
unique(aulas$section_id)

#nesting - aninhamento de funções
length(unique(aulas$section_id))

table(aulas$section_id)
#ordenção pela quantidade de vezes que o vídeo foi assistido
sort(table(aulas$section_id))

sort(table(aulas$course_id))

#biblioteca com a função count
install.packages("plyr")
library(plyr)

#criar um novo banco de dados
auxiliar <- count(aulas, vars = "course_id")

write.csv(auxiliar, "popularidade_cursos.csv")
write.csv(auxiliar, "Documents/cursoR/popularidade_cursos2.csv")









