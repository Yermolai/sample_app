class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    ###### final?
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
#     flash[:info] = "Welcome to the Sample App!"
#     flash[:warning] = "Welcome to the Sample App!"
#     flash[:danger] = "Welcome to the Sample App!"
      redirect_to @user # Handle a successful save. Equals:     redirect_to user_url(@user)
    else
      render 'new'
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
