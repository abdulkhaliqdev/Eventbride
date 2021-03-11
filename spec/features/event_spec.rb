require 'rails_helper'

RSpec.feature 'Events', type: :feature do
  let(:user_one) { User.new(name: 'abdul12') }
  let(:event) { Event.new(creator_id: user_one.id, event: 'Private Events', description: 'Create website for Private Event with Ruby on Rail', date: DateTime.current+1.week) }

  def createEvent(event)
    visit new_event_path
    within('.createEvent1') do
      fill_in 'Name of event', with: event.event
    end
    within('.createEvent2') do
      fill_in 'About the Event', with: event.description
    end
    within('.createEvent3') do
      select_date_input event.date
    end
    click_button 'Create Event'
  end

  def select_date_input(date_time)
    select date_time.strftime('%Y'), from: 'event_date_1i'
    select date_time.strftime('%B'), from: 'event_date_2i'
    select date_time.strftime('%-d'), from: 'event_date_3i'
    select date_time.strftime('%H'), from: 'event_date_4i'
    select date_time.strftime('%M'), from: 'event_date_5i'
  end

  def login_user(user)
    visit '/login'
    within('.session') do
      fill_in 'name', with: user.name
    end
    click_button 'LogIn'
  end

  context 'Create Event' do
    scenario 'Successfully Create Event' do
      user_one.save
      login_user(user_one)
      createEvent(event)
      expect(page).to have_content 'Event is successfully created.'
    end

    scenario 'Unable to Create Event' do
      event.description = ''
      user_one.save
      login_user(user_one)
      createEvent(event)
      expect(page).to have_content "can't be blank"
    end
  end

  context 'List of Events' do
    scenario 'Display Event oN Index' do
      user_one.save
      login_user(user_one)
      createEvent(event)
      expect(page).to have_content event.event
    end
  end
end
