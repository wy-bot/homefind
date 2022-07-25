# -*- coding: utf-8 -*-

import json
import math
import pymysql
import requests
# import xlrd
import threading
import psycopg2

import re

       # 这个函数用来判断表是否存在




    




def geocodeGWr2(address):
    par = {'address': address,'output': 'json','ak': 'xzeRvWnIbK0ORXbR0TeI8ltOgSRMRXsP','city': '苏州市'}
    base = 'http://api.map.baidu.com/geocoding/v3/'
    response = requests.get(base, par)
    answer = response.json()
    
    if(answer['status'] == 0):
        return answer['result']['location']['lng'],answer['result']['location']['lat']
    else:
        return '0, 0'

def BD2WGS(lon,lat):
       # a = 6378245.0 # 克拉索夫斯基椭球参数长半轴a
       a= 6378137.0
       ee = 0.00669342162296594323 #克拉索夫斯基椭球参数第一偏心率平方
       # PI = 3.14159265358979324 # 圆周率
       PI =  3.1415926535897932384626
       # 以下为转换公式
       x = lon - 0.0065
       y = lat - 0.006
       z = math.sqrt(x * x + y * y) - 0.00002 * math.sin(y * PI * 3000.0 / 180.0)
       theta = math.atan2(y, x) - 0.000003 * math.cos(x * PI * 3000.0 / 180.0)
       wgslng = z * math.cos(theta)
       wgslat = z * math.sin(theta)
       return GCJ2WGS(wgslng,wgslat)

def GCJ2WGS(lon,lat):
       # a = 6378245.0 # 克拉索夫斯基椭球参数长半轴a
       a= 6378137.0
       ee = 0.00669342162296594323 #克拉索夫斯基椭球参数第一偏心率平方
       # PI = 3.14159265358979324 # 圆周率
       PI =  3.1415926535897932384626
       # 以下为转换公式
       x = lon - 105.0
       y = lat - 35.0
       # 经度
       dLon = 300.0 + x + 2.0 * y + 0.1 * x * x + 0.1 * x * y + 0.1 * math.sqrt(abs(x))
       dLon += (20.0 * math.sin(6.0 * x * PI) + 20.0 * math.sin(2.0 * x * PI)) * 2.0 / 3.0
       dLon += (20.0 * math.sin(x * PI) + 40.0 * math.sin(x / 3.0 * PI)) * 2.0 / 3.0
       dLon += (150.0 * math.sin(x / 12.0 * PI) + 300.0 * math.sin(x / 30.0 * PI)) * 2.0 / 3.0
       # 纬度
       dLat = -100.0 + 2.0 * x + 3.0 * y + 0.2 * y * y + 0.1 * x * y + 0.2 * math.sqrt(abs(x))
       dLat += (20.0 * math.sin(6.0 * x * PI) + 20.0 * math.sin(2.0 * x * PI)) * 2.0 / 3.0
       dLat += (20.0 * math.sin(y * PI) + 40.0 * math.sin(y / 3.0 * PI)) * 2.0 / 3.0
       dLat += (160.0 * math.sin(y / 12.0 * PI) + 320 * math.sin(y * PI / 30.0)) * 2.0 / 3.0
       radLat = lat / 180.0 * PI
       magic = math.sin(radLat)
       magic = 1 - ee * magic * magic
       sqrtMagic = math.sqrt(magic)
       dLat = (dLat * 180.0) / ((a * (1 - ee)) / (magic * sqrtMagic) * PI)
       dLon = (dLon * 180.0) / (a / sqrtMagic * math.cos(radLat) * PI)
       wgsLon = lon - dLon
       wgsLat = lat - dLat
       return [wgsLon,wgsLat] # 将名称坐标封装进列表等待后面写入
# for a in range(len(address_all)): 
#       address1 = address_all[a]
    
    
#       fullxy = geocodeGWr2(address1)
#       fullxy1 = fullxy.__str__()
#       fullxy1 = fullxy1.replace('(','').replace(')','')
#       X = fullxy1.split(", ",1)[0]
#       Y = fullxy1.split(", ",1)[1]
            
#       WGSXY = BD2WGS(float(X),float(Y))
        
    
#       WGSX = WGSXY[0]
#       WGSY = WGSXY[1]
#       resultall = []
#       resultall.append(result[a])
#       resultall.append(id[a])
#       resultall.append(WGSX)
#       resultall.append(WGSY)
#       print(resultall)
    
      
     

#连接数据库
conn = psycopg2.connect(database="home", user="postgres", password="1202", host="localhost", port="5432")
# 打开一个操作整个数据库的光标
cursor = conn.cursor()
#运行sql语句




path = "https://raw.githubusercontent.com/WeNeedHome/SummaryOfLoanSuspension/main/data/generated/properties-flat.json"

page = requests.get(path)
page = page.content
#将bytes转换成字符串
page = page.decode('utf-8')

json_all = json.loads(page)
for a in range(len(json_all)):
    address = json_all[a]
    address_all = address['province']+address['city']+address['name']
    fullxy = geocodeGWr2(address_all)
    fullxy1 = fullxy.__str__()
    fullxy1 = fullxy1.replace('(','').replace(')','')
    X = fullxy1.split(", ",1)[0]
    Y = fullxy1.split(", ",1)[1]    
    WGSXY = BD2WGS(float(X),float(Y))
    WGSX = WGSXY[0]
    WGSY = WGSXY[1]
    resultall = []
    resultall.append(address_all)
    resultall.append(str(WGSX))
    resultall.append(str(WGSY))
    resultall.append(address['province'])
    resultall.append(address['city'])
    resultall.append(address['name'])
    resultall.append(address['uri'])
    sql = "INSERT INTO data_point_region SELECT s.province,s.city,s.name,s.uri,s.lng,s.lat,p.region_name,p.region_code from (SELECT geom,name as region_name,adcode as region_code FROM region_all_4326) p, (select st_geometryfromtext('POINT(" + str(resultall[1]) + " " + str(resultall[2]) + ")',4326) as xy,'" + resultall[3] + "' as province,'" + resultall[4] + "' as city,'" + resultall[5] + "' as name,'" + resultall[6] + "' as uri,'" + resultall[1] + "' as lng,'" + resultall[2] + "' as lat" + ") s where ST_Within(s.xy,p.geom)"
    cursor.execute(sql)
    # data1 = cursor.fetchall()
    conn.commit()
    

    # all = '"pos": {"lng": ' +  str(WGSX) + ',"lat": ' + str(WGSY) + '}'
    # all_2 = '"region": "' +  str(data1) + '"'

    
    



# def threading_update(biao):
#   threads = []
#   for i in range(21):
    
#     t = threading.Thread(target=scwgt_exist_new,args=(biao,i,))
    
#     threads.append(t)
#   for i in threads:
#         # 启动线程
#         i.start()
#   for i in threads:
#         i.join()
  








# if __name__ == '__main__':
#     update(table1)
#     # 使用threading模块，threading.Thread()创建线程，其中target参数值为需要调用的方法，同样将其他多个线程放在一个列表中，遍历这个列表就能同时执行里面的函数了
#     # threads = [threading.Thread(target=scwgt_exist_new,args=(table1,0,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,1,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,2,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,3,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,4,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,5,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,6,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,7,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,8,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,9,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,10,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,11,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,12,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,13,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,14,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,15,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,16,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,17,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,18,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,19,)),
#     #            threading.Thread(target=scwgt_exist_new,args=(table1,20,))]
#     # for t in threads:
#     #     # 启动线程
#     #     t.start()
#     update_check(table1)
#     while(count_check_len > 0):
#       threading_update(table1)
#       update_check(table1)

   