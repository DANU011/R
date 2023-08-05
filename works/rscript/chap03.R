## 리스트 특징
# 인덱싱할 때 []대신 [[]]사용
# 리스트 원소에 이름이 있으면 $ 기호를 사용하여 해당 원소 선택 가능


## 리스트 생성

num <- seq(from = 1, to = 10, by = 2)
cha <- rep(x = c('a', 'b'), each = 3)

lst1 <- list(num, cha)
print(x = lst1)
# [[1]]
# [1] 1 3 5 7 9
# 
# [[2]]
# [1] "a" "a" "a" "b" "b" "b"
class(x = lst1) # 객체의 자료형 및 자료구조
length(x = lst1) # 함수 객체의 원소 개수
str(object = lst1) # 객체의 클래스, 원소 개수 및 각 원소의 자료형 등 객체의 구조 
# List of 2
# $ : num [1:5] 1 3 5 7 9
# $ : chr [1:6] "a" "a" "a" "b" ...

lst2 <- list(a = num, b = cha, c = lst1)
print(x = lst2)
# $a
# [1] 1 3 5 7 9
# 
# $b
# [1] "a" "a" "a" "b" "b" "b"
# 
# $c
# $c[[1]]
# [1] 1 3 5 7 9
# 
# $c[[2]]
# [1] "a" "a" "a" "b" "b" "b"
class(x = lst2)
str(object = lst2)
# List of 3
# $ a: num [1:5] 1 3 5 7 9
# $ b: chr [1:6] "a" "a" "a" "b" ...
# $ c:List of 2
# ..$ : num [1:5] 1 3 5 7 9
# ..$ : chr [1:6] "a" "a" "a" "b" ...


## 리스트 원소 선택

lst1$a # NULL
lst2$a # [1] 1 3 5 7 9

lst1[[1]] # [1] 1 3 5 7 9 <- 벡터 반환
lst2[[2,3]] # Error in lst2[[2, 3]] : incorrect number of subscripts <- [[]]안에는 정수 1개만 지정 가능

# === str() 함수로 리시트 구조 파악 ===

# 어떤 함수를 실해했을 때 리스트가 생성되었다면 str() 함수를 실행하여 리스트 구조를 빠르게 파악
# 리스트의 일부만 선택하여 다음 작업을 진행해 나가는 것이 일반적이기 때문
# ex) lm() <- 선형 회귀 모형 생성시 리스트 반환

lst2[1]
# $a
# [1] 1 3 5 7 9 <- 리스트 반환
lst2[c(1, 3)] # <- [] 안에 원소 개수가 두 개 이상인 벡터를 지어하면 해당 위치의 원소 리스트 반환
# $a
# [1] 1 3 5 7 9
# 
# $c
# $c[[1]]
# [1] 1 3 5 7 9
# 
# $c[[2]]
# [1] "a" "a" "a" "b" "b" "b"


## 리스트 원소 추가

lst2$d <- 1:5
str(object = lst2)
# List of 4
# $ a: num [1:5] 1 3 5 7 9
# $ b: chr [1:6] "a" "a" "a" "b" ...
# $ c:List of 2
# ..$ : num [1:5] 1 3 5 7 9
# ..$ : chr [1:6] "a" "a" "a" "b" ...
# $ d: int [1:5] 1 2 3 4 5


## 리스트 원소 삭제

lst2$a <- NULL
str(object = lst2)
# List of 3
# $ b: chr [1:6] "a" "a" "a" "b" ...
# $ c:List of 2
# ..$ : num [1:5] 1 3 5 7 9
# ..$ : chr [1:6] "a" "a" "a" "b" ...
# $ d: int [1:5] 1 2 3 4 5

## 리스트 원소 변경

lst2$b <- letters[1:5]
print(x = lst2$b) # [1] "a" "b" "c" "d" "e"

lst2$b[1] <- 'A'
print(x = lst2$b) # [1] "A" "b" "c" "d" "e"

# 필요한 원소만 빠르게 선택하는 것이 중요!