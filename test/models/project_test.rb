require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Project::pinned_by(user) works" do
    refute_empty Project.pinned_by(users(:ori))
    assert_equal [projects(:museum)], Project.pinned_by(users(:ori))
  end

  test "Project#students returns students who have pinned the project" do
    assert_equal 2, projects(:museum).students.length
  end

  test "Project#pinned_by?" do
    assert projects(:museum).pinned_by?(users(:ori))
    refute projects(:museum).pinned_by?(users(:raj))
  end
end
