# this is the steps file for behave project
import behave
import requests
import bs4
import os

from behave import *
from bs4 import BeautifulSoup


@when('user opens kentro test page')
def step_impl(context):
    test_page = os.environ['TEST_PAGE']
    br = context.browser
    br.get(test_page)
    time.sleep(5)
    context.page_body = br.find_element_by_css_selector('body').text


@then('page body includes "jabberwookiee"')
def step_impl(context):
    site_contains = "jabberwookiee"
    assert site_contains in context.page_body
