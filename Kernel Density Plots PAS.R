## Kernel Density Plots

d <- density(df$p4pa1sis) # returns the density data 
plot(d, main="Frequ�ncica PAS")
polygon(d, col="green", border="blue")