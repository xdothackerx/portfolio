require "test_helper"

feature "As an author or editor I want to approve comments before they're posted so that my blog does not have spam comments." do
  scenario "comments don't display until approved" do
    sign_in(:Editor)
    visit posts_path
    click_on posts(:author).title
    fill_in "comment_content", :with => comments(:person).content
    check("approved")
    click_on "Create Comment"
    page.text.must_include comments(:person).content
    fill_in "comment_content", :with => comments(:troll).content
    click_on "Create Comment"
    click_on "Log Out"
    visit posts_path
    click_on posts(:author).title
    page.text.wont_include comments(:troll).content
  end

  scenario "authors can also approve comments" do
    sign_in(:Author)
    visit posts_path
    click_on posts(:author).title
    fill_in "comment_content", :with => comments(:person).content
    check("approved")
    click_on "Create Comment"
    click_on "Log Out"
    visit posts_path
    click_on posts(:author).title
    page.text.must_include comments(:person).content
  end
end

feature "As the portfolio owner I want to be able to control comments about my projects so that I don't have awkward stuff on my page." do
    scenario "Comments don't display on Projects until approved." do
        sign_in (:Editor)
        visit projects_path
        click_on projects(:portfolio).title
        fill_in "comment_content", :with => comments(:person).content
        check("approved")
        click_on "Create Comment"
        page.text.must_include comments(:person).content
        fill_in "comment_content", :with => comments(:troll).content
        click_on "Create Comment"
        click_on "Log Out"
        visit projects_path
        click_on projects(:portfolio).title
        page.text.wont_include comments(:troll).content
    end

    scenario "Comments can only be approved by editors." do
        sign_in (:Author)
        visit projects_path
        click_on projects(:portfolio).title
        page.wont_have_field("published")
    end

    scenario "Anonymous comments can't be made on Project Show pages." do
        visit projects_path
        click_on projects(:portfolio).title
        fill_in "comment_content", :with => comments(:troll).content
        click_on "Create Comment"
        page.text.must_include("Please log in or register first.")
    end
end
