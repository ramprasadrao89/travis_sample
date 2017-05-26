require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["browser"] = "Chrome"
caps["browser_version"] = "54.0"
caps["os"] = "Windows"
caps["os_version"] = "10"
caps["browserstack.debug"] = "true"
caps["build"] = ENV['BS_AUTOMATE_BUILD']
caps["project"] = ENV['BS_AUTOMATE_PROJECT']
caps["name"] = "Sample Test"

driver = Selenium::WebDriver.for(:remote,
  :url => "http://"+ENV['BROWSERSTACK_USER']+":"+ENV['BROWSERSTACK_ACCESS_KEY']+"@hub.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "http://www.google.com"
element = driver.find_element(:name, 'q')
element.send_keys "BrowserStack"
element.submit
puts driver.title
driver.quit

