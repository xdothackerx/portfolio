require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts, show list" do
    # Given existing posts
    # When I visit /posts
    visit posts_path
    #The existing posts should be loaded
    page.text.must_include "Becoming a Code Fellow"
  end
end
