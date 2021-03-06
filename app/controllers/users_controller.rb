class UsersController < ApplicationController
  def new
    @user= User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Sign up successfully"
      redirect_to @user
    else
      flash.now[:danger] = "Sign up unsuccessfully"
      render'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private
   def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  

 
end
