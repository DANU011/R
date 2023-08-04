install.packages('tidyverse')
library(tidyverse)

a <- 1

?class

sen <- 'hello world!' # sen에 할당
print(x = sen)
class(x = sen) # "character" <- 문자형(character), 백터("")
length(x = sen) # 1 <- 문자형 원소 'hello world!' 한개

a <- 1
b <- 2

a <- b
b <- 3

print(x = a); print(x = b) # ';'을 사용하면 한 줄에 두개 이상의 코드 사용 가능

#1a <- 3 # Error: unexpected symbol in "1a"
`1a` <- 3 
#객체 생성시 숫자가 맨 앞에 오려면 ``으로 감싸줘야함. '나 "로 도 가능하지만 함수 안에서 문자열로 인식되므로 주의.
#비효율 적이지만 엑셀에서 R로 파일을 읽어올 때 데이터 프레임 컬럼이 숫자로 시작하는 경우 ``으로 감싸주는 처리 필요.

print(x = `1a`)

`2a` <- 4

print(x = `2a`)
