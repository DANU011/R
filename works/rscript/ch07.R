getwd()
#eda

dataset <-read.csv("./data/dataset.csv", header=T) # 데이터 기준

dataset
View(dataset)

head(dataset)
tail(dataset)


names(dataset) #컬럼
attributes(dataset)

str(dataset) #**

dataset$age

x <- dataset$age

plot(dataset$price)
dataset["gender"] # 딕셔너리 일반적으로 [] 배열

#언어를 너무 많이 배움!
#배열과 리스트의 차이는 뭔가요?
#js에서 오브젝트와 map의 차이는 뭔가요?

dataset[1] # 유일하게 1부터 카운트 > 그냥그렇다

dataset[c("job","price")]


summary(dataset)

sum(dataset$price, na.rm=T)
price2 <- na.omit(dataset$price)
price2
