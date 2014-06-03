require 'test_helper'

feature "Visitor" do
  scenario "As a site visitor I want to view (read) posts so I can enjoy quality content" do
    visit posts_path
    page.text.must_include "Things I Say"
    title = posts(:cf).title
    click_on title
    page.must_have_content posts(:cf).body
  end

  scenario "As a site visitor I should not be able to visit new_post_path" do
    visit new_post_path
    page.must_have_content "Log In"
  end

  scenario "As a site visitor I should not be able to delete, update, or create posts so that I can't modify content I don't own" do
    visit posts_path
    page.wont_have_link "Edit"
    page.wont_have_link "Destroy"
    page.wont_have_link "New Post"
  end

  scenario "As a site visitor I want to only see published posts so that I don't see crap drafts or unapproved content." do
    visit posts_path
    page.wont_have_content posts(:cr).title
  end
end
