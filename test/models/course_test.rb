require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = Course.new(name: "Programming")
  end

  test "course should be valid" do
    assert @course.valid?
  end

  test "course name should be present" do
    @course.name =  " "
    assert_not @course.valid?
  end

  test "course name should be unique" do
    @course.save
    @course = Course.new(name: "Programming")
    assert_not @course.valid?
  end

  test "course name should not be too short" do
    @course.name = "a"*2
    assert_not @course.valid?
  end

end