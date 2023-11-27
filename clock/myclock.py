import datetime
import time
from gtts import gTTS
import os

def play_audio(text):
    tts = gTTS(text=text, lang='zh-cn')
    tts.save('report.mp3')
    os.system('mpv report.mp3')

while True:
    current_time = datetime.datetime.now()
    if current_time.minute % 1 == 0 and current_time.second == 0:
        hour = current_time.hour % 12
        if hour == 0:
            hour = 12
        time_text = "现在北京时间" + str(hour) + "点" + str(current_time.minute) + "分"
        play_audio(time_text)
    time.sleep(1)
