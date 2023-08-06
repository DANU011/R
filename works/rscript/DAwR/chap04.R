## 데이터프레임 특징

# 값 선택 [], 2차원 자료구조로 [행, 열] 형태로 표현.
# 모든 행이나 모든 열을 선택할 때는 비움.
# 대괄호 안콤마 왼쪽에 지정된 행 인덱스 벡터는 길이에 상관 없이 항상 데이터프레임으로 반환.
# 열 인덱스는 1이면 벡터, 2 이상이면 항상 데이터프레임으로 반환.
# 리스트 처럼 $ 기호로 열벡터 선택 가능하지만 $ 기호로는 하나의 열벡터만 선택할 수 있어서 항상 벡터로 반환.
# [[]] 가능하지만 일바적이지 않음.


## 데이터프레임 생성
# === 두 벡터로 데이터 프레임 생성 ===

num <- seq(from = 1, to = 10, by = 2)
chr <- rep(x = c('a', 'b'), each = 3)

df1 <- data.frame(num, chr)
# Error in data.frame(num, chr) : 
#     arguments imply differing number of rows: 5, 6

cha <- letters[1:5]
df1 <- data.frame(num,cha)
print(x = df1)
#   num cha
# 1   1   a
# 2   3   b
# 3   5   c
# 4   7   d
# 5   9   e
class(x = df1) # [1] "data.frame"


# === 데이터프레임 구조와 값 확인 ===

str(object = df1)
# 'data.frame':	5 obs. of  2 variables: <- 5개의 관측값(obs), 2개의 변수(variables)를 갖는 5행 2열의 데이터 프레임
#  $ num: num  1 3 5 7 9
#  $ cha: chr  "a" "b" "c" "d" ...

# 데이터 분석 과정에서 데이터프레임을 생성 했다면 str()을 실행해 열 백터의 자료형이 원래 데이터의 척도와 일치하는지 확인하고 일치하지 않는다면 자료형을 변경해야함.(as.xxxx())
# max.print의 기본값 1000 <- 벡터 원소를 최대 1000개까지 출력.
# 데이터프레임 값을 1000개까지 출력
# 데이터프레임 값 == 행의 길이 * 열의 길이

options('max.print')
# $max.print
# [1] 1000

View(x = df1) # print()는 천개만 출력되고 나머지 생략, View는 새로운 탭이 열리면서 전체 확인 가능.
# R studio 'Environment'-'Data'-데이터프레임 선택시 View()창 열림.
# R studio 'Environment'-'Data'-객체 이름 앞 동그란버튼 선택시 객체의 원소를 보여줌. str() 실행과 같은 효과.

# 데이터프레임 생성시 문자형 벡터 자동변환 옵션
options('stringsAsFactors')
# $stringsAsFactors
# NULL <-  df1 생성시 cha가 범주형 벡터로 변경되지 않은 이유, 더 이상 사용되지 않음.

df2 <- data.frame(num, cha, stringsAsFactors = TRUE)
str(object = df2)
# 'data.frame':	5 obs. of  2 variables:
#  $ num: num  1 3 5 7 9
#  $ cha: Factor w/ 5 levels "a","b","c","d",..: 1 2 3 4 5


## 데이터프레임 원소 선택
# === 인덱싱으로 선택 ===
df1[1,1] # [1] 1 <- 벡터로 반환

df1[1:2, 1:2]
#   num cha
# 1   1   a
# 2   3   b <- 데이터프레임 반환

df1[1, ]
#   num cha
# 1   1   a

df1[1:2, ]
#   num cha
# 1   1   a
# 2   3   b

df1[, 1] # [1] 1 3 5 7 9 <- 벡터로 반환
df1[, 1, drop = FALSE]
#   num
# 1   1
# 2   3
# 3   5
# 4   7
# 5   9 <- drop = FALSE, 데이터프레임으로 반환

df1[, 1:2]
#   num cha
# 1   1   a
# 2   3   b
# 3   5   c
# 4   7   d
# 5   9   e


# === 문자형 벡터로 열 선택 ===

df1[, 'num'] # [1] 1 3 5 7 9 <- 문자형 벡터 'num'으로 열 선택, 벡터로 반환

df1[, c('num', 'cha')]
#   num cha
# 1   1   a
# 2   3   b
# 3   5   c
# 4   7   d
# 5   9   e


# === 열이름으로 열 선택 ===

df1$num # [1] 1 3 5 7 9
df1$cha # [1] "a" "b" "c" "d" "e"


# === TRUE/FALSE로 반환받기 ===

# 데이터프레임에서 값을 선택할 때 불리언 인덱싱 사용 가능. 특정 조건을 만족하는 데이터프레임 행을 선택할 때 사용.

df1$num >= 5 # [1] FALSE FALSE  TRUE  TRUE  TRUE

df1[df1$num >= 5, ]
#   num cha
# 3   5   c
# 4   7   d
# 5   9   e

# 데이터프레임에서 괄호 안 조건을 만족하는 행과 하나의 열을 선택하는 두 가지 방법
df1[df1$num >= 5, 'cha'] # [1] "c" "d" "e"
df1$cha[df1$num >= 5] # [1] "c" "d" "e" <- df1$cha는 벡터이므로 []안에 콤마를 추가하면 에러가 발생하므로 주의!


## 데이터프레임 원소 추가
# === 데이터프레임에 원소 추가 ===

df1$int <- 11:15
str(object = df1)
# 'data.frame':	5 obs. of  3 variables:
#  $ num: num  1 3 5 7 9
#  $ cha: chr  "a" "b" "c" "d" ...
#  $ int: int  11 12 13 14 15


# === 데이터프레임에 열 추가 ===

# cbind(데이터프레임, 새로 추가할 벡터1, 새로 추가할 벡터2, ...) <- R 객체를 열(가로) 방향으로 묶음.
# 지정된 순서대로 묶고, 벡터의 길이가 서로 같아야 함.

cbind(df1, rep(x = TRUE, times = 5))
#   num cha int rep(x = TRUE, times = 5) <- 열 이름이 없어서 코드 그대로 출력
# 1   1   a  11                     TRUE
# 2   3   b  12                     TRUE
# 3   5   c  13                     TRUE
# 4   7   d  14                     TRUE
# 5   9   e  15                     TRUE

cbind(df1, log = rep(x = TRUE, times = 5))
#   num cha int  log <- 지정된 벡터 앞에 이름 붙이면 반영됨.
# 1   1   a  11 TRUE
# 2   3   b  12 TRUE
# 3   5   c  13 TRUE
# 4   7   d  14 TRUE
# 5   9   e  15 TRUE

str(object = df1)
# 'data.frame':	5 obs. of  3 variables:
#  $ num: num  1 3 5 7 9
#  $ cha: chr  "a" "b" "c" "d" ...
#  $ int: int  11 12 13 14 15 <- 할당 안해서 원래 구조 유지.

df1 <- cbind(df1, log = rep(x = TRUE, times = 5)) # <- 재할당
str(object = df1)
# 'data.frame':	5 obs. of  4 variables:
#  $ num: num  1 3 5 7 9
#  $ cha: chr  "a" "b" "c" "d" ...
#  $ int: int  11 12 13 14 15
#  $ log: logi  TRUE TRUE TRUE TRUE TRUE


# === 데이터 프레임에 행 추가 ===

# rbind(데이터프레임1, 데이터프레임2, ...) <- R 객체를 행(세로) 방향으로 묶음. 
# 괄호 안에 모두 데이터프레임을 지정 해야함. 기존 데이터프레임과 열이름이 같은 데이터프레임을 아래에 붙임.

df3 <- data.frame(num = 6, cha = 'f', int = 16, log = TRUE)
rbind(df1, df3)
#   num cha int  log
# 1   1   a  11 TRUE
# 2   3   b  12 TRUE
# 3   5   c  13 TRUE
# 4   7   d  14 TRUE
# 5   9   e  15 TRUE
# 6   6   f  16 TRUE

tr(object = df1)
# 'data.frame':	5 obs. of  4 variables:
#  $ num: num  1 3 5 7 9
#  $ cha: chr  "a" "b" "c" "d" ...
#  $ int: int  11 12 13 14 15
#  $ log: logi  TRUE TRUE TRUE TRUE TRUE <- 할당되지 않음.


## 데이터프레임 원소 삭제
# === 열벡터 삭제 ===

df1$num <- NULL
str(object = df1)
# 'data.frame':	5 obs. of  3 variables:
#  $ cha: chr  "a" "b" "c" "d" ...
#  $ int: int  11 12 13 14 15
#  $ log: logi  TRUE TRUE TRUE TRUE TRUE


# === 행 또는 열 삭제 ===
df1[-1, -1]
#   int  log
# 2  12 TRUE
# 3  13 TRUE
# 4  14 TRUE
# 5  15 TRUE

df1[-1, ]
#   cha int  log
# 2   b  12 TRUE
# 3   c  13 TRUE
# 4   d  14 TRUE
# 5   e  15 TRUE

df1[, -1]
#   int  log
# 1  11 TRUE
# 2  12 TRUE
# 3  13 TRUE
# 4  14 TRUE
# 5  15 TRUE


## 데이터프레임 원소 변경

df1$cha <- letters[1:5]
print(x = df1)
#   cha int  log
# 1   a  11 TRUE
# 2   b  12 TRUE
# 3   c  13 TRUE
# 4   d  14 TRUE
# 5   e  15 TRUE

df1$int[1] <- '11'
str(object = df1)
# 'data.frame':	5 obs. of  3 variables:
#  $ cha: chr  "a" "b" "c" "d" ...
#  $ int: chr  "11" "12" "13" "14" ... <- 정수형 벡터에서 문자형 벡터로 변경.
#  $ log: logi  TRUE TRUE TRUE TRUE TRUE