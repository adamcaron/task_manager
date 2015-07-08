require_relative '../test_helper'

class UserCanFillInTaskFormTest < FeatureTest

  def test_new_task_link_works
    visit "/"
    click_link "New Task"
    assert_equal "/tasks/new", current_path
  end

  def test_user_can_fill_in_task_form
    # want to fill in title with pizza
    visit "/tasks/new"
    fill_in("task[title]", with: "Some Random Title")
    fill_in("task[description]", with: "The best description ever.")

    click_button("Create Task")
    assert_equal "/tasks", current_path

    assert page.has_content?("Some Random Title")
  end
end