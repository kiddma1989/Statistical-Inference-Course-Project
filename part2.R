data<-ToothGrowth
str(data)
head(data)
summary(data)

library(ggplot2)
data$dose<-as.factor(data$dose)
data$supp<-as.factor(data$supp)
p<-ggplot(data,aes(x=supp,y=len))
p<-p+geom_boxplot(aes(fill=supp))
p<-p+facet_wrap(~dose)
p

t.test(data$len[data$supp=='VC'],data$len[data$supp=='OJ'],paired=FALSE)

t.test(data$len[data$dose==0.5],data$len[data$dose==1],paired=FALSE)

t.test(data$len[data$dose==1],data$len[data$dose==2],paired=FALSE)