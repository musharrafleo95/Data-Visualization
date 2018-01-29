NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI2<-NEI[NEI$fips=="06037",]
y<-grep("[Vv]ehicle",SCC$Short.Name)
y<-SCC[y,]
y<-y$SCC
y<-NEI2[NEI2$SCC %in% y,]
y<-y[,c("Emissions","year")]
y1999<-y[y$year==1999,1]
y2002<-y[y$year==2002,1]
y2005<-y[y$year==2005,1]
y2008<-y[y$year==2008,1]
plot(1999,mean(y1999),xlim=c(1998,2012),ylim = c(0.5,96),pch=19,xlab = "Years",ylab = "mean of years",col="blue")
points(2002,mean(y2002),pch=19,col="blue")
points(2005,mean(y2005),pch=19,col="blue")
points(2008,mean(y2008),pch=19,col="blue")
segments(1999,mean(y1999),2002,mean(y2002),col="blue")
segments(2002,mean(y2002),2005,mean(y2005),col="blue")
segments(2005,mean(y2005),2008,mean(y2008),col="blue")
NEI1<-NEI[NEI$fips=="24510",]
x<-grep("[Vv]ehicle",SCC$Short.Name)
x<-SCC[x,]
x<-x$SCC
x<-NEI1[NEI1$SCC %in% x,]
x<-x[,c("Emissions","year")]
x1999<-x[x$year==1999,1]
x2002<-x[x$year==2002,1]
x2005<-x[x$year==2005,1]
x2008<-x[x$year==2008,1]
points(1999,mean(x1999),pch=19)
points(2002,mean(x2002),pch=19)
points(2005,mean(x2005),pch=19)
points(2008,mean(x2008),pch=19)
segments(1999,mean(x1999),2002,mean(x2002))
segments(2002,mean(x2002),2005,mean(x2005))
segments(2005,mean(x2005),2008,mean(x2008))
title(main = "PM2.5 changes in Baltimore and Los angeles City")
legend("topright",legend = c("Baltimore","Los Angles"),pch = 19,col = c("black","blue"),lty=1)
dev.copy(png,file="PM2.5 changes in Baltimore and Los angeles City.png")
dev.off()