# 7장 리뷰

getwd()

dataset <- read.csv("./data/dataset.csv", header=T)
head(dataset)
#header 포함 ,index 포함x > db연계되면 복합키 될 수 있음.
dataset2 <- subset(dataset, price >=2 & price <=8)
#subset(원천소스, 조건)
str(dataset2)
pos <- dataset2$position
cpos <- 6-pos #굳이 왜? 등급 헷갈리지 않게 하려고 

View(dataset2)

dataset2$position <-cpos
dataset2$position <-cpos[dataset2$position ==1] <-'1급'
dataset2$position <-cpos[dataset2$position ==2] <-'2급'
dataset2$position <-cpos[dataset2$position ==3] <-'3급'
dataset2$position <-cpos[dataset2$position ==4] <-'4급'
dataset2$position <-cpos[dataset2$position ==5] <-'5급'
dataset2 <-subset(dataset2, !is.na(dataset2$resident))
head(dataset2)

range(dataset2$resident, na.rm = T) #T=TRUE

?range
#읽는 법: 패키지 확인(range {base}) > 예제보기 jdk는 중간에 끼어있음.

View(dataset2)

dataset2$gender2[dataset2$gender==1]<-'남자'
dataset2$gender2[dataset2$gender==2]<-'여자'
pie(table(dataset2$gender2))

?table
#Verctor 하나짜리, Matrix 면, Table 상단에 뭔지 있는거, DF table을 이해해서 연산할 수 있는 자료구조
#r은 도구적으로 배우는 것이 중요
#표의 남자, 여자 > lable 옆에 있는거 범례(레전드)
#데이터 분석 그래프를 안그리는게 베스트지만 그리려면 아주 잘그려야함.

# 8장 리뷰
data(quakes)
?quakes

library(lattice)

??equal.count
#?? -> 어느 library인지 찾아줌
#data에서 3,5정도 구획을 많이 씀.

depthgroup <- equal.count(quakes$depth, 
                          number=3, 
                          overlap=0)
magnitudegroup <- equal.count(quakes$mag,
                              number=2,
                              overlap=0)
xyplot(lat~long | magnitudegroup*depthgroup, data=quakes)

install.packages("latticeExtra")
library(latticeExtra)
xyplot(min.temp+max.temp ~ day | month, 
       data=SeatacWeather)
