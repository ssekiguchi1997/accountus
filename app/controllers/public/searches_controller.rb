class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params[:model].downcase
    @content = params[:content]
    @method = params[:method]
    if @model == 'user'
      @records = User.search_for(@content, @method).page(params[:page]).per(10)
    else
      @records = Tip.search_for(@content, @method).page(params[:page]).per(10)
    end
  end
end
