require "test_helper"

feature "As a potential employer, I want to send a message to Sam so that
  I can tell her about the awesome project I want help with." do
  it "Collects visitor input in an existing email template" do
    visit "/contact"
    fill_in "name", with: "Employer"
    fill_in "email", with: "hr@somecompany.com"
    fill_in "message", with: "When are you available for an interview?"
    click_on "Send Email"
    page.text.must_include "Your email has been sent."
  end

  it "sends the email to my email address" do
  end
end
