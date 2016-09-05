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
    context.request = requests.get(test_page, verify=False).text


@then('page body includes "jabberwookiee"')
def step_impl(context):
    new_soup = BeautifulSoup(context.request, "html.parser")
    context.page_body = new_soup.find('body').text
    site_contains = "jabberwookiee"
    assert site_contains in context.page_body
