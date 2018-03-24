require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "Messages#index" do
  scenario "User signs in to chat" do
    sign_in

    fill_in('message_text', :with => 'Hello World!')
    click_button 'Send'

    save_and_open_page

    expect(page).to have_content 'Hello World!'
  end
end
