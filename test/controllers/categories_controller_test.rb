require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @category = categories(:one)
  end
  
  test "1. should get index" do
    get categories_path   
    assert_response :success   
  end

  test "2. should get new" do
    get new_category_path
    assert_response :success
  end

  test "3. create should be successful" do
    assert_difference('Category.count') do
      post categories_path, params: {category: {title: 'First'}}
      @category = Category.last
    end
   
   assert_redirected_to category_path(@category)
  end

  test "4. should get show" do
    get category_path(@category)
    assert_response :success
  end

  test "5. should get edit" do
    get edit_category_path(@category)
    assert_response :success
  end

  test "6. update should be sucessful" do
    patch category_path(@category), params: {category: {title: 'First'}}
    assert_redirected_to category_path(@category)
  end

  test "7. destroy should be succesful" do
    assert_difference('Category.count', -1) do
      delete category_path(@category)
    end

    assert_redirected_to categories_path
  end
  
end