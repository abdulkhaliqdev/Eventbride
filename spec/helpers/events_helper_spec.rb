require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe EventsHelper, type: :helper do
  let(:user) { User.new(name: 'abdul khaliq', id: 1) }

  def login_user(user)
    visit '/login'
    within('.session') do
      fill_in 'name', with: user.name
    end
    click_button 'LogIn'
  end

  describe EventsHelper do
    describe 'created event button' do
      it 'check User is sign in or not' do
        user.save
        login_user(user)
        expect(page).to have_selector(:link_or_button, 'Create Event')
      end
    end
  end
end
