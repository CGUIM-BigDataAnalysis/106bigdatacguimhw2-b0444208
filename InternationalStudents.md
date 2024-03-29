106-2 大數據分析方法 作業二
================
Yi-Ju Tseng

作業完整說明[連結](https://docs.google.com/document/d/1aLGSsGXhgOVgwzSg9JdaNz2qGPQJSoupDAQownkGf_I/edit?usp=sharing)

學習再也不限定在自己出生的國家，台灣每年有許多學生選擇就讀國外的大專院校，同時也有人多國外的學生來台灣就讀，透過分析[大專校院境外學生人數統計](https://data.gov.tw/dataset/6289)、[大專校院本國學生出國進修交流數](https://data.gov.tw/dataset/24730)、[世界各主要國家之我國留學生人數統計表](https://ws.moe.edu.tw/Download.ashx?u=C099358C81D4876CC7586B178A6BD6D5062C39FB76BDE7EC7685C1A3C0846BCDD2B4F4C2FE907C3E7E96F97D24487065577A728C59D4D9A4ECDFF432EA5A114C8B01E4AFECC637696DE4DAECA03BB417&n=4E402A02CE6F0B6C1B3C7E89FDA1FAD0B5DDFA6F3DA74E2DA06AE927F09433CFBC07A1910C169A1845D8EB78BD7D60D7414F74617F2A6B71DC86D17C9DA3781394EF5794EEA7363C&icon=..csv)可以了解103年以後各大專院校國際交流的情形。請同學分析以下議題，並以視覺化的方式呈現分析結果，呈現103年以後大專院校國際交流的情形。

來台境外生分析
--------------

### 資料匯入與處理

``` r
#這是R Code Chunk
#install.packages("readr")
library(readr)
c103 <- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=25f64d5125016dcd6aed42e50c972ed0")
```

    ## Parsed with column specification:
    ## cols(
    ##   洲別 = col_character(),
    ##   國別 = col_character(),
    ##   `學位生-正式修讀學位外國生` = col_integer(),
    ##   `學位生-僑生(含港澳)` = col_integer(),
    ##   `學位生-正式修讀學位陸生` = col_integer(),
    ##   `非學位生-外國交換生` = col_integer(),
    ##   `非學位生-外國短期研習及個人選讀` = col_integer(),
    ##   `非學位生-大專附設華語文中心學生` = col_integer(),
    ##   `非學位生-大陸研修生` = col_integer(),
    ##   `非學位生-海青班` = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
s103<- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=a6d1469f39fe41fb81dbfc373aef3331")
```

    ## Parsed with column specification:
    ## cols(
    ##   學校類型 = col_character(),
    ##   學校代碼 = col_character(),
    ##   學校名稱 = col_character(),
    ##   `學位生-正式修讀學位外國生` = col_integer(),
    ##   `學位生-僑生(含港澳)` = col_integer(),
    ##   `學位生-正式修讀學位陸生` = col_integer(),
    ##   `非學位生-外國交換生` = col_integer(),
    ##   `非學位生-外國短期研習及個人選讀` = col_integer(),
    ##   `非學位生-大專附設華語文中心學生` = col_integer(),
    ##   `非學位生-大陸研修生` = col_character(),
    ##   `非學位生-海青班` = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
c104 <- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=4d3e9b37b7b0fd3aa18a388cdbc77996")
```

    ## Parsed with column specification:
    ## cols(
    ##   洲別 = col_character(),
    ##   國別 = col_character(),
    ##   `學位生-正式修讀學位外國生` = col_integer(),
    ##   `學位生-僑生(含港澳)` = col_integer(),
    ##   `學位生-正式修讀學位陸生` = col_integer(),
    ##   `非學位生-外國交換生` = col_integer(),
    ##   `非學位生-外國短期研習及個人選讀` = col_integer(),
    ##   `非學位生-大專附設華語文中心學生` = col_integer(),
    ##   `非學位生-大陸研修生` = col_integer(),
    ##   `非學位生-海青班` = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
s104<- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=8baeae81cba74f35cf0bb1333d3d99f5")
```

    ## Parsed with column specification:
    ## cols(
    ##   學校類型 = col_character(),
    ##   學校代碼 = col_character(),
    ##   學校名稱 = col_character(),
    ##   `學位生-正式修讀學位外國生` = col_integer(),
    ##   `學位生-僑生(含港澳)` = col_integer(),
    ##   `學位生-正式修讀學位陸生` = col_integer(),
    ##   `非學位生-外國交換生` = col_integer(),
    ##   `非學位生-外國短期研習及個人選讀` = col_integer(),
    ##   `非學位生-大專附設華語文中心學生` = col_integer(),
    ##   `非學位生-大陸研修生` = col_character(),
    ##   `非學位生-海青班` = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
c105 <- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=19bedf88cf46999da12513de755c33c6")
```

    ## Parsed with column specification:
    ## cols(
    ##   洲別 = col_character(),
    ##   國別 = col_character(),
    ##   學位生_正式修讀學位外國生 = col_integer(),
    ##   `學位生_僑生(含港澳)` = col_integer(),
    ##   學位生_正式修讀學位陸生 = col_integer(),
    ##   非學位生_外國交換生 = col_integer(),
    ##   非學位生_外國短期研習及個人選讀 = col_integer(),
    ##   非學位生_大專附設華語文中心學生 = col_integer(),
    ##   非學位生_大陸研修生 = col_integer(),
    ##   非學位生_海青班 = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
s105<- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=1a485383cf9995da679c3798ab4fd681")
```

    ## Parsed with column specification:
    ## cols(
    ##   學校類型 = col_character(),
    ##   學校代碼 = col_character(),
    ##   學校名稱 = col_character(),
    ##   學位生_正式修讀學位外國生 = col_integer(),
    ##   `學位生_僑生(含港澳)` = col_integer(),
    ##   學位生_正式修讀學位陸生 = col_integer(),
    ##   非學位生_外國交換生 = col_integer(),
    ##   非學位生_外國短期研習及個人選讀 = col_integer(),
    ##   非學位生_大專附設華語文中心學生 = col_integer(),
    ##   非學位生_大陸研修生 = col_integer(),
    ##   非學位生_海青班 = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
c106 <- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=50e3370f9f8794f2054c0c82a2ed8c91")
```

    ## Parsed with column specification:
    ## cols(
    ##   洲別 = col_character(),
    ##   國別 = col_character(),
    ##   學位生_正式修讀學位外國生 = col_integer(),
    ##   `學位生_僑生(含港澳)` = col_integer(),
    ##   學位生_正式修讀學位陸生 = col_integer(),
    ##   非學位生_外國交換生 = col_integer(),
    ##   非學位生_外國短期研習及個人選讀 = col_integer(),
    ##   非學位生_大專附設華語文中心學生 = col_integer(),
    ##   非學位生_大陸研修生 = col_integer(),
    ##   非學位生_海青班 = col_integer(),
    ##   境外專班 = col_integer()
    ## )

``` r
s106<- read_csv("https://quality.data.gov.tw/dq_download_csv.php?nid=6289&md5_url=883e2ab4d5357f70bea9ac44a47d05cc")
```

    ## Parsed with column specification:
    ## cols(
    ##   學校類型 = col_character(),
    ##   學校代碼 = col_character(),
    ##   學校名稱 = col_character(),
    ##   學位生_正式修讀學位外國生 = col_integer(),
    ##   `學位生_僑生(含港澳)` = col_integer(),
    ##   學位生_正式修讀學位陸生 = col_integer(),
    ##   非學位生_外國交換生 = col_integer(),
    ##   非學位生_外國短期研習及個人選讀 = col_integer(),
    ##   非學位生_大專附設華語文中心學生 = col_integer(),
    ##   非學位生_大陸研修生 = col_integer(),
    ##   非學位生_海青班 = col_integer(),
    ##   境外專班 = col_integer()
    ## )

### 哪些國家來台灣唸書的學生最多呢？

``` r
#這是R Code Chunk
library(knitr)
kable(head(iris))
```

|  Sepal.Length|  Sepal.Width|  Petal.Length|  Petal.Width| Species |
|-------------:|------------:|-------------:|------------:|:--------|
|           5.1|          3.5|           1.4|          0.2| setosa  |
|           4.9|          3.0|           1.4|          0.2| setosa  |
|           4.7|          3.2|           1.3|          0.2| setosa  |
|           4.6|          3.1|           1.5|          0.2| setosa  |
|           5.0|          3.6|           1.4|          0.2| setosa  |
|           5.4|          3.9|           1.7|          0.4| setosa  |

``` r
#install.packages("knitr")
#install.packages("dplyr")
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(knitr)
c103<-data.frame(country=c103$國別,people103=c103$`學位生-正式修讀學位外國生`+c103$`學位生-僑生(含港澳)`+c103$`學位生-正式修讀學位陸生`+
                   c103$`非學位生-外國交換生`+c103$`非學位生-外國短期研習及個人選讀`+
                   c103$`非學位生-大專附設華語文中心學生`+c103$`非學位生-大陸研修生`+
                   c103$`非學位生-海青班`+c103$境外專班)

c104<-data.frame(country=c104$國別,people104=c104$`學位生-正式修讀學位外國生`+c104$`學位生-僑生(含港澳)`+c104$`學位生-正式修讀學位陸生`+
                   c104$`非學位生-外國交換生`+c104$`非學位生-外國短期研習及個人選讀`+
                   c104$`非學位生-大專附設華語文中心學生`+c104$`非學位生-大陸研修生`+
                   c104$`非學位生-海青班`+c104$境外專班)
c103104<-full_join(c103,c104,by="country")
```

    ## Warning: Column `country` joining factors with different levels, coercing
    ## to character vector

``` r
c105<-data.frame(country=c105$國別,people105=c105$`學位生_正式修讀學位外國生`+c105$`學位生_僑生(含港澳)`+c105$`學位生_正式修讀學位陸生`+
                   c105$`非學位生_外國交換生`+c105$`非學位生_外國短期研習及個人選讀`+
                   c105$`非學位生_大專附設華語文中心學生`+c105$`非學位生_大陸研修生`+
                   c105$`非學位生_海青班`+c105$境外專班)
c103104105<-full_join(c103104,c105,by="country")
```

    ## Warning: Column `country` joining character vector and factor, coercing
    ## into character vector

``` r
c106<-data.frame(country=c106$國別,people106=c106$`學位生_正式修讀學位外國生`+c106$`學位生_僑生(含港澳)`+c106$`學位生_正式修讀學位陸生`+
                   c106$`非學位生_外國交換生`+c106$`非學位生_外國短期研習及個人選讀`+
                   c106$`非學位生_大專附設華語文中心學生`+c106$`非學位生_大陸研修生`+
                   c106$`非學位生_海青班`+c106$境外專班)
c103104105106<-full_join(c103104105,c106,by="country")
```

    ## Warning: Column `country` joining character vector and factor, coercing
    ## into character vector

``` r
c103104105106[is.na(c103104105106)]=0
c103104105106$total<-c103104105106$people103+c103104105106$people104+c103104105106$people105+c103104105106$people106
c103104105106<-arrange(c103104105106,desc(c103104105106$total))
knitr::kable(c103104105106[1:10,c(1,6)])
```

| country  |   total|
|:---------|-------:|
| 中國大陸 |  152524|
| 馬來西亞 |   62031|
| 香港     |   31940|
| 日本     |   28200|
| 越南     |   21670|
| 澳門     |   20302|
| 印尼     |   19620|
| 南韓     |   16948|
| 美國     |   14846|
| 泰國     |    7035|

由上述資料分析結果，顯示出**中國大陸**來台灣唸書的學生最多，其次才是馬來西亞、香港、日本等等。其中，中國來台念書的人數為馬來西亞的2.46倍之多。另外，前十名內僅有**美國**為非亞洲國家，其餘皆為亞洲國家。

------------------------------------------------------------------------

### 哪間大學的境外生最多呢？

``` r
#這是R Code Chunk
s103$`非學位生-大陸研修生`<-as.numeric(gsub("…","0",s103$`非學位生-大陸研修生`))
s103<-data.frame(school=s103$學校名稱,people103=s103$`學位生-正式修讀學位外國生`+s103$`學位生-僑生(含港澳)`+s103$`學位生-正式修讀學位陸生`+
                   s103$`非學位生-外國交換生`+s103$`非學位生-外國短期研習及個人選讀`+s103$`非學位生-大專附設華語文中心學生`+
                   s103$`非學位生-大陸研修生`+s103$`非學位生-海青班`+s103$境外專班)

s104$`非學位生-大陸研修生`<-as.numeric(gsub("…","0",s104$`非學位生-大陸研修生`))
s104<-data.frame(school=s104$學校名稱,people104=s104$`學位生-正式修讀學位外國生`+s104$`學位生-僑生(含港澳)`+s104$`學位生-正式修讀學位陸生`+
                   s104$`非學位生-外國交換生`+s104$`非學位生-外國短期研習及個人選讀`+s104$`非學位生-大專附設華語文中心學生`+
                   s104$`非學位生-大陸研修生`+s104$`非學位生-海青班`+s104$境外專班)
s103104<-full_join(s103,s104,by="school")
```

    ## Warning: Column `school` joining factors with different levels, coercing to
    ## character vector

``` r
s105$`非學位生_大陸研修生`<-as.numeric(gsub("…","0",s105$`非學位生_大陸研修生`))
s105<-data.frame(school=s105$學校名稱,people105=s105$`學位生_正式修讀學位外國生`+s105$`學位生_僑生(含港澳)`+s105$`學位生_正式修讀學位陸生`+
                   s105$`非學位生_外國交換生`+s105$`非學位生_外國短期研習及個人選讀`+s105$`非學位生_大專附設華語文中心學生`+
                   s105$`非學位生_大陸研修生`+s105$`非學位生_海青班`+s105$境外專班)
s103104105<-full_join(s103104,s105,by="school")
```

    ## Warning: Column `school` joining character vector and factor, coercing into
    ## character vector

``` r
s106$`非學位生_大陸研修生`<-as.numeric(gsub("…","0",s106$`非學位生_大陸研修生`))
s106<-data.frame(school=s106$學校名稱,people106=s106$`學位生_正式修讀學位外國生`+s106$`學位生_僑生(含港澳)`+s106$`學位生_正式修讀學位陸生`+
                   s106$`非學位生_外國交換生`+s106$`非學位生_外國短期研習及個人選讀`+s106$`非學位生_大專附設華語文中心學生`+
                   s106$`非學位生_大陸研修生`+s106$`非學位生_海青班`+s106$境外專班)
s103104105106<-full_join(s103104105,s106,by="school")
```

    ## Warning: Column `school` joining character vector and factor, coercing into
    ## character vector

``` r
s103104105106[is.na(s103104105106)]=0
s103104105106$total<-s103104105106$people103+s103104105106$people104+s103104105106$people105+s103104105106$people106
s103104105106<-arrange(s103104105106,desc(s103104105106$total))
knitr::kable(s103104105106[1:10,c(1,6)])
```

| school           |  total|
|:-----------------|------:|
| 無法區分校別     |  92586|
| 國立臺灣師範大學 |  22113|
| 國立臺灣大學     |  18199|
| 中國文化大學     |  16074|
| 銘傳大學         |  16057|
| 淡江大學         |  13887|
| 國立政治大學     |  11626|
| 國立成功大學     |  10982|
| 輔仁大學         |   9499|
| 逢甲大學         |   9474|

由上述資料分析結果，顯示出**臺灣師範大學**為大學的境外生最多的學校。其次才是國立臺灣大學、中國文化大學、銘傳大學等等。出乎意料地，大學的境外生在臺灣師範大學竟然超出國立臺灣大學將近四千人。雖然資料顯示出境外生人數的多寡，然而卻無從得知境外生所佔學校人數的比例。因此，若得知更多相關資料便能再更進一步的分析。

------------------------------------------------------------------------

### 各個國家來台灣唸書的學生人數條狀圖

``` r
#這是R Code Chunk
#install.packages("ggplot2")
library(ggplot2)
ggplot()+geom_bar(data=c103104105106,
                  aes(x=country,y=total),
                  stat = "identity") +labs(x="國家",y="人數")+theme(axis.text.x = element_text(angle = 90, hjust = 0.001))
```

![](InternationalStudents_files/figure-markdown_github/ToTWNCountryBar-1.png)

``` r
groupCountry1<-c103104105106%>%
  group_by(country)%>%
  tally(total,sort=TRUE)%>%
  group_by(country = factor(c(country[1:10], rep("Other", n() - 10)),
                            levels = c(country[1:10], "Other")))%>%
  tally(n)
colnames(groupCountry1)<-c("country","total")
ggplot()+geom_bar(data=groupCountry1,
                  aes(x=country,y=total),
                  stat = "identity",
                  fill = "darkblue")
```

![](InternationalStudents_files/figure-markdown_github/ToTWNCountryBar-2.png)

------------------------------------------------------------------------

### 各個國家來台灣唸書的學生人數面量圖

``` r
#這是R Code Chunk
#install.packages("choroplethr")
#install.packages("readr")
library(choroplethr)
```

    ## Loading required package: acs

    ## Loading required package: stringr

    ## Loading required package: XML

    ## 
    ## Attaching package: 'acs'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     combine

    ## The following object is masked from 'package:base':
    ## 
    ##     apply

``` r
library(readr)
Countriesname <- read_csv("C:/Users/IM/Desktop/CountriesComparisionTable.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   ISO3 = col_character(),
    ##   English = col_character(),
    ##   Taiwan = col_character()
    ## )

``` r
colnames(Countriesname)<-c("ISO3","English","country")
TotalCountry<-merge(c103104105106[,c(1,6)],Countriesname,by="country")
colnames(TotalCountry)<-c("country","value","ISO3","region")
TotalCountry[5,2]<-TotalCountry[5,2]+TotalCountry[91,2]+TotalCountry[159,2]
TotalCountry[107,2]<-TotalCountry[107,2]+TotalCountry[108,2]
TotalCountry<-TotalCountry%>%
    subset(region!="Unmatch")%>%
    subset(country!="索馬利蘭共和國")
map1<-country_choropleth(TotalCountry)
```

    ## Warning in super$initialize(country.map, user.df): Your data.frame contains
    ## the following regions which are not mappable: Singapore

    ## Warning in self$bind(): The following regions were missing and are being
    ## set to NA: afghanistan, angola, montenegro, qatar, western sahara, south
    ## sudan, somaliland, east timor, taiwan, vanuatu, central african republic,
    ## northern cyprus, djibouti, eritrea, antarctica, equatorial guinea, kosovo,
    ## lesotho

``` r
map1
```

![](InternationalStudents_files/figure-markdown_github/ToTWNCountryMap-1.png)
-----------------------------------------------------------------------------

台灣學生國際交流分析
--------------------

### 資料匯入與處理

``` r
#這是R Code Chunk
#install.packages("readr")
library(readr)
Student_RPT_07 <- read_csv("C:/Users/IM/Desktop/Student_RPT_07.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   學年度 = col_integer(),
    ##   學期 = col_integer(),
    ##   設立別 = col_character(),
    ##   學校類別 = col_character(),
    ##   學校代碼 = col_character(),
    ##   學校名稱 = col_character(),
    ##   系所代碼 = col_integer(),
    ##   系所名稱 = col_character(),
    ##   學制 = col_character(),
    ##   `對方學校(機構)國別(地區)` = col_character(),
    ##   `對方學校(機構)中文名稱` = col_character(),
    ##   `對方學校(機構)英文名稱` = col_character(),
    ##   小計 = col_integer(),
    ##   男 = col_integer(),
    ##   女 = col_integer()
    ## )

    ## Warning: 2 parsing failures.
    ## row # A tibble: 2 x 5 col     row col      expected               actual file                        expected   <int> <chr>    <chr>                  <chr>  <chr>                       actual 1 23579 系所代碼 no trailing characters A2     'C:/Users/IM/Desktop/Stude~ file 2 34284 系所代碼 no trailing characters A2     'C:/Users/IM/Desktop/Stude~

### 台灣大專院校的學生最喜歡去哪些國家進修交流呢？

``` r
#這是R Code Chunk
library(dplyr)
data1<-subset(Student_RPT_07,`學年度`>102)%>%
  group_by(`對方學校(機構)國別(地區)`)%>%
  summarise(nCountry=sum(小計))
data2<-arrange(data1,desc(nCountry))
knitr::kable(data2[1:10,])
```

| 對方學校(機構)國別(地區) |  nCountry|
|:-------------------------|---------:|
| 中國大陸                 |      8375|
| 日本                     |      7142|
| 美國                     |      4427|
| 南韓                     |      2050|
| 大陸地區                 |      1516|
| 德國                     |      1466|
| 法國                     |      1258|
| 英國                     |       742|
| 加拿大                   |       689|
| 西班牙                   |       642|

由上述資料分析結果，顯示出**中國大陸**為台灣大專院校的學生最喜歡去進修交流的國家。其次才是日本、美國、南韓等等。由此可見，台灣大專院校的學生並非僅以較近的亞洲國家(金錢)，作為進修交流的考量。

------------------------------------------------------------------------

### 哪間大學的出國交流學生數最多呢？

``` r
#這是R Code Chunk
data3<-subset(Student_RPT_07,`學年度`>102)%>%
  group_by(`學校名稱`)%>%
  summarise(nSchool=sum(小計))
data4<-arrange(data3,desc(nSchool))
knitr::kable(data4[1:10,])
```

| 學校名稱     |  nSchool|
|:-------------|--------:|
| 國立臺灣大學 |     2224|
| 淡江大學     |     2038|
| 國立政治大學 |     1876|
| 逢甲大學     |     1346|
| 元智大學     |     1106|
| 國立臺北大學 |      956|
| 國立交通大學 |      951|
| 東海大學     |      931|
| 東吳大學     |      873|
| 國立成功大學 |      846|

由上述資料分析結果，顯示出**國立臺灣大學**的出國交流學生數，在台灣眾多學校中遙遙令先暫居第一。其次才是淡江大學、國立政治大學、逢甲大學等等。然而，由前十名中顯示，台灣學校出國交流學生數的排名為私立學校換國立學校各佔一半，因此並非國立大學才是決定出國交流的第一選擇。

------------------------------------------------------------------------

### 台灣大專院校的學生最喜歡去哪些國家進修交流條狀圖

``` r
#這是R Code Chunk
#install.packages("ggplot2")
library(ggplot2)
ggplot()+geom_bar(data=data1,
                  aes(x=`對方學校(機構)國別(地區)`,y=nCountry),
                  stat = "identity") +labs(x="國家",y="人數")+theme(axis.text.x = element_text(angle = 90, hjust = 0.001))
```

![](InternationalStudents_files/figure-markdown_github/FromTWNCountryBar-1.png)

``` r
groupCountry2<-data1%>%
    group_by(`對方學校(機構)國別(地區)`)%>%
    tally(nCountry,sort=TRUE)%>%
    group_by(`對方學校(機構)國別(地區)` = factor(c(`對方學校(機構)國別(地區)`[1:10], rep("Other", n() - 10)),
                                          levels = c(`對方學校(機構)國別(地區)`[1:10], "Other")))%>%
    tally(n)
colnames(groupCountry2)<-c("對方學校(機構)國別(地區)","nCountry")
ggplot()+geom_bar(data=groupCountry2,
                  aes(x=`對方學校(機構)國別(地區)`,y=nCountry),
                  stat = "identity",
                  fill = "darkblue")
```

![](InternationalStudents_files/figure-markdown_github/FromTWNCountryBar-2.png)
-------------------------------------------------------------------------------

### 台灣大專院校的學生最喜歡去哪些國家進修交流面量圖

``` r
#這是R Code Chunk
#install.packages("choroplethr")
#install.packages("readr")
library(choroplethr)
library(readr)
countryname <- read_csv("C:/Users/IM/Desktop/CountriesComparisionTable.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   ISO3 = col_character(),
    ##   English = col_character(),
    ##   Taiwan = col_character()
    ## )

``` r
colnames(countryname)<-c("ISO3","English","中文")
count1<-data1
colnames(count1)<-c("國名","count")
count2<-merge(count1,countryname,by.x="國名",by.y="中文")
colnames(count2)<-c("國名","value","ISO3","region")
count2<-count2%>%
  subset(region!="Unmatch")
map2<-country_choropleth(count2,num_colors=9)
```

    ## Warning in super$initialize(country.map, user.df): Your data.frame contains
    ## the following regions which are not mappable: Singapore

    ## Warning in self$bind(): The following regions were missing and are being
    ## set to NA: afghanistan, angola, azerbaijan, moldova, madagascar, macedonia,
    ## mali, myanmar, montenegro, mozambique, mauritania, burundi, namibia,
    ## nigeria, nicaragua, pakistan, papua new guinea, benin, paraguay, rwanda,
    ## western sahara, sudan, burkina faso, south sudan, senegal, sierra leone,
    ## el salvador, somaliland, somalia, suriname, syria, chad, togo, tajikistan,
    ## turkmenistan, east timor, bulgaria, trinidad and tobago, taiwan, united
    ## republic of tanzania, uganda, ukraine, uruguay, uzbekistan, the bahamas,
    ## venezuela, vanuatu, yemen, zambia, zimbabwe, bosnia and herzegovina,
    ## belarus, albania, belize, bolivia, bhutan, botswana, central african
    ## republic, united arab emirates, ivory coast, cameroon, democratic republic
    ## of the congo, republic of congo, cuba, northern cyprus, cyprus, argentina,
    ## djibouti, dominican republic, algeria, eritrea, armenia, ethiopia,
    ## fiji, gabon, georgia, ghana, antarctica, guinea, gambia, guinea bissau,
    ## equatorial guinea, guatemala, guyana, honduras, haiti, iran, iraq, jamaica,
    ## kazakhstan, kenya, kyrgyzstan, kosovo, laos, lebanon, liberia, libya,
    ## lesotho, luxembourg

``` r
map2
```

![](InternationalStudents_files/figure-markdown_github/FromTWNCountryMap-1.png)
-------------------------------------------------------------------------------

台灣學生出國留學分析
--------------------

### 資料匯入與處理

``` r
#這是R Code Chunk
#install.packages("readr")
library(readr)
data105 <- read_csv("C:/Users/IM/Desktop/m105.csv")
```

    ## Warning: Missing column names filled in: 'X4' [4], 'X5' [5], 'X6' [6]

    ## Parsed with column specification:
    ## cols(
    ##   洲別 = col_character(),
    ##   國別 = col_character(),
    ##   總人數 = col_number(),
    ##   X4 = col_character(),
    ##   X5 = col_character(),
    ##   X6 = col_character()
    ## )

------------------------------------------------------------------------

### 台灣學生最喜歡去哪些國家留學呢？

``` r
#這是R Code Chunk
#install.packages("dplyr")
library(dplyr)
data105$X4=NULL
data105$X5=NULL
data105$X6=NULL
data105[is.na(data105)]=0
data105<-arrange(data105,desc(data105$總人數))
knitr::kable(data105[1:10,])
```

| 洲別   | 國別     | 總人數 |
|:-------|:---------|:------:|
| 美洲   | 美國     |  21127 |
| 大洋洲 | 澳大利亞 |  13582 |
| 亞洲   | 日本     |  8444  |
| 美洲   | 加拿大   |  4827  |
| 歐洲   | 英國     |  3815  |
| 歐洲   | 德國     |  1488  |
| 大洋洲 | 紐西蘭   |  1106  |
| 歐洲   | 波蘭     |   561  |
| 亞洲   | 馬來西亞 |   502  |
| 歐洲   | 奧地利   |   419  |

由上述資料分析結果，顯示出**美國**為台灣最為受歡迎的留學國家，其次才是澳大利亞、日本、加拿大等等。其中，美國留學的人數遠超過澳大利亞7545人。其中，唯一擠進前三名的亞洲國家為**日本**。

------------------------------------------------------------------------

### 台灣學生最喜歡去哪些國家留學面量圖

``` r
#這是R Code Chunk
#install.packages("readr")
#install.packages("choroplethr")
library(readr)
library(choroplethr)
countryname <- read_csv("C:/Users/IM/Desktop/CountriesComparisionTable.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   ISO3 = col_character(),
    ##   English = col_character(),
    ##   Taiwan = col_character()
    ## )

``` r
colnames(countryname)<-c("ISO3","English","國別")
m105countryname<-merge(data105,countryname,by="國別")
colnames(m105countryname)<-c("國名","洲別","value","ISO3","region")
map3<-country_choropleth(m105countryname)
```

    ## Warning in super$initialize(country.map, user.df): Your data.frame contains
    ## the following regions which are not mappable: Singapore

    ## Warning in self$bind(): The following regions were missing and are being
    ## set to NA: afghanistan, angola, azerbaijan, moldova, madagascar, mexico,
    ## macedonia, mali, myanmar, montenegro, mongolia, mozambique, mauritania,
    ## burundi, malawi, namibia, france, niger, nigeria, nicaragua, oman,
    ## pakistan, panama, peru, papua new guinea, north korea, benin, portugal,
    ## paraguay, israel, qatar, romania, rwanda, western sahara, saudi arabia,
    ## sudan, burkina faso, south sudan, senegal, solomon islands, sierra leone,
    ## el salvador, somaliland, somalia, republic of serbia, suriname, slovakia,
    ## slovenia, swaziland, syria, chad, togo, tajikistan, turkmenistan, east
    ## timor, bulgaria, trinidad and tobago, tunisia, turkey, taiwan, united
    ## republic of tanzania, uganda, ukraine, uruguay, uzbekistan, the bahamas,
    ## venezuela, vanuatu, yemen, south africa, zambia, zimbabwe, bosnia and
    ## herzegovina, belarus, albania, belize, bolivia, brazil, bhutan, botswana,
    ## central african republic, switzerland, chile, united arab emirates, china,
    ## ivory coast, cameroon, democratic republic of the congo, republic of
    ## congo, colombia, costa rica, cuba, northern cyprus, cyprus, argentina,
    ## czech republic, djibouti, dominican republic, algeria, ecuador, egypt,
    ## eritrea, spain, armenia, estonia, ethiopia, fiji, gabon, georgia, ghana,
    ## antarctica, guinea, gambia, guinea bissau, equatorial guinea, greece,
    ## guatemala, guyana, honduras, croatia, haiti, hungary, ireland, iran, iraq,
    ## italy, jamaica, jordan, kazakhstan, kenya, kyrgyzstan, cambodia, south
    ## korea, kosovo, kuwait, laos, lebanon, liberia, libya, lesotho, lithuania,
    ## luxembourg, latvia, morocco

``` r
map3
```

![](InternationalStudents_files/figure-markdown_github/FromTWNAbMap-1.png)

綜合分析
--------

請問來台讀書與離台讀書的來源國與留學國趨勢是否相同(5分)？想來台灣唸書的境外生，他們的母國也有很多台籍生嗎？請圖文並茂說明你的觀察(10分)。

------------------------------------------------------------------------

根據上述所有資料進行分析比對之後，來台讀書的來源國為中國大陸、馬來西亞、香港、日本等等，而離台讀書的留學國為美國、澳大利亞、日本、加拿大等等。顯示出**美國**及**日本**無論是來台讀書或是出國留學，都為十分受歡迎的選擇。另外，想來台灣唸書的境外生排名依序為中國大陸、日本、美國、南韓……。其中，**日本**及**美國**國內也有相當多的台籍生。
