class MyDevise::RegistrationsController < Devise::RegistrationsController
  protected 
  def after_update_path_for(resource)
    user_categories_path(resource)
  end
end