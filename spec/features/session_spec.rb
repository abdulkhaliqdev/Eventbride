require 'rails_helper'

RSpec.feature 'Sessions', type: :feature do
  let(:user_one) { User.new(name: 'abdul12') }

  def login_user(user)
    visit '/login'
    within('.session') do
      fill_in 'name', with: user.name
    end
    click_button 'LogIn'
  end

  context 'User Login' do
    scenario 'successfully Login' do
      user_one.save
      login_user(user_one)
      expect(page).to have_content 'User was successfully SignIn.'
    end

    scenario 'Unable to Login' do
      login_user(user_one)
      expect(page).to have_content 'Unable to locat the User'
    end
  end

  context 'SignUp User' do
    scenario 'Successfully Signup' do
      visit '/signup'
      within('.session') do
        fill_in 'name', with: 'Alica'
      end
      click_button 'SignUp'
      expect(page).to have_content 'User was successfully created.'
    end
  end
end
