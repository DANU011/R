## for문

# for (변수 in 벡터){
#     실행코드
# }

menu <- c('짜장면', '탕수육', '깐풍기', '짬뽕', '전가복', '샥스핀')
for (item in menu) {
    print(x = item)
} 
# [1] "짜장면"
# [1] "탕수육"
# [1] "깐풍기"
# [1] "짬뽕"
# [1] "전가복"
# [1] "샥스핀"
for (item in menu) {
    item
}
# 출력안됨. {}안에서 실행시 마지막 원소 출력


# === 두 문자열을 연결해 출력 ===
for (item in menu) {
    print(item, '시킬까요?\n')
} # <- 다른 언어와 달리 print() 함수에 두 개 이상의 문자를 결합하는 기능 없음.
# Error in print.default(item, "시킬까요?\n") : 
#     invalid printing digits -2147483648
# In addition: Warning message:
#     In print.default(item, "시킬까요?\n") : NAs introduced by coercion

# cat(객체명, 문자열, ... , sep = " ")

for (item in menu) {
    cat(item, '시킬까요?\n')
}
# 짜장면 시킬까요?
# 탕수육 시킬까요?
# 깐풍기 시킬까요?
# 짬뽕 시킬까요?
# 전가복 시킬까요?
# 샥스핀 시킬까요? <- [1]이 생략된 이유는 cart()는 실행 결과를 객체로 생성할 수 없으며, 단지 출력만 가능하기 때문.


# === 문자열을 연결해 새 객체에 저장 ===

# paste(객체명, 문자열, ... , sep = " ")

for (item in menu) {
    text <- paste(item, '시킬까요?\n')
    print(x = text)
}
# [1] "짜장면 시킬까요?\n"
# [1] "탕수육 시킬까요?\n"
# [1] "깐풍기 시킬까요?\n"
# [1] "짬뽕 시킬까요?\n"
# [1] "전가복 시킬까요?\n"
# [1] "샥스핀 시킬까요?\n"


## while문

# while (조건) {
#     실행코드
#     증감식
# }

i <- 5
while (i > 0) {
    print(x = i)
    i <- i - 1
}
# [1] 5
# [1] 4
# [1] 3
# [1] 2
# [1] 1


## 이후 코드 건너뛰기 : next

for (item in menu) {
    if (item %in% c('짜장면', '짬뽕')) { # %in% 연산자는 왼쪽 피연산자가 오른쪽 피연산자에 포함되는지 여부를 논리적으로 검사
        cat(item, '요리부터 주문합시다!\n', sep = '? ') # sep = '? '는 cat() 함수에서 문자열들을 결합할 때 사용하는 구분자(separator)를 지정하는 인자
    } else {
        cat(item, '다음 메뉴는 뭔가요?\n', sep = '? ') #  sep = '? '를 사용하면 cat() 함수가 문자열들을 결합할 때, 각 문자열 사이에 "? "라는 문자열을 추가해서 출력
        # cat("짜장면", "요리부터", "주문합시다!", sep = '? ')를 실행하면 "짜장면? 요리부터? 주문합시다!"라는 문자열이 출력
    }
}
# 짜장면? 요리부터 주문합시다!
# 탕수육? 다음 메뉴는 뭔가요?
# 깐풍기? 다음 메뉴는 뭔가요?
# 짬뽕? 요리부터 주문합시다!
# 전가복? 다음 메뉴는 뭔가요?
# 샥스핀? 다음 메뉴는 뭔가요?

for (item in menu) {
    if (item %in% c('짜장면', '짬뽕')) {
        next # 처음으로
        cat(item, '요리부터 주문합시다!\n', sep = '? ')
    } else {
        cat(item, '다음 메뉴는 뭔가요?\n', sep = '? ')
    }
}
# 탕수육? 다음 메뉴는 뭔가요?
# 깐풍기? 다음 메뉴는 뭔가요?
# 전가복? 다음 메뉴는 뭔가요?
# 샥스핀? 다음 메뉴는 뭔가요?


## 반복문 탈출 : break

# === while문에서 break ===
i <- 0
while (TRUE) {
    print(x = i)
    i <- i + 1
    if (i > 5) {
        break
    }
}


# === for문에서 break ===

for (i in 0:9) {
    print(x = i)
    if (i > 5) {
        break
    }
}


# === repeat문에서 break ===

i <- 0
repeat {
    print(x = i)
    i <- i + 1
    if (i > 5) {
        break
    }
}