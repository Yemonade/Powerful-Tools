from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import datetime
import time


class TaoBaoClearCarMachine(object):

    # 初始化参数
    def __init__(self, clear_time, login_url="https://www.taobao.com",
                 car_url="https://cart.taobao.com/cart.htm"):
        # the login page url
        self.login_url = login_url
        self.car_url = car_url

        self.driver = webdriver.Chrome()
        self.clear_time = clear_time

    # 提前扫码登录
    def login(self):

        self.driver.get(self.login_url)
        time.sleep(3)
        if self.driver.find_element("link text", "亲，请登录"):
            self.driver.find_element("link text", "亲，请登录").click()
            print("请在15秒内完成扫码")
            time.sleep(15)
            self.driver.get("https://cart.taobao.com/cart.htm")
        time.sleep(3)
        if self.driver.find_element("id", "J_SelectAll1"):
            self.driver.find_element("id", "J_SelectAll1").click()
        now = datetime.datetime.now()
        print("login success:", now.strftime("%Y-%m-%d %H:%M:%S"))

    # buy
    def order(self):
        click_one = False
        while True:
            now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            print("抢购时间: ", self.clear_time, "; 目前时间: ", now)
            # 对比时间，时间到的话就点击结算
            if now > self.clear_time:
                try:
                    print("开始抢购")
                    if not click_one and self.driver.find_element("id", "J_Go"):
                        print("if 1")
                        self.driver.find_element("id", "J_Go").click()
                        click_one = True
                        print("===== click 1 =====")
                    if click_one:
                        print("if 2")
                        self.driver.find_element("link text", "提交订单").click()
                        print("===== click 2 =====")
                except:
                    print("except")
                    time.sleep(0.1)
                    # self.driver.refresh()
            time.sleep(0.1)

    # start buying
    def run(self):
        self.login()
        self.order()


# 2022-12-24 10:00:00
if __name__ == '__main__':
    clear_time = input("Please input the time for clearing the order car: (format: 2022-12-20 12:00:00): ")
    p = TaoBaoClearCarMachine(clear_time)
    p.run()
