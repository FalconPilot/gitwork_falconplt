class HelloController < ApplicationController
  def index
    if params[:name] && params[:name] != ""
      @name = params[:name]
    else
      @name = "world"
    end
  end
end
