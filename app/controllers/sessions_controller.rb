# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's profile or another page
      log_in user
      redirect_to user
    else
      # Display an error message and render the login form again
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # Log the user out and redirect to the home page or another page
    log_out
    redirect_to root_url
  end
end
