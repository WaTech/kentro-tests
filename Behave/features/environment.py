import threading
from wsgiref import simple_server
from selenium import webdriver


def before_all(context):
    context.browser = webdriver.Chrome()
    #context.browser.set_window_size(1400,1000)
    context.browser.set_window_size(1200, 768)

def after_all(context):
    context.browser.quit()


def before_feature(context, feature):
    pass
