require "application_system_test_case"

class GalleryCreationTest < ApplicationSystemTestCase
  setup do
    @user = User.create!(
      email: "creator@example.com",
      password: "password123"
    )
  end

  test "logged in user can create a gallery" do
    # Log in
    visit new_user_session_path
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password123"
    click_button "Log in"

    # Create gallery
    visit new_gallery_path
    fill_in "Title", with: "My Test Gallery"
    click_button "Create Gallery"

    assert_text "Gallery created successfully."
    assert_text "My Test Gallery"
  end
end