T<-100
I<-100
e<-matrix(rnorm(T*I), nrow=T)
Y<-matrix(rnorm(T*I)+10, nrow=T)

library(writexl)
write_xlsx(data.frame(Y),"C:/Users/andre/Google Drive/Uninorte/Uninorte-docencia/bookdown/econometrics_pre/Econometria2/Data/Y.xlsx")
