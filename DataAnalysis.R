library(jsonlite)
library(dplyr)
library(httr)
library(readr)
library(RCurl)
library(curl)
library(bitops)
library(readxl)

X103_ab103_C <- read_csv("C:/Users/IM/Desktop/R/103_ab103_C.csv")
X103_ab103_S <- read_csv("C:/Users/IM/Desktop/R/103_ab103_S.csv")
X104_ab104_C <- read_csv("C:/Users/IM/Desktop/R/104_ab104_C.csv")
X104_ab104_S <- read_csv("C:/Users/IM/Desktop/R/104_ab104_S.csv")
X105_ab105_C <- read_csv("C:/Users/IM/Desktop/R/105_ab105_C.csv")
X105_ab105_S <- read_csv("C:/Users/IM/Desktop/R/105_ab105_S.csv")
X106_ab105_C <- read_csv("C:/Users/IM/Desktop/R/106_ab105_C.csv")
X106_ab105_S <- read_csv("C:/Users/IM/Desktop/R/106_ab105_S.csv")
English <- read_excel("C:/Users/IM/Desktop/English.xlsx")
Student_RPT_07 <- read_excel("C:/Users/IM/Desktop/Student_RPT_07.xlsx")

New103104<-inner_join(X103_ab103_C,X104_ab104_C,by="國別")
New105106<-inner_join(X105_ab105_C,X106_ab105_C,by="國別")
New103104105106<-inner_join(New103104,New105106,by="國別")

New103104105106$境外專班.y.y<-as.numeric(gsub("—","0",New103104105106$境外專班.y.y))
New103104105106$境外專班.x.y<-as.numeric(gsub("—","0",New103104105106$境外專班.x.y))
New103104105106$境外專班.y.y<-as.numeric(gsub("—","0",New103104105106$境外專班.y.y))
New103104105106$境外專班.y.y<-as.numeric(gsub("—","0",New103104105106$境外專班.y.x))
New103104105106$境外專班加總1<-New103104105106$境外專班.y.y+New103104105106$境外專班.y.x
New103104105106$境外專班加總2<-New103104105106$境外專班.x.y+New103104105106$境外專班.x.x
New103104105106$境外專班加總<-New103104105106$境外專班加總1+New103104105106$境外專班加總2
New103104105106<-arrange(New103104105106,desc(境外專班加總))
New103104105106[1:10,]


New103104S<-inner_join(X103_ab103_S,X104_ab104_S,by="學校名稱")
New105106S<-inner_join(X105_ab105_S,X106_ab105_S,by="學校名稱")
New103104105106S<-inner_join(New103104S,New105106S,by="學校名稱")

New103104105106S$境外專班.y.y<-as.numeric(gsub("—","0",New103104105106S$境外專班.y.y))
New103104105106S$境外專班.x.y<-as.numeric(gsub("—","0",New103104105106S$境外專班.x.y))
New103104105106S$境外專班.y.y<-as.numeric(gsub("—","0",New103104105106S$境外專班.y.y))
New103104105106S$境外專班.y.y<-as.numeric(gsub("—","0",New103104105106S$境外專班.y.x))
New103104105106S$境外專班加總1<-New103104105106S$境外專班.y.y+New103104105106S$境外專班.y.x
New103104105106S$境外專班加總2<-New103104105106S$境外專班.x.y+New103104105106S$境外專班.x.x
New103104105106S$境外專班加總<-New103104105106S$境外專班加總1+New103104105106S$境外專班加總2
New103104105106S<-arrange(New103104105106S,desc(境外專班加總))
New103104105106S[1:10,]


library(ggplot2) 
library(datasets) 
library(data.table)

#ggplot(New103104105106, 
#aes(x = 國別, y = 境外專班加總)) + 
#geom_point()+
#geom_smooth(method = lm)

ggplot()+geom_bar(data=New103104105106,aes(x=國別,y=境外專班加總),
                  stat = "identity")
#install.packages(c("choroplethr","choroplethrMaps"))

li
library(ggmap)
library(ggplot2) 


library(dplyr)
filter1<-filter(Student_RPT_07,學年度>103)
View(filter1)

Student_RPT_07$X__7<-as.numeric(gsub("—","0",Student_RPT_07$X__7))


group1<-group_by(filter1$`對方學校(機構)國別(地區)`)

group1<-summarise(group1,sum=sum(X__7))
group1<-arrange(group1,desc(sum))
View(group1)
View(group1[1:10,])













English$`Head Count`<-as.numeric(English$`Head Count`)
English<-arrange(English,desc(`Head Count`))
English[1:10,]
















