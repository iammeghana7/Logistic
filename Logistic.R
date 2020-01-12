data(mtcars)
dat <- subset(mtcars, select=c(mpg, am, vs))
logr_vm <- glm(vs ~ mpg, data=dat, family=binomial)
logr_vm <- glm(vs ~ mpg, data=dat, family=binomial(link="logit"))
library(ggplot2)
ggplot(dat, aes(x=mpg, y=vs)) + geom_point() + stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
 
par(mar = c(4, 4, 1, 1)) # Reduce some of the margins so that the plot fits better
plot(dat$mpg, dat$vs)
curve(predict(logr_vm, data.frame(mpg=x), type="response"), add=TRUE) 