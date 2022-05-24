from prompt_toolkit import Application
import sys
import PyQt5
from PyQt5.QtGui import *
from PyQt5.QtCore import *
from PyQt5.QtWidgets import *

class MainDialog(QDialog):
    def __init__(self):
        QDialog.__init__(self, None)

app = Application(sys.argv)     # 여기서 부터 app.exec()사이에 실제 실행될 코드가 나온다
main_dialog = MainDialog()
main_dialog.show()
app.exec_()         # 프로그램을 이벤트 루프로 진입시키는 메소드 
                    # 이벤트 루프 : 프로그램이 종료되지 않고 다음 명령(이벤트)를 대기하는 상태 
