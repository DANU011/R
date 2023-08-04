# 5.reshape2 패키지를 이용하여 단계별로 iris 데이터 셋을 처리하시오.

head(iris)
library('reshape2')

#[단계1] 꽃의 종류(Species)를 기준으로 ‘넓은 형식’을 ‘긴 형식’으로 변경하기
#힌트) melt() 함수 이용
melt <- melt(iris, id=c("Species"), na.rm=TRUE)
head(melt)

#[단계2] 꽃의 종별로 나머지 4가지 변수의 합계 구하기
#힌트) dcast() 함수 이용
dcast <- dcast(melt, Species ~ variable, sum)
head(dcast)
