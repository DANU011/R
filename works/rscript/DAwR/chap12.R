## df 병합

# 내부 병합 : 외래키가 일치하는 행만 남김
# 외부 병합 : 모든 행을 남김
# 왼쪽 외부 병합 : 왼쪽에 위치한 데이터프레임을 남김


## 실습 데이터셋 준비
# === 아파트 실거래가 RDS 파일 읽기 ===

library(tidyverse)
# ── Attaching core tidyverse packages ──────────────────── tidyverse 2.0.0 ──
# ✔ dplyr     1.1.2     ✔ readr     2.1.4
# ✔ forcats   1.0.0     ✔ stringr   1.5.0
# ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
# ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
# ✔ purrr     1.0.1     
# ── Conflicts ────────────────────────────────────── tidyverse_conflicts() ──
# ✖ dplyr::filter() masks stats::filter()
# ✖ dplyr::lag()    masks stats::lag()
# ℹ Use the conflicted package to force all conflicts to become errors

getwd()
# [1] "C:/Users/DA/GitHub/R/works/rscript/DAwR"

setwd(dir = './data')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "APT_Price_Gangnam_2020.RDS"  "iris.csv"                   
# [5] "iris.RDA"                    "iris.RDS"                   
# [7] "iris.xlsx"                   "irisALL.RDA"                
# [9] "KEEP"  

price <- readRDS(file = 'APT_Price_Gangnam_2020.RDS')
str(object = price)
# 'data.frame':	3828 obs. of  9 variables:
# $ 아파트    : chr  "대치아이파크" "아카데미스위트" "우성캐릭터" "포스코더샵" ...
# $ 도로명주소: chr  "서울특별시 강남구 선릉로 222" "서울특별시 강남구 언주로30길 21" "서울특별시 강남구 언주로 118" "서울특별시 강남구 삼성로 417" ...
# $ 월        : int  1 1 1 1 1 1 1 1 1 1 ...
# $ 일        : int  2 2 2 2 3 3 3 3 3 3 ...
# $ 전용면적  : num  115 164.9 132.9 139.5 39.6 ...
# $ 층        : int  10 7 5 3 13 13 8 7 4 5 ...
# $ 거래금액  : num  30 20 17 24.7 8.7 ...
# $ 단위금액  : num  8611 4003 4220 5841 7250 ...
# $ 금액부분  : chr  "1억 미만" "1억 미만" "1억 미만" "1억 미만" ...


# === 아파트 실거래가 csv 파일 읽기 ===

fileName <- 'APT_Detail_Gangnam_2020.csv'
guess_encoding(file = fileName)
#   A tibble: 1 × 2
#   encoding confidence
#   <chr>         <dbl>
# 1 UTF-8             1

detail <- read.csv(file = fileName, fileEncoding = 'UTF-8')
str(object = detail)
# 'data.frame':	174 obs. of  12 variables:
# $ kaptCode   : chr  "A13508012" "A13579501" "A13592604" "A13508009" ...
# $ kaptName   : chr  "테헤란아이파크" "개나리푸르지오" "역삼푸르지오" "역삼I'PARK" ...
# $ kaptDongCnt: int  6 5 11 7 1 1 1 3 1 3 ...
# $ kaptdaCnt  : int  411 332 738 541 206 294 168 166 164 240 ...
# $ kaptTarea  : num  71704 70901 99363 109797 25649 ...
# $ privArea   : num  34736 35538 53254 52063 14923 ...
# $ codeSaleNm : chr  "임대+분양" "분양" "분양" "분양" ...
# $ codeHeatNm : chr  "지역난방" "지역난방" "지역난방" "지역난방" ...
# $ codeMgrNm  : chr  "위탁관리" "위탁관리" "위탁관리" "위탁관리" ...
# $ codeHallNm : chr  "계단식" "계단식" "계단식" "혼합식" ...
# $ kaptUsedate: int  20140124 20060814 20060102 20060928 19980421 20010130 20040525 20070119 20020501 20120817 ...
# $ doroJuso   : chr  "서울특별시 강남구 테헤란로52길 16" "서울특별시 강남구 역삼로 314" "서울특별시 강남구 언주로 332" "서울특별시 강남구 역삼로 307" ...

sapply(X = detail, FUN = function(x) { # x는 detail의 각 원소
    x %>% is.na() %>% sum() %>% return()
})
#   kaptCode    kaptName kaptDongCnt   kaptdaCnt   kaptTarea    privArea 
#          0          16           0           0           0           0 
# codeSaleNm  codeHeatNm   codeMgrNm  codeHallNm kaptUsedate    doroJuso 
#          0           0           0           0           0           0 


## 외래키 확인 및 전처리

# 아파트명의 경우 제공 기관마다 조금씩 다르기 때문에 관리사무소 주소 등을 외래키로 사용하는 방법이 있다

head(x = price$도로명주소, n = 10)
# [1] "서울특별시 강남구 선릉로 222"    "서울특별시 강남구 언주로30길 21"
# [3] "서울특별시 강남구 언주로 118"    "서울특별시 강남구 삼성로 417"   
# [5] "서울특별시 강남구 광평로19길 10" "서울특별시 강남구 압구정로 113" 
# [7] "서울특별시 강남구 언주로90길 6"  "서울특별시 강남구 일원로14길 25"
# [9] "서울특별시 강남구 역삼로34길 12" "서울특별시 강남구 삼성로111길 8"

head(x = detail$doroJuso, n = 10)
# [1] "서울특별시 강남구 테헤란로52길 16" "서울특별시 강남구 역삼로 314"     
# [3] "서울특별시 강남구 언주로 332"      "서울특별시 강남구 역삼로 307"     
# [5] "서울특별시 강남구 선릉로 423"      "서울특별시 강남구 언주로86길 11"  
# [7] "서울특별시 강남구 강남대로84길 33" "서울특별시 강남구 테헤란로4길 46" 
# [9] "서울특별시 강남구 언주로85길 13"   "서울특별시 강남구 역삼로 315-1" 


## 외래키 중복 여부 확인

# duplicated(x = 벡터 or df)


## === duplicated() 함수 동작 이해 ===

set.seed(seed = 1234)
nums <- sample(x = 5, size = 10, replace = TRUE)
print(x = nums)
# [1] 4 2 5 4 1 5 4 2 2 4

duplicated(x = nums)
# [1] FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE

duplicated(x = nums, fromLast = TRUE) # fromLast = TRUE 중복체크 역순으로
# [1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE

duplicated(x =nums) %>% sum()
# [1] 6 # 중복된 원소의 갯수 반환


## === 아파트 실거래 데이터에서 중복 원소 확인하기 ===

duplicated(x = detail$doroJuso) %>% sum()
# [1] 0 # 미리 정제된 데이터임.


## 데이터프레임 병합 실습

# inner_join(x = df1, y = df2, by = '외래키 컬럼명')
# full_join(x = df1, y = df2, by = '외래키 컬럼명')
# left_join(x = df1, y = df2, by = '외래키 컬럼명') # 외래키 일치시 by 생략가능

apt <- left_join(x = price,
                 y = detail,
                 by = c('도로명주소' = 'doroJuso')) # c는 "combine"의 약자, 여러 개의 요소를 하나로 묶어주는 역할

str(object = apt)
# 'data.frame':	3828 obs. of  20 variables:
# $ 아파트     : chr  "대치아이파크" "아카데미스위트" "우성캐릭터" "포스코더샵" ...
# $ 도로명주소 : chr  "서울특별시 강남구 선릉로 222" "서울특별시 강남구 언주로30길 21" "서울특별시 강남구 언주로 118" "서울특별시 강남구 삼성로 417" ...
# $ 월         : int  1 1 1 1 1 1 1 1 1 1 ...
# $ 일         : int  2 2 2 2 3 3 3 3 3 3 ...
# $ 전용면적   : num  115 164.9 132.9 139.5 39.6 ...
# $ 층         : int  10 7 5 3 13 13 8 7 4 5 ...
# $ 거래금액   : num  30 20 17 24.7 8.7 ...
# $ 단위금액   : num  8611 4003 4220 5841 7250 ...
# $ 금액부분   : chr  "1억 미만" "1억 미만" "1억 미만" "1억 미만" ...
# ============================= 결측값 존재 =============================
# $ kaptCode   : chr  "A13528102" NA "A13527003" "A13584101" ...
# $ kaptName   : chr  "대치아이파크" NA "우성캐릭터" "포스코더샵" ...
# $ kaptDongCnt: int  11 NA 2 4 7 9 NA NA NA 12 ...
# $ kaptdaCnt  : int  768 NA 199 276 1403 911 NA NA NA 926 ...
# $ kaptTarea  : num  147442 NA 100497 72319 83491 ...
# $ privArea   : num  78559 NA 29658 41858 57555 ...
# $ codeSaleNm : chr  "분양" NA "분양" "분양" ...
# $ codeHeatNm : chr  "지역난방" NA "지역난방" "지역난방" ...
# $ codeMgrNm  : chr  "위탁관리" NA "위탁관리" "위탁관리" ...
# $ codeHallNm : chr  "계단식" NA "계단식" "계단식" ...
# $ kaptUsedate: int  20080603 NA 19981107 20040930 19930908 19871205 NA NA NA 20081210 ...

apt %>% select(-kaptCode, -kaptName) -> apt
saveRDS(object = apt, file = 'APT_Dataset_Gangnam_2020.RDS')