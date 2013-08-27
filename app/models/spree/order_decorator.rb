module Spree
  Order.class_eval do
    has_one :affiliate_earning, :dependent => :destroy
  end
end
