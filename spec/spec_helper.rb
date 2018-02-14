require 'rspec'
require 'selenium-webdriver'
require 'allure-rspec'
require '../helpers/element-helper'
require '../pages/upwork-home-page'

RSpec.configure do |config|
  config.include AllureRSpec::Adaptor
  config.before(:each) do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--ignore-certificate-errors')
    options.add_argument('--disable-popup-blocking')
    options.add_argument('--disable-translate')
    options.add_argument('--start-fullscreen')
    Selenium::WebDriver::Chrome.driver_path = __dir__ + '/../drivers/chromedriver'
    $driver = Selenium::WebDriver.for :chrome, options: options
    $elementHelper = ElementHelper.new
    $upworkHomePage = UpworkHomePage.new
    #1. Go to https://www.upwork.com/
    $upworkHomePage.go_home
  end

  config.after(:each) do |reporting|
    if reporting.exception
      reporting.attach_file('screenshot', File.new(
          $driver.save_screenshot(
              File.join(Dir.pwd, "../results/#{UUID.new.generate}.png"))))
    end
    $driver.quit
  end
end

AllureRSpec.configure do |config|
  config.output_dir = '../results'
  config.clean_dir = true # this is the default value
end


