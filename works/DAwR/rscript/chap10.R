## 데이터 가져오기

install.packages('httr')
library(httr)
# GET(url = Call Back URL, query = list(요청변수1 = 값1, 요청변수2 = 값2, ...)) # 기술문서에 있는 내용

URL <- 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade'
areaCD <- '11110'
ymonth <- '201512'
apiKey <- '0QpsBacnY161CkT22m2WPZOjE4Ij80hQiXdq79044Aup3Oek+5oh7FauomqPINqmM3a1dJOPQQ3IMfOXYXSnZQ=='

res <- GET(url = URL,
           query = list(LAWD_CD = areaCD,
                        DEAL_YMD = ymonth,
                        serviceKey = apiKey))
print(res)
# Response [http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJvc/getRTMSDataSvcAptTrade?LAWD_CD=11110&DEAL_YMD=201512&serviceKey=인증키]
# Date: 2023-08-10 04:01
# Status: 200 # 정상
# Content-Type: application/json # 데이터 콘텐트 타입 JSON
# Size: 15.4 kB

# content(x = res, as = 'text') <- httr 패키지 힘수 JSON 데이터를 텍스트 형태로 반환.

text <- content(x = res, as = 'text') 
# No encoding supplied: defaulting to UTF-8. <- 인코딩　방식을　추가하지　않으면　기본값인 UTF-8 적용.
print(x = text)
# [1] "{\"response\":{\"header\":{\"resultCode\":\"00\",\"resultMsg\":\"NORMAL SERVICE.\"},
# \"body\":{\"items\":{\"item\":[{\"거래금액\":\"      82,500\",\"거래유형\":\" \",\"건축년도\":2008,
# \"년\":2015,\"등기일자\":\" \",\"법정동\":\" 사직동\",\"아파트\":\"광화문스페이스본(101동~105동)\",
# \"월\":12,\"일\":10,\"전용면적\":94.51,\"중개사소재지\":\" \",\"지번\":9,\"지역코드\":11110,\"층\":11,
# \"해제사유발생일\":\" \",\"해제여부\":\" \"}, 후략


## 데이터 처리하기

library(jsonlite)

# fromJSON(txt = JSON 타입의 텍스트 데이터) <- 위에서 생성한 문자형 벡터 text를 넣어서 할당
# data는 리스트인데 data의 원소는 response -> body -> items -> item 순서로 연결되어 있음
# 마지막 원소인 item은 데이터프레임

data <- fromJSON(txt = text)
str(object = data)
# List of 1
# $ response:List of 2
# ..$ header:List of 2
# .. ..$ resultCode: chr "00"
# .. ..$ resultMsg : chr "NORMAL SERVICE."
# ..$ body  :List of 4
# .. ..$ items     :List of 1
# .. .. ..$ item:'data.frame':	49 obs. of  16 variables:
#     .. .. .. ..$ 거래금액      : chr [1:49] "      82,500" "      60,000" "     130,000" "     105,000" ...
# .. .. .. ..$ 거래유형      : chr [1:49] " " " " " " " " ...
# .. .. .. ..$ 건축년도      : int [1:49] 2008 1981 2004 2004 2003 2014 2014 2006 1995 1995 ...
# .. .. .. ..$ 년            : int [1:49] 2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 ... 후략

df <- data$response$body$items$item
str(object = df)
# 'data.frame':	49 obs. of  16 variables:
#     $ 거래금액      : chr  "      82,500" "      60,000" "     130,000" "     105,000" ...
# $ 거래유형      : chr  " " " " " " " " ...
# $ 건축년도      : int  2008 1981 2004 2004 2003 2014 2014 2006 1995 1995 ...
# $ 년            : int  2015 2015 2015 2015 2015 2015 2015 2015 2015 2015 ...
# $ 등기일자      : chr  " " " " " " " " ...
# $ 법정동        : chr  " 사직동" " 당주동" " 내수동" " 내수동" ...
# $ 아파트        : chr  "광화문스페이스본(101동~105동)" "롯데미도파광화문빌딩" "킹스매너" "경희궁의아침2단지" ...
# $ 월            : int  12 12 12 12 12 12 12 12 12 12 ...
# $ 일            : int  10 22 8 14 24 17 18 29 1 10 ...
# $ 전용면적      : num  94.5 149.9 194.4 124.2 146.3 ...
# $ 중개사소재지  : chr  " " " " " " " " ...
# $ 지번          : chr  "9" "145" "110-15" "71" ...
# $ 지역코드      : int  11110 11110 11110 11110 11110 11110 11110 11110 11110 11110 ...
# $ 층            : int  11 8 6 8 4 8 4 3 18 12 ...
# $ 해제사유발생일: chr  " " " " " " " " ...
# $ 해제여부      : chr  " " " " " " " " ...