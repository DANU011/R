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
# 조건3) "-- 수입원" "-- 수입원" "-- 수입원" 출력 #책 문제 오류
str_replace_all(Data2, '-', '/')
# 조건4) "2017-02-05 수입3000원,2017-02-06 수입4500원,2017-02-07 수입2500원" 출력 #책 문제 오류
paste(Data2, collapse = ',')
