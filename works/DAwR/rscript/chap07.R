## 사용자 정의 함수의 기본 구조

# function (a(매개변수1), b(매개변수2) {
#     실행코드
#     return(반환값)
# }

install.packages("kknn")
library(kknn)

Pythagoras <- function (a, b) {
    c <- sqrt (x = a^2 + b^2)
    return(c)
}

Pythagoras(a = 3, b = 4) # [1] 5


## 사용자 정의 함수 생성


score <- 100
if (score >= 90) {
    grade <- 'A'
} else if (score >= 80) {
    grade <- 'B'
} else if (score >= 70) {
    grade <- 'C'
} else if (score >= 60) {
    grade <- 'D'
} else {
    grade <- 'F'
}
print(x = grade)

getGrade <- function (score) {
    if (score >= 90) {
        grade <- 'A'
    } else if (score >= 80) {
        grade <- 'B'
    } else if (score >= 70) {
        grade <- 'C'
    } else if (score >= 60) {
        grade <- 'D'
    } else {
        grade <- 'F'
    }
    return(grade)
}
getGrade(score = 100) # [1] "A"


# === 파일로 저장한 사용자 정의 함수 재활용 ===

# source(file = '경로명/파일명.R', encoding = 'UTF-8', ...)

rm(getGrade) # rm() 사용자 정의 함수 삭제

source(file = 'myFuns.R', encoding = 'UTF-8')
getGrade(score = 100) # [1] "A"


## 인수의 기본값 설정


# guessHeight <- function(name = '홍길동'(기본값), height = 173(기본값)) {
#     코드
#     return(answer)
# }

guessHeight <- function(name = '홍길동', height = 173) {
    answer <- paste(name, '님의 키는', height, 'cm입니다.') # paste 함수는 문자열을 이어붙이는 함수
    # paste(..., sep = " ", collapse = NULL) collapse 옵션은 paste 함수에서 여러 개의 문자열을 하나의 문자열로 합칠 때 사용
    return(answer)
}

guessHeight() # [1] "홍길동 님의 키는 173 cm입니다."
guessHeight(name = '정우성', height = 186) # [1] "정우성 님의 키는 186 cm입니다."