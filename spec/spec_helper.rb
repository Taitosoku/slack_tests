require 'capybara/rspec'
require 'selenium-webdriver'
require 'dotenv/load'
require 'pry'
Dotenv.load('../.env')
# setting default testing browser to chrome
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

def login
    fill_in 'email', with: ENV['LOGIN_EMAIL']
    fill_in 'password', with: ENV['LOGIN_PASS']
    #click_button('#signin_btn') - element not found?
    find('#signin_btn').click # but works like this *shrug*
end
