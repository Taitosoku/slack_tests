# has:star tests
require './spec_helper'

describe 'message', :type => :feature do
  before do
    visit ENV['URL']
    login
    wait_for_element('#team_menu')
    @channel_name = "test" + (rand(6).to_i).to_s
    # want a clean slate to test in
    #create_channel(channel_name)
  end

  it 'deletes a channel' do
      click_link('test1')
      archive_channel('test1')
      delete_channel('test1')
  end

  it 'sends a message to slackbot' do
    within '#direct_messages' do
      click_link('slackbot')
    end
    within '.ql-editor' do
      send_message('p' ,'poop')
    end
    find('.ql-editor').send_keys(:enter)
    binding.pry
  end

  after do
    archive_channel(@channel_name)
    delete_channel(@channel_name)
  end
end
