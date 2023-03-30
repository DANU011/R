# 직장인 -> 생산성과 협력 --> 보고서(이해가능)
# 결과물은 누군가가 이해 => git, github
# 범주형데이터 지우고 돌려보기 

# 회귀 => 값을 예측하는 것
## 단순회기
#========================================================================

# 캘리포니아 집 값을 예측

## 예측을 어떻게 하는거야?
# 1. 데이터 불러오기 확인 -> 시작적인 확인 
# 2-1. 전처리 과정 -> NA처리
# 2-2. 후처리 과정 -> 표준화와 정규화 /1,2가 중요 통계학자들이 많이함.
# 3. 데이터를 분리 -> 학습과 검증
# 4. 학습 -> 기울기와 절편
# 5. 검증 -> 모델을 검증 
# 6. 마음에 안들면 3번부터 다시 시작

library(tidyverse)
library(reshape2)
# 1. 데이터 불러오기 확인 -> 시작적인 확인
# 시각화 왜? 경향 확인 하려고. 경향이 숫자로는 보이지 않음.
housing = read.csv("C:/works/data/housing.csv")
head(housing)

colnames(housing)

ggplot(data = melt(housing), mapping = aes(x = value))+
  geom_histogram(bins = 30)+
  facet_wrap(~variable, scales = 'free_x')

#2. 전처리 - na처리 , 문자 숫자로. 첨탑 누르기
# 어떤 데이터의 편향이 강하면 중앙값 사용 평균x
# 연속형숫자 -> 소숫점많은 숫자/ 비연속 - 히스토크램, 연속 - 산점도
# 전처리 clean_data_날짜 -> 2번까지는 끝났다.
# 회기 정규화 반드시 
# ->데이터 경향보고 결정 뾰족하면 정규화 완만하면 표준화
housing$total_bedrooms[is.na(housing$total_bedrooms)] <- median(housing$total_bedrooms, na.rm=TRUE)
sum(is.na(housing))

housing$mean_bedrooms <- housing$total_bedrooms/housing$households
housing$mean_rooms <- housing$total_rooms/housing$households
head(housing)

drops <- c('total_bedrooms', 'total_rooms')
housing <- housing[ , !(names(housing) %in% drops)]
head(housing)

categories <- unique(housing$ocean_proximity)
cat_housing <- data.frame(ocean_proximity = housing$ocean_proximity)
head(cat_housing)

for(cat in categories){
  cat_housing[,cat] = rep(0, times= nrow(cat_housing))
}

head(cat_housing)

for(i in 1:length(cat_housing$ocean_proximity)){
  cat <- as.character(cat_housing$ocean_proximity[i])
  cat_housing[,cat][i] <- 1
}
head(cat_housing)

cat_columns <- names(cat_housing)
keep_columns <- cat_columns[cat_columns != 'ocean_proximity']
cat_housing <- select(cat_housing,one_of(keep_columns))
tail(cat_housing)

colnames(housing)

drops <- c('ocean_proximity','median_house_value')
housing_num <-  housing[ , !(names(housing) %in% drops)]
head(housing_num)

scaled_housing_num <- scale(housing_num)
head(scaled_housing_num)

cleaned_housing <- cbind(cat_housing, scaled_housing_num, median_house_value=housing$median_house_value)
head(cleaned_housing)

# 3. 데이터를 분리 -> 학습과 검증

# 머신러닝 일반적으로 학습용7 검증용3 정도 비율로 나눔.
# 이 때 셀렉x 임의랜덤으로 나눠야함.
# 풀 때의 오차를 보고 판단.

set.seed(42) #우리가 할 때는 고정
sample <- sample.int(n = nrow(cleaned_housing), size = floor(.8*nrow(cleaned_housing)), replace = F) # 8:2
train <- cleaned_housing[sample, ] #just the samples /학습용
test  <- cleaned_housing[-sample, ] #everything but the samples /검증용
head(train)

#분리된 데이터가 전체 데이터를 반영하고 있는지 확인
nrow(train) + nrow(test) == nrow(cleaned_housing)

'''
- 소득(중앙값) : `median_income` 
- 방 수(평균값) : `mean_rooms` 
- 인구 : `population` 
'''
#rmse 이기려면 설명가능한 rmse 찾아야함.
#로지스틱안함 분류문제
#랜덤포레스트 전처리 안해도 값이 나옴.
#xgboost까지갈것

glm_house = glm(median_house_value~median_income+mean_rooms+population, data=cleaned_housing)
k_fold_cv_error = cv.glm(cleaned_housing , glm_house, K=5) #다섯번돌려라 k_fold_cv_error 잔차값을 알고싶음
k_fold_cv_error$delta #delta 차잇값






