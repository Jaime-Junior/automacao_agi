require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "clipboard"
require_relative "page_helper"

World(PageObjects)

BROWSER = ENV["chrome"]

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?("chrome")
    Capybara::Selenium::Driver.new(app, :browser => :chrome,
                                        :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                                          "chromeOptions" => {
                                            "args" => ["--start-maximized"],
                                          },
                                        ))
  elsif BROWSER.eql?("internet_explorer")
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer,
                                        :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.internet_explorer(
                                          "ignoreProtectedModeSettings" => true,
                                        ))
  elsif BROWSER.eql?("firefox")
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "https://blogdoagi.com.br/"
  config.default_max_wait_time = 20
  Capybara.page.driver.browser.manage.window.maximize
end
