class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    user_categories_path(@user) # your path
  end
end
