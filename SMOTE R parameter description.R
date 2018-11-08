## A small example with a data set created artificially from the IRIS
## data
data(iris)
SMOTE <- iris[, c(1, 2, 5)]
SMOTE$Species <- factor(ifelse(SMOTE$Species == "setosa","rare","common"))
## checking the class distribution of this artificial data set
table(SMOTE$Species)
## ������Ϊcommon����100��������������Ϊrare����50��������
## now using SMOTE to create a more "balanced problem"
## ����˵����
## perc.over ������600/100,6��������������������6*50=300��������������ԭ����50����������350������
## perc.under Ƿ����100/100��1�����Ӷ������г�ȡ300*1��������
## perc.over = xx ��ʾ ���������ԭ���ģ�1+xx/100���� 
## perc.under=yy ��ʾ����������������� yy/100 *(xx/100)��
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