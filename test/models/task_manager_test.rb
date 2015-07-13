require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_it_creates_a_task
    create_task
    task = TaskManager.find(first_task_id)

    assert_equal "a title", task.title
    assert_equal "a description", task.description
    assert_equal first_task_id, task.id
  end

  def test_it_finds_all_tasks
    3.times { create_task }

    assert_equal 3, TaskManager.all.count
  end

  def test_it_finds_a_task_by_id
    create_task
    TaskManager.create({ :title => "2nd title", :description => "2nd description" })

    assert_equal "2nd description", TaskManager.find(last_task_id).description
  end

  def test_it_updates_a_task
    create_task

    TaskManager.update(first_task_id, { id: 1, title: "sweet title", description: "a new description" })

    assert_equal "sweet title", TaskManager.find(first_task_id).title
    assert_equal "a new description", TaskManager.find(first_task_id).description
  end

  def test_it_deletes_a_task
    2.times { create_task }

    total = TaskManager.all.count
    TaskManager.delete(first_task_id)
    assert_equal (total - 1), TaskManager.all.count
  end

  def create_task
    TaskManager.create({ title: "a title", description: "a description" })
  end

  def first_task_id
    TaskManager.all.first.id
  end

  def last_task_id
    TaskManager.all.last.id
  end
end