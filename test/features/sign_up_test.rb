require "test_helper"

feature "As the site owner, I want to restrict who can access the site so that my friends don't prank me with 'poopin' posts" do
  # scenario "signing up with the site" do
  #   # Given a visit to the main page
  #   visit root_path
  #   # When the user clicks on the sign up button and enters their information
  #   find_by_id("register").click
  #   fill_in "Email", :with => "test@example.com"
  #   fill_in "Password", :with => "password"
  #   fill_in "Password confirmation", :with => "password"
  #   click_on "Sign up"
  #   # Then a new user account is created
  #   page.must_have_content "signed up"
  #   page.wont_have_content "There was a problem with your sign up."
  # end

  scenario "logging out of the site" do
    # Given a visit to the main page when signed in
    sign_in
    # When the user clicks on the log in button and then logs out
    find_by_id("logout").click
    # Then the session should be ended
    page.must_have_content "Signed out successfully."
  end
end
