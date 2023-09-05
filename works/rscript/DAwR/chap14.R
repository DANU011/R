## ggplot2

# ggplot() 함수와 geom_*() 함수로 그래프의 기본 골격을 만든다
# coord_*(), scale_*(), facet_*() 함수 등 필요한 레이어를 추가함으로써 그래프를 통해 전달하려는 메시지를 효과적으로 표현 가능
# 각 레이어는 파이프 연산다 대신 + 기호로 연결

# ggplot(data = df,
#        mapping = aes(x = 컬럼명1, y = 컬럼명2, ...), # aes는 aesthetic에서 따옴 
#                  종류에 따라 컬럼 지정 개수가 다름 ex)히스토그램 컬럼 1개, 산점도 2개
#        color = '테두리 색',
#        fill = '채우기 색',
#        alpha = '투명도',
#        shape = '점의 모양',
#        size = '크기',
#        stroke = '선 굵기', ...)
# 컬럼에 따라 색이나 선을 다르게 지정하고 싶다면 aes() 함수 안으로 옮겨서 컬럼명을 따옴표 없이 지정


# === geom_*() ===

# geom_histogram() 히스토그램
# geom_boxplot() 상자 수염 그림
# geom_bar() 일변량 막대 그래프
# geom_col() 이변량 막대 그래프
# geom_line() 선그래프
# geom_point() 산점도
# geom_text() 그래프에 글자 추가
# geom_label() 그래프에 라벨 추가
# geom_hline() 그래프에 수평선 추가
# geom_vline() 그래프에 수직선 추가

# ggplot() 함수의 매개변수를 geom_*() 함수에도 그대로 사용할 수 있음
# ggplot() 함수에서는 설정된 요소가 그래프 전체에 적용
# geom_*() 함수에서는 설정된 데이터프레임과 그래프의 각 요소는 해당 그래프에만 적용


# === ggplot2 패키지 함수 사용 예제 ===

library(tidyverse)
ggplot(data = iris,
       mapping = aes(x = Sepal.Length,
                     y = Sepal.Width,
                     fill = Species)) + # 채우기 색을 Species에 따라 다르게 설정
  geom_point(shape = 21, size = 3) +
  coord_cartesian(xlim = c(4, 8)) + # x축의 좌표 범위를 4부터 8까지 설정
  theme_bw()


## 데이터 시각화 종류

# 데이터 시각화 그래프는 일변량, 이변량, 다변량으로 나타낼 수 있음
# 관측 대상을 수치 하나로 나타면 일변량, 둘로 나타내면 이변량, 셋 이상으로 나타내면 다변량 그래프

# 히스토그램: 도수분포표를 그림으로 표현한 것. 도수분포표는 일변량 연속형 데이터를 간격이 일정한 계급으로 나누고,
# 각 계급에 속한 데이터의 빈도수를 표로 정리한 것. 히스토그램은 막대가 서로 붙어 있으며, 세로축에 빈도수 대신 밀도로 바꿔서 그릴 수 있음
# 이런 경우, 막대의 총 면적은 확률 1을 의미

# 상자 수염 그림: 일변량 연속형 데이터 분포에 사분위수와 이상치를 추가한 그래프. 
# 상자 수염 그림이 히스토그램과 다른 점은 집단이 여러 개인 경우에도 하나의 그래프로 그릴 수 있어 집단간 분포를 쉽게 비교할 수 있음.
# 막대 그래프: 일변량 막대 그래프와 이변량 막대 그래프로 구분. 일변량 막대 그래프는 범주형 데이터의 빈도수를 막대로 시각화 한 것.
# 이변량 막대 그래프는 범주형 데이터에 따라 연속형 데이터의 크기를 시각화 한 것. 데이터의 형태에 따라 막대 그래프를 그리는 방법이 달라짐.

# 선 그래프: 주로 시간의 흐름에 따라 연속형 데이터의 변화 양상을 시각화한 그래프.
# 월별 거래금액의 평균을 선 그래프를 선 그래프로 그리면 시간의 흐름에 따라 거래금액의 평균이 변화하는 정도를 확인 할 수 있음.

# 산점도: 이변량 연속형 데이터의 상관관계를 2차원 평면에 점으로 표현한 그래프.
# 산점도를 그림으로써 두 데이이터간 상관관계의 방향과 강도를를 육안으로 확인할 수 있음.
# 선형 회기분석을 실시하기 전에 입력변수와 목표변수 간 산점도를 그리고 상관분석을 실시하여 두 데이터 간 상관관계가 존재하는지 확인.


## 실습 데이터셋 준비 및 폰트 추가
# === 실습 데이터셋 준비 ===
getwd()
setwd(dir = 'C:/Users/82102/git/R/works/rscript/DAwR/data')
list.files()
# [1] "APT_Dataset_Gangnam_2020.RDS" "APT_Detail_Gangnam_2020.csv" 
# [3] "APT_Price_Gangnam_2020.csv"   "APT_Price_Gangnam_2020.RDS"  
# [5] "iris.RDA"                     "iris.xlsx"                   
# [7] "irisALL.RDA"                  "KEEP"   

apt <- readRDS(file = 'APT_Dataset_Gangnam_2020.RDS')


# === 한글 폰트 추가 ===

# font_add_google(name = '구글 폰트명', family = 'RStudio에서 사용할 폰트명')
# showtext_auto() # 실행해야 한글 폰트 설정이 완료됨

library(showtext)

font_add_google(name = 'Nanum Gothic Coding', family = 'NanumGothicCoding')
font_add_google(name = 'Gamja Flower', family = 'GamjaFlower')

showtext_auto()


## 히스토그램 시각화

# 일변량 연속형 컬럼의 분포를 시각화

# geom_histogram(bins = NULL, breaks = NULL, color = NULL, fill = NULL, ...)
# bins 매개변수에는 막대 개수를 정수로 지정, breaks 매개변수는 막대 경계를 실수형 벡터로 지정
# bins or breaks를 생략하면 bins에 기본값인 30이 자동으로 지정


# === 기본형 히스토그램 ===

ggplot(data = apt, mapping = aes(x = 거래금액)) +
  geom_histogram()
# `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.


# === 히스토그램 막대 간격과 채우기 및 테두리 색 설정 ===

# 히스토그램을 그리기 전에 해당 컬럼의 최솟값과 최댓값을 미리 확인하고, 막대 경계를 적당한 간격을 설정해주면(==비닝) 보기 좋은 히스토그램을 그릴 수 있음

range(apt$거래금액)
# [1]  1.5 67.0
breaks <- seq(from = 0, to = 70, by = 2)
ggplot(data = apt, mapping = aes(x = 거래금액)) +
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink')


# === 히스토그램 제목 밎 완성된 테마 추가 ===

# labs(title = '제목', x = 'x축 이름', y = 'y축 이름')
# theme_bw(base_family = '한글 폰트명')

ggplot(data = apt, mapping = aes(x = 거래금액)) +
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink') + 
  labs(title = '거래금액 히스토그램', x = '거래금액', y = '빈도수') +
  theme_bw(base_family = 'GamjaFlower')


# === 히스토그램 테마 수정 ===

ggplot(data = apt, mapping = aes(x = 거래금액)) +
  geom_histogram(breaks = breaks, color = 'gray30', fill = 'pink') +
  labs(title = '거래금액 히스토그램', x = '거래금액', y = '빈도수') +
  theme_bw(base_family = 'GamjaFlower') +
  theme(plot.title = element_text(size = 14, hjust = 0.5))

mytheme <- theme_bw(base_family = 'NanumGothicCoding') +
  theme(plot.title = element_text(size = 14, hjust = 0.5),
        panel.grid = element_blank())


## 상자 수염 그림 시각화

# 일변량 연속형 데이터의 분포에 사분위수와 이상치를 시각화. 히스토그램과 달리 데이터 분포를 세로로 표현
