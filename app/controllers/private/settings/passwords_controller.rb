#class Private::Settings::PasswordsController < Devise::PasswordsController
#class Private::Settings::PasswordsController < AuthorizedController 
class Private::Settings::PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @change_password = ChangePassword.new
  end

  def update
    #@change_password = ChangePassword.new params[:change_password]
    #@change_password = ChangePassword.new params[:change_password]
    #attr = params.require(:change_password).permit(:current_password, :new_password, :new_password_confirmation)
    @change_password = ChangePassword.new(password_params)

    @change_password.valid?

    unless current_user.valid_password?(@change_password.current_password)
      @change_password.errors.add(:current_password, 'が違います。')
    end

    if @change_password.new_password != @change_password.new_password_confirmation
      @change_password.errors.add(:new_password_confirmation,'が同じではありません')
    end

    render action: :edit and return if @change_password.errors.any?
    
    current_user.password = @change_password.new_password
    current_user.save!

    redirect_to action: :edit

  end
  
  private
    def password_params
      params.require(:change_password).permit(:new_password,:new_password_confirmation,:current_password)
    end

end
