class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tips = @user.tips
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
    @tip = Tip.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :job, :career)
  end
end
