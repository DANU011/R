## dplyr

# 데이터프레임을 변형하는 데 필요한 함수를 다수 포함. %>%(파이프 연산자)를 지원해서 가독성 높은 코드를 쉽게 작성.


# === 파이프 연산자 ===

# table(벡터) <- 문자형, 범주형, 정수형 벡터의 원소별 '빈도수' 반환

# prop.table(table(벡터)) <- 벡터 원소별 빈도수를 '비율'로 반환

table(iris$Species)
# setosa versicolor  virginica 
#     50         50         50

prop.table(x = table(iris$Species))
#    setosa versicolor  virginica 
# 0.3333333  0.3333333  0.3333333

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

iris$Species %>% table() %>% prop.table() # shift + ctrl + m
#    setosa versicolor  virginica 
# 0.3333333  0.3333333  0.3333333


# === dplyr 사용 예제 ===

# df에서 컬럼을 선택하거나 제거
# 행번호로 행을 잘라내거나, 조건에 맞는 행 걸러내기
# 그룹 설정, 숫자 컬럼을 집계함수로 요약
# 기존 컬럼 변형, 새로운 컬럼 생성
# df 정렬 오름차순 혹은 내림차순

library(magrittr)
library(dplyr)

iris %>% 
    select(Sepal.Length, Species) %>% 
    filter(Sepal.Length >= 5.2) %>% 
    group_by(Species) %>% 
    summarise(Count = n()) %>% 
    mutate(Pcnt = Count / sum(Count)) %>% 
    arrange(desc(x = Pcnt))
# A tibble: 3 × 3
#   Species    Count  Pcnt
#   <fct>      <int> <dbl>
# 1 virginica     49 0.450
# 2 versicolor    46 0.422
# 3 setosa        14 0.128
