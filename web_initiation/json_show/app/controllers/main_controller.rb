#encoding: utf-8
class MainController < ApplicationController
  def index
    file = File.read("#{Rails.root}/app/assets/javascripts/products.json")
    @file = JSON.parse(file)
  end
end
