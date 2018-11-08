## A small example with a data set created artificially from the IRIS
## data
data(iris)
SMOTE <- iris[, c(1, 2, 5)]
SMOTE$Species <- factor(ifelse(SMOTE$Species == "setosa","rare","common"))
## checking the class distribution of this artificial data set
table(SMOTE$Species)
## 少数类为common，共100个样本；多数类为rare，共50个样本。
## now using SMOTE to create a more "balanced problem"
## 参数说明：
## perc.over 过采样600/100,6倍，则少数类样本生成6*50=300个新样本，加上原来的50个样本共计350个样本
## perc.under 欠采样100/100，1倍，从多数类中抽取300*1个新样本
## perc.over = xx 表示 少样本变成原来的（1+xx/100）倍 
## perc.under=yy 表示多样本变成少样本的 yy/100 *(xx/100)倍
library(DMwR)
newSMOTE <- SMOTE(Species ~ ., SMOTE, perc.over = 600,perc.under = 100)
table(newSMOTE$Species)
## Checking visually the created data
## Not run:
par(mfrow = c(1, 2))
plot(data[, 1], data[, 2], pch = 19 + as.integer(data[, 3]),
     main = "Original Data")
plot(newData[, 1], newData[, 2], pch = 19 + as.integer(newData[,3]),
     main = "SMOTE'd Data")
## End(Not run)
## Now an example where we obtain a model with the "balanced" data
classTree <- SMOTE(Species ~ ., data, perc.over = 600,perc.under = 100,
                   learner='rpartXse',se=0.5)
## check the resulting classification tree
classTree
## The tree with the unbalanced data set would be
rpartXse(Species ~ .,data,se=0.5)