## if문 기본 구조

# if (조건) {
#     실행코드
# } else if (조건) {
#     실행코드
# } else {
#     실행코드
# }


# === if문 기본 사용법 ===

obj <- 1L
class(x = obj) # [1] "integer"
class(x = obj) == 'integer' # [1] TRUE

if (class(x = obj) == 'integer') {
    print(x = '정수입니다!') # <- 두칸 자동 들여쓰기 됨.
} # [1] "정수입니다!"

obj <- as.character(x = obj)
if (class(x = obj) == 'integer') {
    print(x = '정수입니다!')
} # 출력되지 않음. if문을 실행하려면 중괄호 바깥에서 실행. 안에서 실행하면 if문과 상관없이 print문만 실행되서 출력됨.


# === if-else문 ===

if (class(x = obj) == 'integer') {
    print(x = '정수입니다!')
} else {
    print(x = '정수가 아닙니다!')
} # [1] "정수가 아닙니다!"


# === if-else if-else문 ===

if (class(x = obj) == 'integer') {
    print(x = '정수입니다!')
} else if (class(x = obj) == 'numeric') {
    print(x = '실수입니다!')
} else {
    print(x = '숫자가 아닙니다!')
} # [1] "숫자가 아닙니다!"

score <- 10
if (score >= 70) {
    grade <- '합격'
} else {
    grade <- '불합격'
}
print(x = grade) # [1] "불합격"

# if문은 벡터 연산은 하지 못하고 스칼라 값만 처리 가능.

score <- c(100,69)
if (score >= 70) {
    grade <- '합격'
} else {
    grade <- '불합격'
} # Error in if (score >= 70) { : the condition has length > 1
print(x = grade) # [1] "불합격" ????? 첫번 째 요소만 사용해서 합격이어야 하는거 아님? 바뀐건가?


## ifelse() 함수

# test, yes, no 매개변수 존재
# test TRUE/FALSE로 반환되는 조건 지정
# test에 지정된 값이 TRUE일 때 yes 매개변수, FALSE일 때 no 매개변수에 지정된 값을 반환.

score <-  seq(from = 40, to = 100, by = 10)
print(score)
score >= 70 # [1] FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
ifelse(test = score >= 70, yes = '합격', no = '불합격')
# [1] "불합격" "불합격" "불합격" "합격"   "합격"  
# [6] "합격"   "합격"  

df <- data.frame(score)
str(object = df)

df$grade <- ifelse(test = df$score >= 70, yes = '합격', no = '불합격')
print(x = df)