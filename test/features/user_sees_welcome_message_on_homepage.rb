require_relative '../test_helper'

class UserSeesWelcomeMessageTest < FeatureTest

  def test_home_page_displays_welcome_message
    # WWUD what would use do?
    # go to a web page
    # look at the rendered page with their eyeballs
    # see stff they are looking for
    visit "/"
    assert page.has_content?("Welcome to the Task Manager")
    # or
    within "h1" do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end
end