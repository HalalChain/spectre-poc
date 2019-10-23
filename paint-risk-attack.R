bps <- c(2,10, 20, 30, 40, 50)
risk9 <- c(95,23,5,1,0,0)
risk10 <- c(96,36,14,7,3,2)
risk11 <- c(97,50,27,18,13,10)
risk12 <- c(98,59,44,34,29,25)

pch9 <- 1
pch10 <- 2
pch11 <- 3
pch12 <- 4

lty9 <- 1
lty10 <- 2
lty11 <- 3
lty12 <- 4

col9 <- "magenta"
col10 <- "cyan"
col11 <- "orange"
col12 <- "green"

opar <- par(no.readonly = TRUE)
par(pin=c(6.47,4))
par(lwd=2, cex=1.5, font.lab=2)

par(lty=lty9,pch=pch9,col.axis=2,fg=rgb(0,0,1),cex=1)
plot(bps,risk9,type="b",xlab='x:blocks per second',ylab='y:risk(%)',ylim=c(0,100),
     main='Attack success rate',sub='Spectre',col=col9)


lines(bps,risk10,type="b",lty=lty10,pch=pch10,col=col10)
lines(bps,risk11,type="b",lty=lty11,pch=pch11,col=col11)
lines(bps,risk12,type="b",lty=lty12,pch=pch12,col=col12)

mtext("wait time=2(s)",side=4,line=1,cex.lab=1,las=2,col="gray")

legLty <- c(lty9,lty10,lty11,lty12)
legPch <- c(pch9,pch10,pch11,pch12)
legCol <- c(col9,col10,col11,col12)
legend("topright",inset=.02,title="Attacker’s power",c("9%","10%","11%","12%"),lty=legLty,pch=legPch,col=legCol)
par(opar)

