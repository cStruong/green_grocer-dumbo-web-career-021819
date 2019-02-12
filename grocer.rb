require 'pry'

def consolidate_cart(cart)
  finalHash = {}
  
  cart.each {|itemHash|
    itemHash.each {|item, infoHash|
      if finalHash[item] == nil
        finalHash[item] = infoHash
        finalHash[item][:count] = 1
      else
        finalHash[item][:count] += 1
      end
    }
  }
  
  return finalHash
end


def apply_coupons(cart, coupons)
  coupons.each {|coupon|
    couponItem = coupon[:item]

    if cart[couponItem] != nil
      cart[couponItem][:count] -= coupon[:num]
      discountItem = "#{couponItem} W/COUPON"
      
      
      if cart[discountItem] == nil
        cart[discountItem] = {
          price: coupon[:cost],
          clearance: cart[couponItem][:clearance],
          count: 1
        }
      else
        cart[discountItem][:count] += 1
      end
    end
  }
  
  return cart
end

def apply_clearance(cart)
  cart.each {|item, infoHash|
    if infoHash[:clearance] == true
      totalDiscount = infoHash[:price] * 0.2
      newPrice = infoHash[:price] - totalDiscount
      cart[item][:price] = newPrice
    end
  }
  
  return cart
end

def checkout(cart, coupons)
  # code here
end
