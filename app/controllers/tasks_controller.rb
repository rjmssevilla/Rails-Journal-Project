class TasksController < ApplicationController

  before_action :get_category, only: [:index, :new, :create]

  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
	    redirect_to category_path(@category)
    else 
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
  
    if @task.update(task_params)
      flash[:notice] = "Task was successfully edited"
     redirect_to category_path(@task.category_id)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Category was successfully deleted."
    redirect_to category_path(@task.category_id)
  end


private
 def get_category
  @category = Category.find(params[:category_id])
 end

def task_params
  params.require(:task).permit(:title, :description, :deadline, :category_id)
end
end
