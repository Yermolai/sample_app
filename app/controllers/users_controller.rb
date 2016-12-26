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
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # Handle a successful save. Equals:     redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  # def destroy               # это дестрой из sessions. Нужен ли какой-нибудь дестрой в users?
  #   log_out
  #   redirect_to root_url
  # end







  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
