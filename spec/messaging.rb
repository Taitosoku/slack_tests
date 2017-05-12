# has:star tests
require './spec_helper'

describe 'message', :type => :feature do
  before do
    visit ENV['URL']
    login
    wait_for_element('#team_menu')
    @channel_name = "test" + (rand(6).to_i).to_s
    # want a clean slate to test in
    create_channel(@channel_name)
  end

  it 'appears in starred list' do
    within '#channels' do
      click_link @channel_name
    end
    within '.ql-editor' do
      @message = "the sky is blue" # TODO generate random phrases
      send_message('p' , @message)
    end
    find('.ql-editor').send_keys(:enter)
    # now find the star in the first message
    within first('.message_content_header').hover do
      click('span.message_star_holder button')
    end
    click_button 'stars_toggle'
    expect(find('#stars_scroller')).to have_content(@message)
  end

  it 'is searchable by has:star' do
    within '#channels' do
      click_link @channel_name
    end
    within '.ql-editor' do
      @message = "the grass is green" # TODO generate random phrases
      send_message('p' , @message)
    end
    find('.ql-editor').send_keys(:enter)
    # now find the star in the first message
    within first('.message_content_header').hover do
      click('span.message_star_holder button')
    end
    fill_in('search_terms', with: 'has:star')
    find('#search_terms').send_keys(:enter)
    expect(find('#search_results_items')).to have_content(@message)
  end

  after do
    # clean up
    archive_channel
    delete_channel(@channel_name)
  end
end
