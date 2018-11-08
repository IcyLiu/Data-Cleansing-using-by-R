setwd("~/")
data <- read.table("onlyfortesting.csv", header=TRUE, sep=",", na.strings = "", blank.lines.skip=F)
dt <- subset(data,select=-c(满期处理状态,险种当前保全处理ID,免赔额起付标准,职业开始加费类型,职业加费年期,
                                  次标体加费年期,残疾开始加费类型,残疾加费年期,个险的组织业务类别,工作大区,
                                  工作单位性质代码,工作单位性质,社会保障号,工作单位社保登记号,核保限制档次,
                                  险种核保决定说明,续保决定说明,续保决定原因代码,付款方式,理赔结论,是否发生调查,
                                  是否发生问题件,是否发生二核,赔付类别,责任理算金额,正常赔付金额,协议赔付金额,
                                  通融赔付金额,本次赔付金额,已赔付金额,拒赔金额,险种赔付金额合计))

library(VIM)
a <- head(sleep)
is.na(a)
complete.cases(a) #查看行是否完整
nrow(na.omit(sleep)) #查看行没有缺失值的行数
nrow(sleep)-nrow(na.omit(sleep)) #查看缺失值的行数
nrow(sleep[!complete.cases(sleep),]) #查看缺失值的行数
nrow(sleep[!complete.cases(sleep),])/nrow(sleep) #查看缺失值的占比
nrow(sleep[!complete.cases(sleep$Dream),])/nrow(sleep) #查看Dream这一列缺失值的占比
sum(!complete.cases(sleep$Dream))/nrow(sleep)

new <- data[,-which(colMeans(is.na(data))>0.9)]


dt <- data[complete.cases(data[,19:22]),]
