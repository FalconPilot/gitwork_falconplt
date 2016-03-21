class MainController < ApplicationController
  def index
    if params[:user] && params[:user] != ""
      @user = params[:user]
    else
      @user = "world" if @user.nil?
    end
  end
end
