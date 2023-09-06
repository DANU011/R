## 작업 경로 확인 및 변경

getwd() # [1] "C:/Users/DA/GitHub/R/works/rscript/DAwR"
list.files() # <- 현재 작업 경로에 포함된 폴더명과 파일명 출력
#  [1] "chap01.R"   "chap02.R"   "chap03.R"   "chap04.R"   "chap05.R"  
#  [6] "chap06.R"   "chap07.R"   "chap08.R"   "chap09.R"   "data"      
# [11] "DAwR.Rproj" "myFuns.R"   "output"     "recheck.R" 


# === 명령어로 작업 경로 변경 ===

setwd(dir = 'C:/Users/DA/GitHub/R/works/rscript/DAwR/data')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "KEEP"                       

# ./ 현재폴더, ../ 현재 폴더의 상위 폴더


## 엑셀 파일 입출력

# write_xlsx(x = 객체명, path = '저장할 xlsx 파일명')

# read_xlsx(path = '읽을 xlsx 파일명',
#           sheet = '시트명',
#           skip = 생략할 행 개수) <- 컬럼명 생략등에 사용

install.packages('writexl')
library(writexl)
write_xlsx(x = iris, path = 'iris.xlsx')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "iris.xlsx"                   "KEEP"    

library(readxl)
obj1 <- read_xlsx(path = 'iris.xlsx')
str(object = obj1)
# tibble [150 × 5] (S3: tbl_df/tbl/data.frame) <- tibble은 데이터프레임이 가진 일부 단점을 보완한 자료구조, 출력했을 때 컬럼별 자료형이 추가됨
#  $ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#  $ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : chr [1:150] "setosa" "setosa" "setosa" "setosa" ... <- 원래 범주형인데 xlsx 입출력 과정에서 문자형 벡터로 변환됨


## 텍스트 파일 입출력 : csv

# write.csv(x = 객체형,
#           file = '저장할 csv 파일명',
#           sep = ',', <- 각 셀을 구분하는 구분자
#           row.names = TRUE, <- 행이름 csv 파일에 추가
#           col.names = TRUE, <- 열이름 csv 파일에 추가
#           fileEncoding = '')

# read.csv(file = '읽을 csv 파일명',
#          sep = ',',
#          header = TRUE, <- 첫 번쨰 해을 컬럼명(열이름)으로 간주
#          skip = 생략할 행 개수,
#          fileEncoding = '') <- csv, txt 파일은 운영체제의 기본 문자 인코딩 방식과 다르면 읽을 떄 에러 발새으 반드시 인코딩 방식 명시 필요


# === csv 파일 입출력 ===

write.csv(x = iris, file = 'iris.csv')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "iris.csv"                    "iris.xlsx"                  
# [5] "KEEP"  

obj2 <- read.csv(file = 'iris.csv')
str(object = obj2)
# 'data.frame':	150 obs. of  6 variables:
#  $ X           : int  1 2 3 4 5 6 7 8 9 10 ... <- 열이름 X, 정수형 벡터 iris의 행이름이 추가된 것
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : chr  "setosa" "setosa" "setosa" "setosa" ...

write.csv(x = iris, file = 'iris.csv', row.names = FALSE) # <- row.names 매개변수에 FALSE 지정하면 행이름 추가 안됨 
obj2 <- read.csv(file = 'iris.csv')
str(object = obj2)
# 'data.frame':	150 obs. of  5 variables:
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : chr  "setosa" "setosa" "setosa" "setosa" ...


# === 문자 인코딩 방식 확인 ===

# library(readr)
# guess_encoding(file = '텍스트 파일명 또는 url')

library(readr)
fileName <- 'APT_Price_Gangnam_2020.csv'
guess_encoding(file = fileName) # <- 문자 인코딩 방식이 여러개 출력될 수 있음
# # A tibble: 1 × 2
#   encoding confidence
#   <chr>         <dbl>
#     
# 1 UTF-8             1  <- UTF-8 인코딩 방식의 신뢰도가 1이며 가장 높음

price <- read.csv(file = fileName, fileEncoding = 'UTF-8') # <- 윈도우에서는 반드시 fileEncoding 매개변수 추가해야함 
str(object = price)
# 'data.frame':	3828 obs. of  8 variables:
#  $ 일련번호  : chr  "11680-3752" "11680-566" "11680-340" "11680-532" ...
#  $ 아파트    : chr  "대치아이파크" "아카데미스위트" "우성캐릭터" "포스코더샵" ...
#  $ 도로명주소: chr  "서울특별시 강남구 선릉로 222" "서울특별시 강남구 언주로30길 21" "서울특별시 강남구 언주로 118" "서울특별시 강남구 삼성로 417" ...
#  $ 월        : int  1 1 1 1 1 1 1 1 1 1 ...
#  $ 일        : int  2 2 2 2 3 3 3 3 3 3 ...
#  $ 전용면적  : num  115 164.9 132.9 139.5 39.6 ...
#  $ 층        : int  10 7 5 3 13 13 8 7 4 5 ...
#  $ 거래금액  : int  300000 200000 170000 247000 87000 210000 20200 120000 77000 224500 ...


## RDS 파일 입출력

# RSD 파일은 하나의 R 객체를 외부 파일로 저장하는 형태. R 사용자끼리 공유할 때는 자료형을 유지하는 RDS 파일이 더 좋음

# saveRDS(object = 객체명, file = '저장할 RDS 파일명')
# readRDS(file = '읽을 RDS 파일명')

saveRDS(object = iris, file = 'iris.RDS')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "iris.csv"                    "iris.RDS"                   
# [5] "iris.xlsx"                   "KEEP" 

obj3 <- readRDS(file = 'iris.RDS')
str(object = obj3)
# 'data.frame':	150 obs. of  5 variables:
#  $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
#  $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
#  $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
#  $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
#  $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...


## RDA 파일 입출력

# 다수의 R 객체를 하나의 외부 파일로 담을 때 사용


## === 저장하고 읽기 ===

# save(객체명1, 객체명2, ..., file = '저장할 RDA 파일명')
# save.image(file = '저장할 RDA 파일명')
# load(file = '읽을 RDA 파일명')

save(iris, file = 'iris.RDA')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "iris.csv"                    "iris.RDA"                   
# [5] "iris.RDS"                    "iris.xlsx"                  
# [7] "KEEP" 

load(file = 'iris.RDA')


# === [Environment] 탭에 있는 R 객체를 포함해 RDA 파일 생성

save.image(file = 'irisALL.RDA')
list.files()
# [1] "APT_Detail_Gangnam_2020.csv" "APT_Price_Gangnam_2020.csv" 
# [3] "iris.csv"                    "iris.RDA"                   
# [5] "iris.RDS"                    "iris.xlsx"                  
# [7] "irisALL.RDA"                 "KEEP"     


## R 객체 삭제

# ls() <- [Environment] 탭에 있는 모든 R 객체명을 문자형 벡터로 생성
# # rm(list = ls()) <- rm() 함수안에 ls()함수를 입력하면 [Environment] 탭에 있는 모든 R 객체명 삭제 

ls()
#  [1] "apiKey"      "areaCD"      "data"        "df"          "fileName"   
#  [6] "getGrade"    "grade"       "guessHeight" "iris"        "obj1"       
# [11] "obj2"        "obj3"        "price"       "Pythagoras"  "res"        
# [16] "score"       "text"        "URL"         "ymonth"

rm(list = ls())
load(file = 'irisALL.RDA')