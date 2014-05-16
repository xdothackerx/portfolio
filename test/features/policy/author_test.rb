require "test_helper"

feature "Authorship" do
  scenario "As an author I want to create posts so that I can share great content with the world" do
    sign_in(:Author)
    click_on "Blog"
    click_on "New Post"
    page.wont_have_field("post_published")
  end

#   scenario "As an author I want to be able to update posts so that I can fix typos."

#   end

#   scenario "As an author I should not be able to publish posts so that I can give the editor publishing control."

#   end

#   scenario "As an author I should be able to delete only my own posts in case I regret my drunken ranting."

#   end
end
