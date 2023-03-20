[제6장 연습문제]
# dplyr
library(dplyr)
data(iris)

#1. iris의 꽃잎의 길이(Petal.Length) 칼럼을 대상으로 1.5 이상의 값만 필터링하시오. 
#힌트) %>% 기호와 filter() 함수 이용
q1 <- iris %>% filter(Petal.Length >= 5.0)

#2. 문제1번 결과에서 1,3,5번 칼럼을 선택하시오. #힌트) %>% 기호와 select() 함수 이용
q2 <- q1 %>% filter(Petal.Length >= 5.0) %>% select(Sepal.Length, Petal.Length,
                                                    Species)
#3. 문제2번 결과에서 1번 칼럼에서 3번 칼럼의 값을 뺀 diff 파생변수를 만들고, 앞부분 6
#개만 출력하시오.(diff = 1번 칼럼 – 3번 칼럼)
#힌트) %>% 기호와 mutate() 함수 이용
q3 <- q2 %>% mutate(diff = Sepal.Length - Petal.Length) %>% head()

#4. 문제3번 결과에서 꽃의 종(Species)별로 그룹화하여 Sepal.Length와 Petal.Length 변수
#의평균을 계산하시오. #힌트) %>% 기호와 group_by() 함수, summarise() 함수 이용
q4 <- q3 %>% group_by(Species) %>% summarise(sepal_mean=mean(Sepal.Length), petal_mean=mean(Petal.Length))

# reshape2
head(iris)
library('reshape2')

#5. reshape2 패키지를 이용하여 단계별로 iris 데이터 셋을 처리하시오.

#[단계1] 꽃의 종류(Species)를 기준으로 ‘넓은 형식’을 ‘긴 형식’으로 변경하기
#힌트) melt() 함수 이용
melt <- melt(iris, id=c("Species"), na.rm=TRUE)
head(melt)

#[단계2] 꽃의 종별로 나머지 4가지 변수의 합계 구하기
#힌트) dcast() 함수 이용
dcast <- dcast(melt, Species ~ variable, sum)
head(dcast)
