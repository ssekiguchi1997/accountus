class Public::TipsController < ApplicationController
  def new
    @tip = Tip.new
  end

  def create
    @tip = Tip.new(tip_params)
    @tip.user = current_user
    if @tip.save
      redirect_to @tip, notice: "Tip was successfully created."
    else
      render :new
    end
  end

  def index
    @tips = Tip.includes(:user, :post_comments).order(created_at: :desc).page(params[:page]).per(10)
    @tip = Tip.new
  end

  def show
    @tip = Tip.find(params[:id])
    @tip_form = Tip.new
    @post_comment = PostComment.new
  end

  def edit
    @tip = Tip.find(params[:id])
    @tip_form = Tip.new
    if @tip.user != current_user
      redirect_to tips_path, alert: "You are not authorized to edit this tips."
    end
  end

  def update
    @tip = Tip.find(params[:id])
    if @tip.update(tip_params)
      redirect_to @tip, notice: "Tip was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @tip = Tip.find(params[:id])
    @tip.destroy
    redirect_to tips_path
  end

  private

  def tip_params
    params.require(:tip).permit(:title, :detail)
  end

end
