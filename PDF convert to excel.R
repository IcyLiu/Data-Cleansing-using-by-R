library(tm)
# Read the PDF file
pdf <- "2017江苏省-南京市-药品目录.pdf"
doc <- readPDF(control = list(text = "-layout"))(elem = list(uri = pdf),language = 'en',id='id1')
doc <- gsub(' +', ' ', doc)
out <- read.csv(textConnection(doc), header=FALSE)

data <- read.table("2017江苏省-南京市-药品目录.txt",header=F,sep = " ",na.strings = "NA",blank.lines.skip = FALSE)
data1 <- as.vector(data)
for (i in 1:length(data1)){
  if (data1[i]=="" & data1[i+2]!=""){
    data1[i+1] <- paste(data1[i+1],data1[i+2],sep="")
    data1 <- data1[-(i+2)]
  }
}
for (i in 1:nrow(data1)){
  if (data1[i]=="" & data1[i+2]!=""){
    data1[i+1] <- paste(data1[i+1],data1[i+2],sep="")
    data1 <- data1[-(i+2)]
  }
}
data2 <- data1(data1[i]!="")
aa<-as.data.frame(data1)
data1[7] <- paste(data1[7],data1[8],sep="")



write.csv(aa, "PDF convert to excel.csv")
data <- read.csv("PDF convert to excel.csv", header=F)


newdata<-data.frame(matrix(newdata,ncol=10))




