setwd("~/")
data <- read.table("onlyfortesting.csv", header=TRUE, sep=",", na.strings = "", blank.lines.skip=F)
dt <- subset(data,select=-c(���ڴ���״̬,���ֵ�ǰ��ȫ����ID,������𸶱�׼,ְҵ��ʼ�ӷ�����,ְҵ�ӷ�����,
                                  �α���ӷ�����,�м���ʼ�ӷ�����,�м��ӷ�����,���յ���֯ҵ�����,��������,
                                  ������λ���ʴ���,������λ����,��ᱣ�Ϻ�,������λ�籣�ǼǺ�,�˱����Ƶ���,
                                  ���ֺ˱�����˵��,��������˵��,��������ԭ�����,���ʽ,�������,�Ƿ�������,
                                  �Ƿ��������,�Ƿ�������,�⸶���,����������,�����⸶���,Э���⸶���,
                                  ͨ���⸶���,�����⸶���,���⸶���,������,�����⸶���ϼ�))

library(VIM)
a <- head(sleep)
is.na(a)
complete.cases(a) #�鿴���Ƿ�����
nrow(na.omit(sleep)) #�鿴��û��ȱʧֵ������
nrow(sleep)-nrow(na.omit(sleep)) #�鿴ȱʧֵ������
nrow(sleep[!complete.cases(sleep),]) #�鿴ȱʧֵ������
nrow(sleep[!complete.cases(sleep),])/nrow(sleep) #�鿴ȱʧֵ��ռ��
nrow(sleep[!complete.cases(sleep$Dream),])/nrow(sleep) #�鿴Dream��һ��ȱʧֵ��ռ��
sum(!complete.cases(sleep$Dream))/nrow(sleep)

new <- data[,-which(colMeans(is.na(data))>0.9)]


dt <- data[complete.cases(data[,19:22]),]