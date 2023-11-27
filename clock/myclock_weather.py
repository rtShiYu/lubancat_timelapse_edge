import datetime
import time
import requests
from gtts import gTTS
from bs4 import BeautifulSoup
import os

def play_audio(text):
    tts = gTTS(text=text, lang='zh-cn')
    tts.save('report_clock_weather.mp3')
    os.system('mpv report_clock_weather.mp3')

def get_weather():
    url = "http://www.weather.com.cn/weather/101010100.shtml"  # 替换为您所在城市的URL 北京
    response = requests.get(url)
    response.encoding = "utf-8"
    soup = BeautifulSoup(response.text, "html.parser")

    # 解析天气信息
    city = soup.select(".crumbs a")[-1].text
    weather_info = soup.select(".t li")
    weather_today = weather_info[0].text
    temperature_today = weather_info[1].text

    weather_report = f"{city}今天的天气{weather_today}，气温{temperature_today}"
    return weather_report

while True:
    current_time = datetime.datetime.now()
    year = current_time.year
    month = current_time.month
    day = current_time.day
    if current_time.minute % 1 == 0 and current_time.second == 0:
        hour = current_time.hour % 12
        if hour == 0:
            hour = 12
        time_text = "现在时间" + str(year) + "年" + str(month)+ "月" + str(day)+ "日" + str(hour) + "点" + str(current_time.minute) + "分"
        weather_report = get_weather()
        if weather_report:
            play_audio(time_text + weather_report)
            # play_audio(weather_report)
        else:
            weather_report = f"{time_text}，天气数据获取失败。"
            play_audio(weather_report)

    time.sleep(1)
