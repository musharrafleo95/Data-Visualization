NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
BaltCity<-subset(NEI,fips=="24510",select = c(Emissions,year))
x1<-BaltCity[BaltCity$year==1999,"Emissions"]
x2<-BaltCity[BaltCity$year==2002,"Emissions"]
x3<-BaltCity[BaltCity$year==2005,"Emissions"]
x4<-BaltCity[BaltCity$year==2008,"Emissions"]
plot(1999,log10(median(x1)),xlim = c(1998,2009),ylim = c(-1.5,-0.5),pch=19,col="blue",xlab = "year",ylab = "log10 of medians")
points(2002,log10(median(x2)),pch=19,col="green")
points(2005,log10(median(x3)),pch=19,col="yellow")
points(2008,log10(median(x4)),pch=19)
segments(1999,log10(median(x1)),2002,log10(median(x2)))
segments(2002,log10(median(x2)),2005,log10(median(x3)))
segments(2005,log10(median(x3)),2008,log10(median(x4)))
title(main = "PM2.5 of Maryland through different years")
legend("topright",legend = c("1999","2002","2005","2008"),pch = 19,col = c("blue","green","yellow","black"))
dev.copy(png,file="compairing PM2.5 of maryland with years.png")
dev.off()