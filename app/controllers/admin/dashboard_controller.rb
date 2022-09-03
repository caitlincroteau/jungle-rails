class Admin::DashboardController < ApplicationController
  def show
    @num_of_products = Product.count
    @num_of_categories = Category.count
  end
end
