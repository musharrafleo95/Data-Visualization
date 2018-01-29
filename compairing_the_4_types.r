library(ggplot2)
library(tidyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI1<-NEI[NEI$fips=="24510",]
point<-NEI1[NEI1$type=="POINT",c("Emissions","year")]
onRoad<-NEI1[NEI1$type=="ON-ROAD",c("Emissions","year")]
nonRoad<-NEI1[NEI1$type=="NON-ROAD",c("Emissions","year")]
nonpoint<-NEI1[NEI1$type=="NONPOINT",c("Emissions","year")]
point<-tapply(point$Emissions,point$year,mean)
nonpoint<-tapply(nonpoint$Emissions,nonpoint$year,mean)
onRoad<-tapply(onRoad$Emissions,onRoad$year,mean)
nonRoad<-tapply(nonRoad$Emissions,nonRoad$year,mean)
x<-data.frame(point,nonpoint,onRoad,nonRoad)
year<-unique(NEI1$year)
x<-cbind(year,x)
k<-gather(x,type,Emissions,-year)
g<-ggplot(k,aes(year,Emissions))
g+geom_point(aes(color=type))+geom_smooth(aes(color = type))+labs(title = "compairing the 4 types",y="mean of Emission")
dev.copy(png,file="compairing the 4 types.png")
dev.off()