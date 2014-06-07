require "test_helper"

feature "Editor" do
  scenario "editors can publish" do
    visit new_user_session_path
    sign_in(:Editor)
    visit new_post_path
    page.must_have_field("published")
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    find_by_id("published").set(true)
    click_on "Create Post"
    page.text.must_include "Status: Published"
  end
end
