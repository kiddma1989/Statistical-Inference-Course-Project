library(ggplot2)
set.seed(100191)
n<-40
lambda<-0.2
nTest<-1000
exp<-matrix(rexp(n * nTest, lambda),nTest)
mns<-rowMeans(exp)

sampleMean<-mean(mns)
theoMean<-1/lambda

sampleVar<-var(mns)
theoVar<-(1/lambda)^2/n

sampleSd<-sd(mns)
theoSd<-1/(lambda*sqrt(n))

data<-data.frame(mns)
p<-ggplot(data,aes(x=mns))
p<-p+geom_histogram(aes(y=..density..),color='black',fill='lightblue')
p<-p+labs(title = 'Means Distribution',x = 'Means of 40 Samples', y = 'Density')
p<-p+geom_vline(aes(xintercept = sampleMean),color='red')
p<-p+geom_vline(aes(xintercept = theoMean),color='black')
p<-p+stat_function(fun = dnorm,args = list(mean=theoMean,sd=theoSd),color='black',size=1.0)
p<-p+stat_function(fun = dnorm,args = list(mean=sampleMean,sd=sampleSd),color='red',size=1.0)
p


