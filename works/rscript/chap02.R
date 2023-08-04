## 벡터생성
# === 실수형, 정수형 벡터 생성 ===

a <- c(1, 2, 3)
print(x = a)
class(x = a) # "numeric" 실수형

b <- c(1L, 2L, 3L)
print(x = b)
class(x = b) # "integer" 정수형
# 정수형 벡터만 입력받는 R 함수에 실수형 벡터를 저장하면 에러 발생. 자료형과 자료구조를 미리 확인하는 습관 기르기.

print(x = 101:150)
# [1] 101 102 103 104 105 106 107
# [8] 108 109 110 111 112 113 114
#[15] 115 116 117 118 119 120 121
#[22] 122 123 124 125 126 127 128
#[29] 129 130 131 132 133 134 135
#[36] 136 137 138 139 140 141 142
#[43] 143 144 145 146 147 148 149
#[50] 150
# []로 출력되면 해당 객체는 벡터.
# []안의 값은 해당 줄 첫 원소의 인덱스 값.


# === 문자형, 논리형 벡터 생성 ===

c <- c('hello', 'world')
class(x = c) # "character"

d <- c(FALSE, TRUE)
class(x = d) # "logical"

print(x = T) # TRUE, 따옴표 없음.

T <- F
print(x = T) # FALSE 
# F, T는 FALSE, TRUE의 축약형이므로 객체명으로 사용하지 않는것이 권장됨.


# === 빈 벡터 생성 ===

c()
# for문에 사용


# === 범주형 벡터 생성 ===

# factor(x = 범주형으로 전환할 벡터,
#        levels = 범주형 벡터의 레벨 순서인 문자형 벡터)
# as.factor(x = 벡터) 기존 벡터를 범주형 벡터로 변경할 때 사용. 레벨 순서 변경 불가.

nat <- c('한국', '일본', '중국', '미국', '중국', '한국', '미국', '일본')
print(x = nat)
# [1] "한국" "일본" "중국" "미국"
# [5] "중국" "한국" "미국" "일본"

fct <- as.factor(x = nat) # 범주화
print(x = fct)
# [1] 한국 일본 중국 미국 중국 한국
# [7] 미국 일본
# Levels: 미국 일본 중국 한국
# 각 원소에 따옴표가 사라지고 levels 추가적으로 출력됨.

as.integer(x = fct)
# [1] 4 2 3 1 3 4 1 2
# 범주형 벡터 fct를 전수형 벡터로 전환 할 수 있음.
# 범주형 벡터가 정수형 또는 실수형 벡터로 변환되면서 원솟값이 레벨의 위치 번호인 인덱스로 바뀜.
# 범주형 벡터로 변환 시 레벨 순서 지정도 가능.

fct <- factor(x = nat, levels = c('한국', '미국', '중국', '일본'))
print(x = fct)
as.integer(x = fct)
# [1] 1 4 3 2 3 1 2 4 <- levels 순서 변경


# === 원소가 연속되는 벡터 생성 ===

# seq(from = 처음 숫자,
#     to = 마지막 숫자,
#     by = 간격,
#     length.out = 반환되는 벡터의 길이)

# seq(from = 1, to = 3, by = 1)
# 1:3
seq(1,3,1); seq(3)

seq(from = 3, to = 1, by = -1) # [1] 3 2 1
seq(from = 1, to = 10, by = 2.5) # [1] 1.0 3.5 6.0 8.5
seq(from = 1, to = 10, length = 19)
#  [1]  1.0  1.5  2.0  2.5  3.0  3.5
#  [7]  4.0  4.5  5.0  5.5  6.0  6.5
# [13]  7.0  7.5  8.0  8.5  9.0  9.5
# [19] 10.0
seq(1, 10, length = 19)
#  [1]  1.0  1.5  2.0  2.5  3.0  3.5
#  [7]  4.0  4.5  5.0  5.5  6.0  6.5
# [13]  7.0  7.5  8.0  8.5  9.0  9.5
# [19] 10.0

seq(1,3,1, length.out = 5)
# Error in seq.default(1, 3, 1, length.out = 5) : 너무 많은 인자들이 있습니다
3seq(1,3,length.out = 5)
# [1] 1.0 1.5 2.0 2.5 3.0
seq(1,3,length = 5)
# [1] 1.0 1.5 2.0 2.5 3.0


# === 원소가 반복되는 벡터 생성 ===

# rep(x = 반복할 스칼라 또는 벡터,
#     times = x에 지정된 벡터 전체를 반복할 횟수,
#     each = x에 지정된 벡터의 각 원소를 반복할 횟수,
#     length.out = 반환되는 벡터의 길이)

rep(x = 1, times = 3)
rep(x = 1:3, times = 3) # [1] 1 2 3 1 2 3 1 2 3
rep(x = 1:3, each = 3) # [1] 1 1 1 2 2 2 3 3 3
rep(x = 1:3, length = 10) # [1] 1 2 3 1 2 3 1 2 3 1

#x, times는 생략 가능
rep(1:3, 3)
rep(1:3, each = 2)
rep(x = 1:3, 3, each = 2)
rep(x = 1:3, 3, each = 2, length = 10)


## 벡터 원소 선택
# === 인덱싱 ===

a[3] # a <- 벡터 객체명, 3 <- 인덱스, [3] <- 특정 원소 지점

# R 내장 문자형 벡터 letters
print(x = letters)
#  [1] "a" "b" "c" "d" "e" "f" "g" "h"
#  [9] "i" "j" "k" "l" "m" "n" "o" "p"
# [17] "q" "r" "s" "t" "u" "v" "w" "x"
# [25] "y" "z"
# R의 인덱스는 0부터 시작, a:b b까지 포함
letters[1]


# === 슬라이싱 ===

a[1:5] # a <- 벡터 객체명, [시작:끝(포함)] <- 범위 지정, ':' <- 슬라이싱 기호

s <- letters[1:5]
print(x = s)


# === 벡터 원소 2개 이상 선택 ===

# 팬시 인덱싱 [] 안에 정수형 지정
# 불리언 인덱싱 [] 안에 논리형 벡터 지정, TRUE에 해당하는 원소 선택

s[c(1,2,3)]

s[c(T,F,T,F,T)]


## 벡터 원소 추가

s[6] <- 'f'
print(x = s) # [1] "a" "b" "c" "d" "e" "f"

s[10] <- 'j'
print(x = s)
# [1] "a" "b" "c" "d" "e" "f" NA  NA 
# [9] NA  "j"


## 벡터 원소 삭제
s[-10]
# [1] "a" "b" "c" "d" "e" "f" NA  NA 
# [9] NA
print(x = s)
# [1] "a" "b" "c" "d" "e" "f" NA  NA 
# [9] NA  "j" <- 백터 s에 재할당 하지 않았기 때문.
s <- s[-10]
print(x = s)
# [1] "a" "b" "c" "d" "e" "f" NA  NA 
# [9] NA 


## 벡터 원소 변경
# === 인덱싱과 슬라이싱을 이용한 변경 ===
s[1] <- 'A' 
print(x = s)

s[2] <- 'B'
print(x = s)  

s[1:2] <- c('가','나')
print(x = s)
# [1] "가" "나" "c"  "d"  "e"  "f"  NA  
# [8] NA   NA 


# === 범주형 벡터 원소 변경 ===

nat[8] <- '대만'
print(x = nat)

fct[8] <- '대만'
# Warning message:
#     In `[<-.factor`(`*tmp*`, 8, value = "대만") :
#     요인의 수준(factor level)이 올바르지 않아 NA가 생성되었습니다.
print(x = fct)
# [1] 한국 일본 중국 미국 중국 한국 미국
# [8] <NA> <- 레벨에 대만이 없어서 NA로 변경됨.
#     Levels: 한국 미국 중국 일본

levels(x = fct)
levels(x = fct)[5] <- '대만'
fct[8] <- '대만'
print(x = fct)
# [1] 한국 일본 중국 미국 중국 한국 미국 대만
# Levels: 한국 미국 중국 일본 대만


## 벡터 형변환
# === 정수로 형변환 ===

as.integer(x = 1.2) # [1] 1
as.integer(x = '1.2') # [1] 1
as.integer(x = FALSE) # [1] 0
as.integer(x = TRUE) # [1] 1
as.integer(x = T) # [1] 0 <- 여기서는 단축형 안먹히는듯?


# === 실수로 형변환 ===

as.numeric(x = 1L)
as.numeric(x = '1.2')
as.numeric(x = TRUE)


# === 문자혈로 형변환 ===
as.character(x =1L) # [1] "1" 정수 표기 L 생략됨.
as.character(x = 1.2)
as.character(x= TRUE)


# === 논리형으로 형변환 ===

as.logical(x = 0) # [1] FALSE
as.logical(x = 1.2) # [1] TRUE <- 0이 아닌 모든 숫자
as.logical(x = '1.2') # [1] NA <- 문자열


# === 범주형으로 형변환 ===

e <- as.factor(x = c)
print(x = e)
# [1] hello world
# Levels: hello world
class(x = e) # [1] "factor"
as.integer(x = e) # [1] 1 2


## 벡터 강제변환
c <- c('hello', 'world')
d <- c(F,T)
e <- as.factor(x = c)

f <- c(d, e)
print(x = f) # [1] 0 1 1 2
class(x = f) # [1] "integer"

f <- c(f, '4')
print(x = f) # [1] "0" "1" "1" "2" "4"
class(x = f) # [1] "character" <- 문자형 '4'가 추가되어 벡터 f의 자료형이 문자형으로 형변환 됨.


## 산술 연산자
# === 덧셈, 뺄셈 연산 ===

a <- c(0, 2, 4)
b <- c(1, 2, 3)
a+b # [1] 1 4 7
a-b # [1] -1  0  1

c <- seq(1,11,2)
d <- seq(3,12,3)

a + c # [1]  1  5  9  7 11 15

a + d
# [1]  3  8 13 12
# Warning message:
#     In a + d : longer object length is not a multiple of shorter object length
# 벡터 a와 d는 배수 관계가 아니라서 일부 원소만 확장되기 때문에 경고 메세지가 출력됨.

a + 1 # [1] 1 3 5


# === 곰셈, 나눗셈, 나머지, 몫, 거듭제곱 연산 ===
a * 2
a ^ 2
a / 2
a %% 2 # 나머지
a %/% 2 # 몫


## 비교 연산자

# TRUE/FALSE로 갑 반환
a > 2 # [1] FALSE FALSE  TRUE
a >= 2
a < 2
a <= 2
a == 2
a != 2


## 논리 연산자
a >= 1
b <= 2

a >= 1 & b <= 2 # 모두 T -> T
a >= 1 | b <= 2 # 모두 F -> F
!(a >= 1 & b <= 2) # T -> F, F -> T


## 멤버 연산자

x <- 0

x == a[1]
x == a[2]
x == a[3]

x == a[1] | x == a[2] | x == a[3] 

x %in% a 
# 멤버 연산자 왼쪽에 있는 벡터의 원소가 멤버 연산자 오른쪽에 있는 벡터의 원소가 포함되면 TRUE, 아니면 FALSE 반환
# 원소 갯수 만큼 TRUE, FALSE 반환