require "test_helper"

feature "Editor" do
  scenario "editors can publish" do
    visit new_user_session_path
    sign_in(:Editor)
    visit new_post_path
    page.must_have_field("published")
    save_and_open_page
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"
    page.text.must_include "Status: Published"
  end
end
