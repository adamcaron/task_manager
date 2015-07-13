require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    TaskManager.create({ :title => "a title", :description => "a description" })
    task = TaskManager.find(TaskManager.all.first.id)
    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal TaskManager.all.first.id, task.id
  end

  def test_it_finds_all_tasks
    3.times do
      TaskManager.create({ :title => "a title", :description => "a description"})
    end

    assert_equal 3, TaskManager.all.count
  end

  def test_it_finds_a_task_by_id
    TaskManager.create({ :title => "a title", :description => "a description" })
    TaskManager.create({ :title => "2nd title", :description => "2nd description" })
    assert_equal "2nd description", TaskManager.find(TaskManager.all.last.id).description
  end

  def test_it_updates_a_task
    create_task
    TaskManager.update(TaskManager.all.first.id, { id: 1, title: "sweet title", description: "a new description" })

    assert_equal "sweet title", TaskManager.find(TaskManager.all.first.id).title
    assert_equal "a new description", TaskManager.find(TaskManager.all.first.id).description
  end

  def test_it_annihilates_a_task_into_oblivion
    task = TaskManager.create({ title: "a title", description: "a description" })
    TaskManager.create({ title: "2nd title", description: "2nd description" })

    TaskManager.delete(TaskManager.all.first.id)

    assert_equal "2nd description", TaskManager.find(TaskManager.all.last.id).description
    refute TaskManager.all.include?(task)
  end

  def create_task
    TaskManager.create({ title: "a title", description: "a description" })
  end
end