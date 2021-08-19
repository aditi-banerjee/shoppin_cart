class RegistrationController < ApplicationController

  skip_before_action :authenticate!, :only => :create

  # These methods were copied from the admin_api
  # User creation/management should be refactored into a service

  def create
    @user = User.new(user_params)
    @user.email = params[:email].downcase
    if @user.save
      render json: @user, status: 200
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :name, :password)
    end
end
