class Admin::DashboardsController < ApplicationController

  layout 'admin'

  before_action :authenticate_admin!
  
  def index
    @users = User.all
    @tips = Tip.all
  end
  
end
