require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  #go to new category path
	test "should go to new category form and create category" do
    get new_category_path
    assert_response :success
    
     #submit form
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category: {title:'hatdog'}}
      assert_response :redirect 
    end

    #after submit
    follow_redirect!
    assert_response :success
  end

 

end
