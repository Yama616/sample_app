class UsersController < ApplicationController
  def show
    #@user = User.first
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
    
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
