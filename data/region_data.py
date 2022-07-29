from fastapi import FastAPI
import psycopg2
from pydantic import BaseModel
import uvicorn as uvicorn
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

class Item(BaseModel):
  region_code: list

app.add_middleware(
	CORSMiddleware,
	# 允许跨域的源列表，例如 ["http://www.example.org"] 等等，["*"] 表示允许任何源
	allow_origins=["*"],
	# 跨域请求是否支持 cookie，默认是 False，如果为 True，allow_origins 必须为具体的源，不可以是 ["*"]
	allow_credentials=False,
	# 允许跨域请求的 HTTP 方法列表，默认是 ["GET"]
	allow_methods=["*"],
	# 允许跨域请求的 HTTP 请求头列表，默认是 []，可以使用 ["*"] 表示允许所有的请求头
	# 当然 Accept、Accept-Language、Content-Language 以及 Content-Type 总之被允许的
	allow_headers=["*"],
	# 可以被浏览器访问的响应头, 默认是 []，一般很少指定
	# expose_headers=["*"]
	# 设定浏览器缓存 CORS 响应的最长时间，单位是秒。默认为 600，一般也很少指定
	# max_age=1000
)

@app.post('/')
async def check():
    conn = psycopg2.connect(database="home", user="postgres", password="1202", host="localhost", port="5432")
    cursor = conn.cursor()
    sql = "select region_code from data_point_region group by region_code"
    cursor.execute(sql)
    region_code = cursor.fetchall()
    cursor.close()
    conn.close()
    return region_code

@app.post('/login/')
async def login(item:Item):
    check_region_code = item.region_code
    if len(check_region_code) == 1:
        return {'status':200,'data': region_info_single(check_region_code[0])}
    else:
        
        return {'status':300,'data': region_info(tuple(check_region_code))}

@app.post('/info/')
async def info():
    conn = psycopg2.connect(database="home", user="postgres", password="1202", host="localhost", port="5432")
    cursor = conn.cursor()
    sql = "select * from data_point_region"
    cursor.execute(sql)
    region_all = cursor.fetchall()
    cursor.close()
    conn.close()
    return {'status':200,'data':region_all}

@app.post('/infocount/')
async def infocount():
    conn = psycopg2.connect(database="home", user="postgres", password="1202", host="localhost", port="5432")
    cursor = conn.cursor()
    sql = "select region_code,count(*) as count from data_point_region group by region_code"
    cursor.execute(sql)
    region_all = cursor.fetchall()
    cursor.close()
    conn.close()
    return {'status':200,'data':region_all}

def region_info(region_code):
    conn = psycopg2.connect(database="home", user="postgres", password="1202", host="localhost", port="5432")
    cursor = conn.cursor()
    sql = "select * from data_point_region where region_code in " + str(region_code)

    cursor.execute(sql)
    region_all = cursor.fetchall()
    cursor.close()
    conn.close()
    return region_all


def region_info_single(region_code):
    conn = psycopg2.connect(database="home", user="postgres", password="1202", host="localhost", port="5432")
    cursor = conn.cursor()
    sql = "select * from data_point_region where region_code in " + "('" + str(region_code) + "')"
    
    cursor.execute(sql)
    region_all = cursor.fetchall()
    cursor.close()
    conn.close()
    return region_all


if __name__ == '__main__':
  uvicorn.run("__main__:app",host='192.168.31.6',port=7777,reload=True,debug=True,workers=2)