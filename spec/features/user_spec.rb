require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  let(:user_one) { User.new(name: 'abdul12') }
  let(:user_two) { User.new(name: 'jaim12') }
  let(:event) { Event.new(creator_id: user_one.id, event: 'Private Events', description: 'Create website for Private Event with Ruby on Rail', date: DateTime.current+1.week) }

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
      event.save
      visit user_path(user_one)
      expect(page).to have_content event.event
    end
  end

  context 'Attend Event' do
    scenario 'Successfully Attend Event' do
      user_one.save
      login_user(user_one)
      event.save
      user_two.save
      login_user(user_two)
      visit event_path(event)
      click_button 'Attend Event'
      expect(page).to have_content 'You become the Attendee of the Event'
    end
  end
end
