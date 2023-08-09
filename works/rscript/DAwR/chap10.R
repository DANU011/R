## 데이터 가져오기

install.packages('httr')
library(httr)
# GET(url = Call Back URL, query = list(요청변수1 = 값1, 요청변수2 = 값2, ...)) # 기술문서에 있는 내용

URL <- 'http://openapi/molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade'
areaCD <- '11110'
ymonth <- '201512'
apiKey <- '0QpsBacnY161CkT22m2WPZOjE4Ij80hQiXdq79044Aup3Oek+5oh7FauomqPINqmM3a1dJOPQQ3IMfOXYXSnZQ=='

res <- GET(url = URL,
           query = list(LAWD_CD = areaCD,
                        DEAL_YMD = ymonth,
                        serviceKey = apiKey))
print(res)
