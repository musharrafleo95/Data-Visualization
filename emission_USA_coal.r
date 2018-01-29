NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
x<-grep("[Cc]oal",SCC$Short.Name)
x<-SCC[x,]
x<-x$SCC
x<-NEI[NEI$SCC %in% x, ]
x<-x[,c("Emissions","year")]
x1999<-x[x$year==1999,1]
x2002<-x[x$year==2002,1]
x2005<-x[x$year==2005,1]
x2008<-x[x$year==2008,1]
plot(1999,mean(x1999),xlim=c(1998,2009),ylim = c(19,60),pch=19,col="brown",xlab = "Years",ylab = "mean of years")
points(2002,mean(x2002),pch=19,col = "yellow")
points(2005,mean(x2005),pch=19,col = "green")
points(2008,mean(x2008),pch=19,col= "orange")
segments(1999,mean(x1999),2002,mean(x2002))
segments(2002,mean(x2002),2005,mean(x2005))
segments(2005,mean(x2005),2008,mean(x2008))
title(main = "PM2.5 changes realated to coal")
legend("topright",legend = c("1999","2002","2005","2008"),pch = 19,col = c("brown","yellow","green","orange"))
dev.copy(png,file="PM2.5 changes realated to coal.png")
dev.off()