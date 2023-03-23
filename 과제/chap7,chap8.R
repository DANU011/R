getwd() 

install.packages("ggplot2")
install.packages("lattice")

library(ggplot2)
library(lattice)

#Chapter7 연습문제

#7.2 dataste의 resident 칼럼을 NA값 제거하여 resident2 변수에 저장

dataset <- read.csv("./data/dataset.csv", header = T)
str(dataset)


summary(dataset$resident)
resident2 <- na.omit(dataset$resident)
resident2

#7.3-1 gender 칼럼을 대상으로 1 -> 남자, 2-> 여자로 변경하여 gender2에 칼럼추가
#7.3-2 파이차트로 결과확인

head(dataset["gender"], 5)
summary(dataset$gender) #na x
dataset$gender2[dataset$gender == 1] <- '남자'
dataset$gender2[dataset$gender == 2] <- '여자'
head(dataset[c("gender", "gender2")],5)

pie(table(dataset$gender2))

#7-4.1 age칼럼 30세이하 -> 1, 30~55세 -> 2, 55이상 -> 3으로 리코딩, age3에 추가
#7-4.2 age,age2,age3 확인 #age2 ??

head(dataset["age"], 20)
summary(dataset$age) #na o
dataset2 <- na.omit(dataset)
head(dataset,20)

dataset2$age2[dataset2$age <= 30] <- '청년'
dataset2$age2[dataset2$age > 30 & dataset2$age <= 55] <- '중년'
dataset2$age2[dataset2$age > 55 ] <- '장년'

dataset2$age3[dataset2$age <= 30] <- '1'
dataset2$age3[dataset2$age > 30 & dataset2$age <=55] <- '2'
dataset2$age3[dataset2$age > 55] <- '3'
head(dataset2[c("age", "age2", "age3")],10)


#Chapter8 연습문제

#8-1 산점도 시각화
str(quakes)

#범주화 :lattice > equal.count(변수, number=n, overlap=0)  n개 영역, 겹치지않게

#조건1 : 수심(depth)을 3개 영역으로 범주화
summary(quakes$depth)
depthgroup <- equal.count(quakes$depth, number=3, overlap=0)
depthgroup

#조건2 : 리히터 규모(mag)를 2개 영역으로 범주화
summary(quakes$mag)
maggroup <- equal.count(quakes$mag, number=2, overlap=0)
maggroup

#조건3 : 수심과 리히터 규모를 3행 2열 구조의 패널로 산점도 그래프 그리기
xyplot(lat~long| maggroup*depthgroup , data = quakes) # n열*n행

#8-2 SeatacWeather 월별 최저기온 최고기온 선그래프
#lattice패키지의 xyplot()이용, type="l"
install.packages("latticeExtra")
library(latticeExtra)
str(SeatacWeather)
head(SeatacWeather, 20)
summary(SeatacWeather$month)
summary(SeatacWeather$day)
xyplot( max.temp+min.temp ~ day | month, data = SeatacWeather, type="l")
#xyplot(y1+y2 ~ X축| 조건, data,type,layout)
#march 왜 끊어진 그래프? 결측치?
subset(SeatacWeather, month == "March")