require 'capybara/rspec'
require 'selenium-webdriver'
require 'dotenv/load'
require 'pry'
require 'holdon'
Dotenv.load('../.env')

# setting default testing browser to chrome
Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

def create_channel(channel_name)
   #create new chat room to test in
   within 'channels' do
     click_button 'new_channel_btn'
  end
  #wait_for_element('#channel_create_title')
  fill_in '#channel_create_title', with: channel_name
  click_button 'save_channel'
end

def delete_channel(channel_name)
  # can't create a new channel with the same name if it's only archived
  # would love to learn the short cut to this
  click_button 'channels_header'
  click_link 'View archived channels...'
  click_link channel_name
  confirm = window_opened_by do
    click_link 'Delete channel'
  end
  within_window confirm do
    check 'delete_channel_cb'
    click_button 'Delete it'
  end
  page.close
  page.switch_to().window().first
end

def archive_channel
  # delete chat room after testing to ensure clean slate
  click_button('channel_actions_toggle')
  click_link('channel_advanced_item')
  click_link('Archive this channel')
  click_link('Yes, archive the channel')
end

def login
    fill_in 'email', with: ENV['LOGIN_EMAIL']
    fill_in 'password', with: ENV['LOGIN_PASS']
    click_button 'signin_btn'
end

def send_message(element, text)
  find(element).set(text)
end

def wait_for_element(element)
  # wait until #team_menu has loaded
  HoldOn.until(timeout: 60, interval: 5, message: "waiting for page to load") do
    find element
  end
end
