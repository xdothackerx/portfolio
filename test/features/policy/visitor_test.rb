require 'test_helper'

feature "Visitor" do
  scenario "As a site visitor I want to view (read) posts so I can enjoy quality content" do
    visit root_path
    click_on "Blog"
    page.must_have_content "Blog Posts"
    title = posts(:cr).title
    page.find('tr', :text => title).click_on "Show"
    page.must_have_content posts(:cr).body
  end

  scenario "As a site visitor I should not be able to visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up to continue."
  end

  scenario "As a site visitor I should not be able to delete, update, or create posts so that I can't modify content I don't own" do
    visit posts_path
    page.wont_have_link "Edit"
    page.wont_have_link "Destroy"
    page.wont_have_link "New Post"
  end

  scenario "As a site visitor I want to only see published posts so that I don't see crap drafts or unapproved content." do
  end
end
