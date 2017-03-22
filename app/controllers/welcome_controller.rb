class WelcomeController < ApplicationController
  def index
    flash[:notice] = "Notice:早安！快起床！"
    flash[:alert] = "Alert:晚安！该睡觉！"
    flash[:warning] = "Warning:中午！去吃饭！"
  end
end
