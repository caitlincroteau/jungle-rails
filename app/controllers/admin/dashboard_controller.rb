class Admin::DashboardController < ApplicationController
  
    http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  def show
    @num_of_products = Product.count
    @num_of_categories = Category.count
  end
end
