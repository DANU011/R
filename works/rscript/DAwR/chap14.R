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

# geom_boxplot에서만 추가할 수 있는 매개변수로는 outlier.colour, outlier.fill, outlier.shape, outlier.size,
# outlier.stroke, outlier.alpha등 이상치와 관련된 것들임

# geom_boxplot(color = NULL, fill = NULL, outlier.colour = NULL,
#              outlier.fill = NULL, outlier.shape = 19, outlier.size = 1.5,
#              outlier.stroke = 1.5, outlier.alpha = NULL, -)


# === 일변량 상자 수염 그림 ===

ggplot(data = apt, mapping = aes(y = 단위금액)) + # 대신 x를 사용하면 상자 수염 그림을 가로 방향으로 눕혀서 그림
  geom_boxplot(color = 'gray30', fill = 'pink',
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림') +
  mytheme # 사용자 테마는 마지막에 추가


# === 이변량 상자 수염 그림 ===

# 최대 장점은 x축에 명목형 또는 범주형 벡터를 설정하면 벡터의 원소별 분포를 한꺼번에 시각화 가능

apt1 <- apt %>% filter(!is.na(x = codeHeatNm))
ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(color = 'gray30', fill = 'pink',
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림', x = '난방방식') +
  mytheme


# === 색 바꾸고 범례 추가 ===

ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(mapping = aes(fill = codeHeatNm), color = 'gray30',
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림', x = '난방방식') +
  mytheme

# === 범례 제거 ===

ggplot(data = apt1, mapping = aes(x = codeHeatNm, y = 단위금액)) +
  geom_boxplot(mapping = aes(fill = codeHeatNm), color = 'gray30',
               outlier.color = 'darkred', outlier.fill = 'red',
               outlier.shape = 21, outlier.size = 3,
               outlier.stroke = 2, outlier.alpha = 0.5) +
  labs(title = '단위금액 상자 수염 그림', x = '난방방식') +
  mytheme +
  theme(legend.position = 'none') # none 대신 left, right, top, bottom 등을 지정하면 원하는 위치에 범례를 옮길 수 있음


## 막대 그래프 시각화

# 일변량 막대 그래프는 명목형 또는 범주형 벡터의 원소별 빈도수를 시각화한 것

# geom_bar(color = NULL, fill = NULL, ...)


# === 일변량 막대 그래프 그리기 ===

ggplot(data = apt1, mapping = aes(x = codeHeatNm)) +
  geom_bar(mapping = aes(fill = codeHeatNm), color = 'gray30') +
  labs(title = '난방방식 막대 그래프', x = '난방방식', y = '빈도수') +
  mytheme +
  theme(legend.position = 'none')


# === 이변량 막대 그래프 ===

# geom_col(color = NULL, fill = NULL, ...)

# 이변량 막대를 그리려면 dplyr 패키지로 요약 데이터를 만들어야 함.

apt1 %>% group_by(codeHeatNm) %>% summarise(freq = n()) -> heatCnt
str(object = heatCnt)
# tibble [3 × 2] (S3: tbl_df/tbl/data.frame)
#  $ codeHeatNm: chr [1:3] "개별난방" "중앙난방" "지역난방"
#  $ freq      : int [1:3] 409 71 2306

ggplot(data = heatCnt, mapping = aes(codeHeatNm, y = freq)) +
  geom_col(mapping = aes(fill = codeHeatNm), color = 'gray30') +
  labs(title = '난방방식 막대 그래프', x = '난방방식', y = '빈도수') +
  mytheme +
  theme(legend.position = 'none')


# === 빈도수 추가 ===

# 두 가지 함수가 필요함. 텍스트를 추가하는 geom_text()와 축을 제한할 때 사용하는 coord_cartesoan(xlim = NULL, ylim = NULL) 함수가 필요함

# geom_text(mapping = aes(x = 컬럼명1, y = 컬럼명2, label = 컬럼명3),
#           color = NULL, vjust = NULL, hjust = NULL, size = 4, ...)
# coord_cartesian(xlim = NULL, ylim = NULL)

# vjust 매개변수는 라벨이 출력될 위치를 세로 방향으로 조정하고 0.5일 때 막대의 정 가운데로 설정됨. 0.5 보다 작을수록 위로 이동.
# hjust 매개변수는 라벨이 출력될 위치를 가로 방향으로 조정하고 0.5일 때 막대의 정 가운데로 설정됨. 0.5 보다 작을수록 오른쪽으로 이동.
# coord_cartesian() 함수에는 x축과 y축의 제한을 설정할 수 있음. 시작과 끝 위치를 원소로 갖는 벡터를 지정
# 막대 그래프에서 막대 위에 텍스트를 제한하는 이유는 y축을 조금 키워서 일부 텍스트가 잘리지 않도록 하기 위함.
# cartesian은 르네 데카르트가 발명한 데카르트 좌표계를 의미하며, 2차원 데카르트 좌표계를 좌표평면이라 함.

ggplot(data = heatCnt, mapping = aes(x = codeHeatNm, y = freq)) +
  geom_col(mapping = aes(fill = codeHeatNm), color = 'gray30') + 
  coord_cartesian(ylim = c(0, 2500)) + # 기존 그래프보다 y축을 조금 키움
  geom_text(mapping = aes(label = freq),
            vjust = -1, size = 3) +
  labs(title = '난방방식 막대 그래프', x = '난방방식', y = '빈도수') +
  mytheme +
  theme(legend.position = 'none')


## 선 그래프 시각화

# 주로 시간의 흐름에 따라 연속성 데이터의 변화를 시각화
# x축에 사간 관련 컬럼 지정, y축에 연속성 컬럼 지정

# geom_line(mapping = aes(group = 컬럼명), color = NULL, linetype = NULL,
#           size = 0.5, ...)


# === 이변량 선 그래프 그리기 ===

apt1 %>% 
  group_by(월) %>% 
  summarise(평균단위금액 = mean(x = 단위금액)) -> monthMean

str(object = monthMean)
# tibble [12 × 2] (S3: tbl_df/tbl/data.frame)
#  $ 월          : int [1:12] 1 2 3 4 5 6 7 8 9 10 ...
#  $ 평균단위금액: num [1:12] 7089 7238 6679 6868 7009 ...

ggplot(data = monthMean, mapping = aes(x = 월, y = 평균단위금액)) +
  geom_line(color = 'red', linetype = 1, size = 1) +
  labs(title = '월별 평균단위금액 선 그래프') +
  mytheme


# === 데이터 처리: 단위금액 커럼의 편균을 갖는 데이터프레임 생성 ===

apt1 %>% 
  group_by(월, codeHeatNm) %>% 
  summarise(평균단위금액 = mean(단위금액), .groups = 'drop') -> monthMean2
# 2개 이상의 컬럼으로 그룹을 설졍하면 summarise() 함수를 실행한 결과에 그룹 설정이 여전히 남아 있으므로 .group = 'drop'을 추가하여 그룹을 제거해 주는것이 좋음

str(object = monthMean2)
# tibble [36 × 3] (S3: tbl_df/tbl/data.frame)
#  $ 월          : int [1:36] 1 1 1 2 2 2 3 3 3 4 ...
#  $ codeHeatNm  : chr [1:36] "개별난방" "중앙난방" "지역난방" "개별난방" ...
#  $ 평균단위금액: num [1:36] 5224 6194 7477 5435 6044 ...

head(x = monthMean2) # 행 길이 36, 열 길이 3인 티블 == Lomg Type 데이터프레임임
# A tibble: 6 × 3
#      월 codeHeatNm 평균단위금액
#   <int> <chr>             <dbl>
# 1     1 개별난방          5224.
# 2     1 중앙난방          6194 
# 3     1 지역난방          7477.
# 4     2 개별난방          5435.
# 5     2 중앙난방          6044.
# 6     2 지역난방          7554.


# === Long Type 데이터프레임으로 선 그래프 그리기 ===

ggplot(data = monthMean2, mapping = aes(x = 월, y = 평균단위금액)) + 
  geom_line(color = 'red', size = 1) +
  labs(title = '월별 평균단위금액 선 그래프') +
  mytheme


# === Long Type df으로 선 그래프 그릴 때 group으로 묶기

# 36개 행의 평균단위금액 컬럼값이 하나의 선으로 그려짐. group 매개변수에 codeHeatNm 칼럼을 지정해야함.
# x축 눈금이 소수점으로 표현됨. 우러 컬럼을 범주형 벡터로 변환하면 해결됨.

monthMean2 %>% mutate(월 = as.factor(x = 월)) -> monthMean2
ggplot(data = monthMean2, mapping = aes(x = 월, y = 평균단위금액)) +
  geom_line(mapping = aes(group = codeHeatNm, color = codeHeatNm),
            size = 1) +
  labs(title = '월별 평균단위금액 선 그래프') + 
  mytheme +
  theme(legend.position = 'bottom')


## 산점도 시각화

# geom_point(color = NULL, fill = NULL, shape = 19, alpha = NULL, size = 1.5,
#            stroke = 0.5, ...)


# === 이변량 산점도 그리기 ===

ggplot(data = apt, mapping = aes(x = 전용면적, y = 거래금액)) +
  geom_point(color = 'gray30', fill = 'gray80', shape = 21,
             size = 2, alpha = 0.5, stroke =1) +
  labs(title = '전용면적과 거래금액의 산점도') +
  mytheme


# === 수직선/수평선으로 구역 나누기

# geom_vline(xintercept = 숫자형 벡터, color = NULL, linetype = NULL, ...)
# geom_hline(yintercept = 숫자형 벡터, color = NULL, linetype = NULL, ...)

# 산점도에 전용면적 컬럼의 평균으로 수직선, 거래금액 컬럼의 평균으로 수평선을 추가하면 산점도를 4개 구역으로 나누어 볼 수 있음.

ggplot(data = apt, mapping = aes(x = 전용면적, y = 거래금액)) +
  geom_point(color = 'gray30', fill = 'gray80', shape = 21,
             size = 2, alpha = 0.5, stroke = 1) +
  geom_vline(xintercept = mean(x = apt$전용면적), color = 'red', linetype = 2) +
  geom_hline(yintercept = mean(x = apt$거래금액), color = 'red', linetype = 2) +
  labs(title = '전용면적과 거래금액의 산점도') +
  mytheme

getwd()
setwd(dir = 'C:/Users/82102/git/R/works/rscript/DAwR')
