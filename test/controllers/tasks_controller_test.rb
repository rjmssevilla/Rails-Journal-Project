require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user_one)
 
    @category = categories(:category_one)
    @task = tasks(:task_one)
  end
  
   test "1. should get task new" do
     get new_category_task_path(@category)
     assert_response :success
   end

   test "2. create task should be successful" do
    assert_difference('Task.count') do
      post category_tasks_path(@category), params: {task: {title: 'Volleyball', description: 'Spike it', deadline: '2021-12-12'}}
    end
    assert_redirected_to category_path(@category)
  end

   test "3. should get edit" do
    get edit_task_path(@task)
    assert_response :success
  end

  test "4. update should be sucessful" do
    patch task_path(@task), params: {task: {title: 'Volleyball', description: 'Spike it', deadline: '2021-12-12'}}
    assert_redirected_to category_path(@category)
  end

  test "5. destroy should be succesful" do
    assert_difference('Task.count', -1) do
      delete task_path(@task)
    end

    assert_redirected_to category_path(@category)
  end
end
