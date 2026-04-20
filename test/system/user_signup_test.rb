require "application_system_test_case"

class UserSignupTest < ApplicationSystemTestCase
  test "user can sign up" do
    visit new_user_registration_path

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password123"
    fill_in "Password confirmation", with: "password123"
    click_button "Sign up"

    assert_text "Welcome"
  end
end