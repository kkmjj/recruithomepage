import pymysql
from selenium import webdriver
from bs4 import BeautifulSoup

path = "C:/Users/민준/Desktop/chromedriver.exe"  # ex. C:/downloads/chromedriver.exe
# 조금만 기다리면 selenium으로 제어할 수 있는 브라우저 새창이 뜬다
driver = webdriver.Chrome(path)
driver.get("https://jasoseol.com/recruit")

db = pymysql.connect("localhost","root","root","recruit")
cursor = db.cursor();



sql = """insert into month(date,company)
         values (%s, %s)"""


req = driver.page_source
soup=BeautifulSoup(req, 'html.parser')
information_list = soup.find('div',attrs={'class':'employment-mode'})

information = information_list.select('.calendar-week')



#for information in information_list:
for week in information:
 if week is not None: # day 안에 주마나 하나씩 들어감
  result =week.select('.calendar-cell')
  for i in result:  #한주씩 i 에 담김
    date=i.select_one('.day-label').text
    print(date)     # 날짜 : date에 저장
    company=i.select('.day-content >.calendar-item >.company>.company-name >span')
    for j in company:
     if j is not None:
      print(j.text)
      cursor.execute(sql,(date,j.text))



db.commit()
db.close()

driver.close()