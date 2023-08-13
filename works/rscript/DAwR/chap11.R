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

# 