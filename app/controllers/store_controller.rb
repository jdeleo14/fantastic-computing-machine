class StoreController < ApplicationController
  def index
        @products = Product.order(:title)
  end
  
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
end

