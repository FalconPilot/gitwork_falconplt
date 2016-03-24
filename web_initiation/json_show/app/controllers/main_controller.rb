#encoding: utf-8
class MainController < ApplicationController
  helper_method :jshow
  def index
  end

  def jshow
    @file = File.read("#{Rails.root}/app/assets/javascripts/products.json")
    json_hash = JSON.parse(@file)
    buffer = ""
    json_hash.each do |elem|
      buffer += "#{elem.to_s.gsub(/[^0-9A-Za-z]/, '')}#{content_tag(:br)}".html_safe
    end
    #buffer = buffer.gsub(/[^0-9A-Za-z]/, '')
    render :html => buffer
  end
end
