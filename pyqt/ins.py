# This Python file uses the following encoding: utf-8

# if __name__ == "__main__":
#     pass

import sys, os
from PySide6.QtCore import QUrl, Qt, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, QQmlComponent, QQmlContext
import json

data_path = "D:\\Workspace\\Python\\Scrapy\\ins"
# 示例数据
data = [
    {"text": "Item 1", "image_path": "./img/_____jjh.jpg"},
    {"text": "Item 2", "image_path": "./img/60_youkong.__.g.jpg"},
    # ...
]

user_data = json.loads(open(os.path.join(data_path, './data/author_info.json'), 'r', encoding='utf-8').read())
udata = []
for item in user_data:
    username = item.get('username')
    # 'user_img': os.path.join(data_path, f'.\\img\\{username}.jpg'),
    it = {
        'username': username,
        'user_img': f'./img/{username}.jpg',
        'img_url': item.get('profile_pic_url'),
        'fullname': item.get('full_name'),
        'uid': item.get('pk'),
        'url': f'https://www.instagram.com/{username}/'
        }
    udata.append(it)
    if len(udata) > 10: break

class MainApp:
    def __init__(self):
        self.app = QGuiApplication(sys.argv)
        self.engine = QQmlApplicationEngine()

        # 加载QML文件
        qml_file = QUrl.fromLocalFile("./qml/ins.qml")
        self.engine.load(qml_file)
        self.engine.rootContext().setContextProperty("applicationDirPath", data_path)

        # 获取root对象
        self.root_objects = self.engine.rootObjects()
        if not self.root_objects:
            sys.exit(-1)
        self.root = self.root_objects[0]

        # 将数据传递给QML
        # self.root.items = data
        self.root.setProperty('items', udata)

    def run(self):
        # 连接QML中的退出信号
        # self.root.quit.connect(self.on_quit)
        sys.exit(self.app.exec())

if __name__ == "__main__":
    app = MainApp()
    app.run()
