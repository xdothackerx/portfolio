require "test_helper"

feature "As an author or editor I want to approve comments before they're posted so that my blog does not have spam comments." do
  scenario "comments don't display until approved" do
    sign_in(:Editor)
    visit posts_path
    click_on posts(:author).title
    fill_in "comment_content", :with => "testing testing 123"
    check("approved")
    click_on "Create Comment"
    page.text.must_include "testing testing 123"
    fill_in "comment_content", :with => "trololololol"
    click_on "Create Comment"
    page.text.wont_include "trololololol"
  end

  scenario "editors and authors can approve comments" do
  end

  scenario "comments need to have author, author_url, author_email, user_ip, user_agent, referrer, content:text, approved:boolean" do
  end
end
