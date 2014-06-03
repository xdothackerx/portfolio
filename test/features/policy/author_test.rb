require "test_helper"

feature "Authorship" do
  scenario "As an author I want to create posts so that I can share great content with the world" do
    sign_in(:Author)
    click_on "Blog"
    click_on "New Post"
    fill_in "Title", with: "Test"
    fill_in "Body", with: "123"
    click_on "Create Post"
    page.text.must_include "123"
    page.text.must_include "Status: Not Published"
  end

  scenario "As an author I want to be able to update posts so that I can fix typos." do
    sign_in(:Author)
    click_on "Blog"
    page.must_have_link("Edit")
  end

  scenario "As an author I should be able to delete only my own posts in case I regret my drunken ranting." do
    sign_in(:Author)
    click_on "Blog"
    page.must_have_link("Destroy")
  end

  scenario "As an author I should not be able to publish posts so that I can give the editor publishing control." do
    sign_in(:Author)
    click_on "Blog"
    click_on "New Post"
    page.wont_have_field("published")
  end
end
