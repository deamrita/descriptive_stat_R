#Catergorical Data
library(MASS)
View(painters)
painters$School

school = painters$School

#frequency
school.freq = table(school) 
school.freq
cbind(school.freq)

#relative frequency(frequency/sample size)
rel_frq <- school.freq/nrow(painters)
rel_frq #sum of all is always 1 
old = options(digits = 1)
rel_frq
options(old)

#barplot
barplot(school.freq)
colors = c("red","blue","green","yellow","pink","cyan","orange","black")
barplot(school.freq,col=colors)

#pieplot
pie(school.freq)
pie(school.freq,col = colors)

#summary
c_school <- school == "C"
c_school
c_painter <- painters[c_school,]
c_painter
mean(c_painter$Drawing)

#tapply
tapply(painters$Drawing, painters$School, mean)
tapply(painters$Drawing, painters$School, sd)
tapply(painters$Drawing, painters$School, range)
tapply(painters$Drawing, painters$School, IQR) #outlier detection

barplot(tapply(painters$Drawing, painters$School, sd))

#Quantitative data
View(faithful)
str(faithful)
sum(is.na(faithful))

duration <- faithful$eruptions
range(duration)

#creating bins
breaks = seq(1.6,5.1,by=0.4)
breaks
duration.bucket <- cut(duration, breaks, right=FALSE)
duration.bucket <- table(duration.bucket)

barplot(duration.bucket,col= colors)
hist(duration)

#relative freq
duration
breaks
duration.bucket
rel_feq<- duration.bucket/nrow(faithful)
rel_feq

#cumulative freq
cum.freq <- cumsum(duration.bucket)
cbind(cum.freq)
cumsumfreq0=c(0,cumsum(duration.bucket))


#plotting
plot(breaks,cumsumfreq0,main = "Old Faithful Eraptions", xlab = "Duration(min)", 
     ylab = "cumulative summation")
lines(breaks,cumsumfreq0)

#steam and leaf plot reverse of histogram
stem(duration)

#scatter plot
duration = faithful$eruptions
waiting = faithful$waiting
plot(duration,waiting)






















