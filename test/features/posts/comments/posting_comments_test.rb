require "test_helper"

feature "As a site visitor I want to write a comment from a blog post page so that I can troll the author." do
  scenario "commenting on a blog post" do
    visit posts_path
    first(:link, "Show").click
    save_and_open_page
  end
end
