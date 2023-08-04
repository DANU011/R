# 01. 다음과 같은 벡터 객체를 생성하시오.

# 조건1) 벡터 변수 Vec1을 만들고, "R" 문자가 5회 반복되도록 하시오. 
Vec1 <- rep("R",5)
# 조건2) 벡터 변수 Vec2에 1~10까지 3간격으로 연속된 정수를 만드시오. 
Vec2 <- seq(1,10, by=3)
# 조건3) 벡터 변수 Vec3에 1~10까지 3간격으로 연속된 정수가 3회 반복되도록 만드시오. 
Vec3 <- rep(Vec2, 3)
# 조건4) 벡터 변수 Vec4에는 Vec2~Vec3가 모두 포함되는 벡터를 만드시오. 
Vec4 <- c(Vec2, Vec3)
# 조건5) 25 ~ -15까지 5를 간격으로 seq() 함수를 이용하여 벡터를 생성하시오. 
seq(25, -15, -5)
# 조건6) 벡터 변수 Vec4에서 홀수 번째 값들만 선택하여 Vec5에 할당하시오.(첨자 이용)
Vec5 <- Vec4[seq(1, 16, by=2)]


# 02. 다음과 같은 벡터를 칼럼으로 갖는 데이터프레임을 생성하시오. 

# 조건1) 위 7개의 벡터를 칼럼으로 갖는 user 데이터프레임을 생성하시오.
name<-c("최민수1","최민수2","최민수3","최민수4","최민수5")
age<-c(55,45,45,53,15)
gender<-c(1,2,1,1,1)
job<-c("연예인","연예인1","연예인2","연예인3","연예인4")
sat<-c(3,4,2,5,5)
grade<-c("C","C","A","D","E")
total<-c(44.4,28.5,43.5,NA,27.1)
user <- data.frame(name,age,gender,job,sat,grade,total)
# 조건2) gender 변수를 이용하여 히스토그램 그리기시오.
hist(user$gender)
# 조건3) user에서 짝수행만 선택해서 user2에 넣으시오. 
user2 <- user[seq(2, 4, 2), ]
nrow(user)
user2 <- user[seq(2, nrow(user), 2),]
# 03. Data를 대상으로 apply()를 적용하여 행/열 방향으로 조건에 맞게 통계량을 구하시오. 
kor <- c(90,85,90)
eng <- c(70,85,75)
mat <- c(86,92,88)

# 조건1) 3개의 과목점수를 이용하여 데이터프레임(Data)을 생성한다. 
Data <- data.frame(kor=kor, eng=eng, mat=mat)
Data
# 조건2) 행/열 방향으로 max() 함수를 적용하여 최대값을 구하시오. 
apply(Data, 1, max)
apply(Data, 2, max)
# 조건3) 행/열 방향으로 mean() 함수를 적용하여 평균 구하기 소숫점 2자리까지
# 표현하시오. 힌트 : round(data, 자릿수)
round(apply(Data, 1, mean), 2)
round(apply(Data, 2, mean), 2)
# 조건4) 행 단위 분산과 표준편차를 구하시오.
apply(Data, 1, var)
apply(Data, 1, sd)

# 04. 다음의 Data2 객체를 대상으로 조건에 맞게 정규표현식을 적용하여 문자열을 처리하시오. 
Data2 <- c("2017-02-05 수입3000원",
           "2017-02-06 수입4500원", 
           "2017-02-07 수입2500원")
library(stringr)

# 조건1) 날짜별 수입을 다음과 같이 출력하시오.
income <- str_extract_all(Data2, '[0-9]{4}[가-히]')
income
unlist(income)
# 조건2) 위 벡터에서 연속하여 2개 이상 나오는 모든 숫자를 제거하시오.
str_replace_all(Data2, '[0-9]{2}', '')
# 조건3) 위 벡터에서 -를 /로 치환하시오. #책 문제 오류
str_replace_all(Data2, '-', '/')
# 조건4) 모든 원소를 쉼표(,)에 의해서 하나의 문자열로 합치시오. #책 문제 오류
paste(Data2, collapse = ',')
