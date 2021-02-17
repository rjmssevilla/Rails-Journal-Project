require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @task = tasks(:one)
  end
  
  test "1. should get index" do
    get category_tasks_path(@task)
    assert_response :success   
  end

   test "2. should get new" do
     get new_category_task_path(@task)
     assert_response :success
   end

   test "3. create should be successful" do
    assert_difference('Task.count') do
      post category_tasks_path(@task), params: {task: {title: 'Volleyball', description: 'Spike it', deadline: 'today'}}
    end
    assert_redirected_to category_path(@category)
  end

   test "4. should get edit" do
    get edit_task_path(@task)
    assert_response :success
  end

  test "5. update should be sucessful" do
    patch task_path(@task), params: {task: {title: 'Volleyball', description: 'Spike it', deadline: 'today'}}
    assert_redirected_to category_path(@task.category_id)
  end

  test "6. destroy should be succesful" do
    assert_difference('Task.count', -1) do
      delete task_path(@task)
    end

    assert_redirected_to category_path(@task.category_id)
  end
end
