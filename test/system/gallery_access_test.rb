require "application_system_test_case"

class GalleryAccessTest < ApplicationSystemTestCase
  test "logged out user cannot access new gallery page" do
    visit new_gallery_path

    # Should redirect to login page
    assert_current_path new_user_session_path
    assert_text "You need to sign in"
  end
end