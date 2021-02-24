require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
   get '/users/sign_in'
   sign_in users(:user_one)

   @user = users(:user_one)
   @category = categories(:category_one)
  end

  test "1. should get category index" do
    get user_categories_path(@user)
    assert_response :success  
  end

  test "2. should get category new" do
    get new_user_category_path(@user)
    assert_response :success
  end

  test "3. create category should be successful" do
    assert_difference('Category.count') do
      post user_categories_path(@user), params: {category: {title: 'First'}}
      @category = Category.last
    end
   
   assert_redirected_to user_categories_path(@user)
  end

  test "4. should get category show" do
    get category_path(@category)
    assert_response :success
  end

  test "5. should get category edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "6. update should be category sucessful" do
    patch category_path(@category), params: {category: {title: 'First'}}
    assert_redirected_to category_path(@category)
  end

  test "7. destroy should be category succesful" do
    assert_difference('Category.count', -1) do
      delete category_path(@category)
    end

    assert_redirected_to user_categories_path(@user)
  end
  
end