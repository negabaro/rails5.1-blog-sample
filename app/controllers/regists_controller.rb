class RegistsController < Devise::RegistrationsController 
  def new
    build_resource({})
    respond_with self.resource

  end

  def create
    puts 'testtest'
    build_resource(sign_up_params)
    resource.save


  end

  private
  def sign_up_params
    params.require(:user).permit(:user_nickname, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    root_path 
  end

  
end
