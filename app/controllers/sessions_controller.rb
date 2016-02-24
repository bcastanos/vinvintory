class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end


    # @user = User.find_by_email(params[:email])
    # if @user && @user.authenticate(params[:password])
    #   session[:user_id] = @user.id
    #   flash[:success] = "Welcome! Thanks #{@user.email} for logging in!"
    #   redirect_to user_path(@user)
    # else
    #   flash[:failure] = "Please try again."
    #   redirect_to new_session_path
    # end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
