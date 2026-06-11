from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

options = Options()
options.add_argument('--headless=new')
options.add_argument('--no-sandbox')

driver = webdriver.Chrome(options=options)
try:
    driver.get('https://opensource-demo.orangehrmlive.com/web/index.php/auth/login')
    try:
        el = WebDriverWait(driver, 20).until(EC.visibility_of_element_located((By.XPATH, "//input[@name='username']")))
        print('found=', el, 'name=', el.get_attribute('name'))
    except Exception as e:
        print('wait_error=', type(e).__name__, e)
        print('body=', driver.find_element(By.TAG_NAME, 'body').text[:5000])
finally:
    driver.quit()
