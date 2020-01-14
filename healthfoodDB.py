import requests #특정 URL에 접속하는 요청 전용 객체
import pymysql
from bs4 import BeautifulSoup

conn=pymysql.connect(host='localhost',user='jspuser',passwd='jsppass',db='jspdb',charset='utf8')

try:
    with conn.cursor() as cursor:
        sql=  """create table pill(
                name varchar(100) not null,
                information varchar(1000)
                ); """
        cursor.execute(sql)
    conn.commit()
finally:
    print()

link=''# link
req=requests.get(link) #특정한 웹페이지에 get방식으로 접속

html=req.text #html이라는 변수에다가 request객체의 text값을 가져온다.


#html 소스코드를 파이썬 객체로 변환합니다.
soup=BeautifulSoup(html,'html.parser') #beauifulSoup 로 파싱한다.
a=soup.select('item>')#파싱할 태그 입력
b=soup.select('item>')

string_list=[]
string_arr=[]

#a라는 변수를 하나씩 탐색할 수 있도록
for row in a:
    product = row.text
    string_list.append(product)
for col in b:
    health = col.text
    string_arr.append((health))

# 모든 링크에 하나씩 접근
for i in range (0,len(string_list)):
    for j in range (0,len(string_arr)):
        if i == j:
            try:
                with conn.cursor() as cursor:
                    sql2="insert into pill(name,information) values(%s,%s)"
                    cursor.execute(sql2,(string_list[i],string_arr[j]))
                conn.commit()
            finally:
                print()

conn.close()