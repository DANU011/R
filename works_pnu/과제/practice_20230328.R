#12장 1 독립성 검정

smoke <- read.csv("./Part-III/smoke.csv", header = T)
head(smoke)

smoke$education2[smoke$education==1] <- "1.대졸"
smoke$education2[smoke$education==2] <- "2.고졸"
smoke$education2[smoke$education==3] <- "3.중졸"
smoke$smoking2[smoke$smoking==1] <- "1.과대흡연"
smoke$smoking2[smoke$smoking==2] <- "2.보통흡연"
smoke$smoking2[smoke$smoking==3] <- "3.비흡연"

table(smoke$education2, smoke$smoking2)

CrossTable(smoke$education2, smoke$smoking2, chisq = T)

# -> p값이 적어서 유의미

#12장 2 독립성 검정

library(gmodels)

data <- read.csv("./Part-III/cleanData.csv", fileEncoding = "euc-kr")
# data 가능하면 사용x
str(data)

x <- data$position
y <- data$age3

plot(x,y, abline(lm(y~x)))
#그래프 별로
CrossTable(x,y,chisq = T)
# d.f. 자유도 -> 높아지면 애매함. 경향 밖으로 나갈 가능성이 높음.

#12장 3 동질성 검정 - 설명이 제대로 됐는지 검정하는 것 (->카이제곱으로 함)

result <- read.csv("./Part-III/response.csv", fileEncoding = "euc-kr")
str(result)

result$job2[result$job==1] <- "1.학생"
result$job2[result$job==2] <- "2.직장인"
result$job2[result$job==3] <- "3.주부"
result$response2[result$response==1] <- "1.무응답"
result$response2[result$response==2] <- "2.낮음"
result$response2[result$response==3] <- "3.높음"

table(result$job2, result$response2)

chisq.test(result$job2, result$response2)
#p-value = 6.901e-12 너무 낮아서 의심됨

