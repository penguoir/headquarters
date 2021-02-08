require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:ori)
    @task = tasks(:prototype)
    @project = @task.project
  end

  test "should get index" do
    get tasks_url(@project.id)
    assert_response :success
  end

  test "should get new" do
    get new_task_url(@project.id)
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url(@project.id), params: { task: { project_id: @task.project_id, title: @task.title, user_id: @task.user_id } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { project_id: @task.project_id, title: @task.title, user_id: @task.user_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to project_url(@project)
  end
end
