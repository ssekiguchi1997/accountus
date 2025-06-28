class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tips = @user.tips.includes(:user, :post_comments).order(created_at: :desc).page(params[:page]).per(10)
    @tip = Tip.new
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

  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      redirect_to new_user_registration_path, notice: "User was successfully deleted."
    else
      redirect_to user_path(current_user), alert: "You can only delete your own account."
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :job, :career)
  end
end
