class SessionsController < ApplicationController
  skip_before_action :authenticate!, only: :create

  def create
    user = User.find_by(email: params[:email])
            .try(:authenticate, params[:password])

    if user
      access_token.update(user)
      render json: user, status: 200
    else
      render nothing: true, status: 401
    end
  end

  def destroy

    if @current_user
      @current_user = nil
      authenticate!
      render json: {
        message: "You are Successfully logged out"
      }, status: 200
    end
  end
end
