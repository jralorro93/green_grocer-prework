require 'pry'

def consolidate_cart(cart)
  con_cart = {}
  
  cart.each_with_index do |item, index|
    item.each do |food, info|
      if con_cart[food]
        con_cart[food][:count] += 1 
      else 
        con_cart[food] = info
        con_cart[food][:count] = 1 
      end 
    end 
  end 
  con_cart
end 



# def apply_coupons(cart, coupons)
#   final = {}
  
#   cart.each do |item, info|
#     coupons.each do |coupon|
#       if item == coupon[:item] && info[:count] >= coupon[:num]
#         info[:count] = info[:count] - coupon[:num]
#         if final["#{item} W/ COUPON"]
#           final["#{item} W/ COUPON"][:count] +=1 
#         else 
#           final["#{item} W/ COUPON"] = {:price => info[:price], :clearance => info[:clearance], :count => 1}
#         end 
#       end 
#     end 
#     final[item] = info 
#   end 
#   final
# 

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    coupon_item = coupon[:item]
    if cart[coupon_item] && cart[coupon_item][:count] >= coupon[:num]
      if cart["#{coupon_item} W/ COUPON"]
        cart["#{coupon_item} W/ COUPON"][:count] += 1 
      else 
        cart["#{coupon_item} W/ COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{coupon_item} W/ COUPON"] [:clearance] = cart[coupon_item][:clearance]
          binding.pry
      end 
      cart[coupon_item][:count] -= coupon[:num]
    end 
  end 
  cart
end 

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
