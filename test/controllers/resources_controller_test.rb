require 'test_helper'

class ResourcesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @resource = resources(:british_museum_site)
    sign_in users(:ori)
  end

  test "should get index" do
    get project_resources_url(@resource.project)
    assert_response :success
  end

  test "should get new" do
    get new_project_resource_url(@resource.project)
    assert_response :success
  end

  test "should create resource" do
    assert_difference('Resource.count') do
      post project_resources_url(@resource.project), params: { resource: { project_id: @resource.project_id, title: @resource.title, user_id: @resource.user_id } }
    end

    assert_redirected_to resource_url(Resource.last)
  end

  test "should show resource" do
    get resource_url(@resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_resource_url(@resource)
    assert_response :success
  end

  test "should update resource" do
    patch resource_url(@resource), params: { resource: { project_id: @resource.project_id, title: @resource.title, user_id: @resource.user_id } }
    assert_redirected_to resource_url(@resource)
  end

  test "should destroy resource" do
    assert_difference('Resource.count', -1) do
      delete resource_url(@resource)
    end

    assert_redirected_to project_url(@resource.project)
  end
end
