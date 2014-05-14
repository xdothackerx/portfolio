require "test_helper"

feature "As the site owner, I want to restrict who can access the site so that my friends don't prank me with 'poopin' posts" do
  scenario "signing up with the site" do
    # Given a visit to the main page
    visit root_path
    # When the user clicks on the sign up button and enters their information
    sign_in
    # Then a new user account is created
    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up."
  end

  scenario "logging out of the site" do
    # Given a visit to the main page
    visit user_session_path
    # When the user clicks on the log in button and then logs out
    find("button", :text => "Log Out").click
    # Then the session should be ended
    page.must_have_content "You have signed out."
  end
end
