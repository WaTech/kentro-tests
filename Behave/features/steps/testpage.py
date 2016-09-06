# this is the steps file for behave project
import behave
import requests
import bs4
import os
import time

from behave import *
from bs4 import BeautifulSoup
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By


@when('user opens kentro test page')
def step_impl(context):
    test_page = os.environ['TEST_PAGE']
    #br = context.browser
    browser.get(test_page)
    time.sleep(5)
    context.page_body = browser.find_element_by_css_selector('body').text


@then('page body includes "jabberwookiee"')
def step_impl(context):
    site_contains = "jabberwookiee"
    # assert site_contains in context.page_body
    WebDriverWait(context.page_body, 10).until(
        EC.text_to_be_present_in_element(
            (By.TAG_NAME, "body"), "jabberwookiee")
    )
