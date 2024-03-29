##Histograma com Curva normal da PA Sist�lica 1

x <- df$p4pa1sis
h<-hist(x, breaks=20, col="green", xlab="Press�o Arterial Sist�lica 1", ylab="Frequ�ncia",
        main="Histograma e Curva PA1S") 
xfit<-seq(min(x),max(x),length=100) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) 
lines(xfit, yfit, col="blue", lwd=2)