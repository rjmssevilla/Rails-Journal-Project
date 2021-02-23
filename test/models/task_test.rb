require "test_helper"

class TaskTest < ActiveSupport::TestCase
  setup do
    @task = tasks(:task_one)
  end
  
  test "1A. should not save task without title" do
    @task.title = ''
    assert_not @task.valid?, 'Saved task without title'
   end

   test "1B. should not save task with title greater than 20 characters" do
    @task.title = 'aaaaaaaaaaaaaaaaaaaaa'
    assert_not @task.valid?, 'Saved task with title greater than 20 characters'
   end

   test "2. should not save task without description" do
    @task.description = ''
    assert_not @task.valid?, 'Saved task without description'
   end

   test "3. should not save task without deadline" do
    @task.deadline = ''
    assert_not @task.valid?, 'Saved task without deadline'
   end
end
