require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "User sign in" do
  scenario "when signing in for the first time" do
    sign_in

    expect(page).to have_content("Yeller")
    expect(page).to have_content(User.first.email)
    expect(page).to have_css('article.messages')
    expect(page).to have_css('div.new-message-form')
  end

  scenario "signs out" do
    sign_in
    sign_out

    expect_user_to_be_signed_out
  end
end
