bps <- c(2,5, 10, 15, 20, 25,30,35)
risk0 <- c(2,2,2,2,2,2,2,2)
risk9 <- c(17,7,5,4,4,4,4,4)
risk10 <- c(19,7,5,5,4,4,4,4)
risk11 <- c(20,8,6,5,5,4,4,4)
risk12 <- c(22,8,5,5,5,5,5,4)

pch0 <- 5
pch9 <- 1
pch10 <- 2
pch11 <- 3
pch12 <- 4

lty0 <- 9
lty9 <- 1
lty10 <- 2
lty11 <- 3
lty12 <- 4

col0 <- "gray"
col9 <- "magenta"
col10 <- "cyan"
col11 <- "orange"
col12 <- "green"

opar <- par(no.readonly = TRUE)
par(pin=c(6.47,4))
par(lwd=2, cex=1.5, font.lab=2)

par(lty=lty9,pch=pch9,col.axis=2,fg=rgb(0,0,1),cex=1)
plot(bps,risk9,type="b",xlab='x:blocks per second',ylab='y:time(s)',ylim=c(0,23),
     main='Confirmation time',sub='Spectre',col=col9)

lines(bps,risk0,type="b",lty=lty0,pch=pch0,col=col0)
lines(bps,risk10,type="b",lty=lty10,pch=pch10,col=col10)
lines(bps,risk11,type="b",lty=lty11,pch=pch11,col=col11)
lines(bps,risk12,type="b",lty=lty12,pch=pch12,col=col12)

mtext("risk=0%",side=4,line=1,cex.lab=1,las=2,col="gray")

legLty <- c(lty0,lty9,lty10,lty11,lty12)
legPch <- c(pch0,pch9,pch10,pch11,pch12)
legCol <- c(col0,col9,col10,col11,col12)
legend("topright",inset=.02,title="Attacker’s power",c("0%","9%","10%","11%","12%"),lty=legLty,pch=legPch,col=legCol)
par(opar)

