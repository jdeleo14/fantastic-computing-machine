class OrdersController < ApplicationController
skip_before_action :authorize, only: [:new, :create]
include CurrentCart
before_action :set_cart, only: [:new, :create]
# key new method os the ensure_cart_isnt_empty 
before_action :ensure_cart_isnt_empty, only: :new
before_action :set_order, only: [:show, :edit, :update, :destroy]

# GET /orders
#...

 private
 def ensure_cart_isnt_empty
 if @cart.line_items.empty?
 redirect_to store_index_url, notice: 'Your cart is empty'
 end
 end
end

