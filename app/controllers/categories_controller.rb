class CategoriesController < ApplicationController
   before_action :authenticate_user!
   before_action :get_user

   def index
     @categories = @user.categories
    end

  def new
    @category = @user.categories.build
  end

  def create
    @category = @user.categories.build(category_params)
    if @category.save
	    redirect_to user_categories_path(@user)
    else 
      render :new
    end
  end

   def show
      @category = @user.categories.find(params[:id])
    end

   def edit
    @category = @user.categories.find(params[:id])
  end

  def update
    @category = @user.categories.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category was successfully edited"
     redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = @user.categories.find(params[:id])
    @category.destroy
    flash[:notice] = "Category was successfully deleted."
    redirect_to user_categories_path(@user)
  end

  private
  def get_user
    @user = current_user
  end

  def category_params
   params.require(:category).permit(:title)
  end

end
