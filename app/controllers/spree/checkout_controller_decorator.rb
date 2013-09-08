module Spree
  CheckoutController.class_eval do

    private

    def process_affiliate_earning
      affiliate_id_from_cookie = cookies[Spree::Config[:cookie_name]]
      # make sure we aren't giving ourself credit
      if affiliate_id_from_cookie && 
          affiliate_id_from_cookie != @order.user.affiliate_id
        @order.affiliate_earning = AffiliateEarning.create
        earning = @order.affiliate_earning
        earning.order_id = @order.id
        earning.user_id = (Spree::User.where(:affiliate_id => affiliate_id_from_cookie).first).id rescue nil
        earning.status = "created"
        earning.percentage = Spree::Config[:referal_incentive]
        earning.amount = (Spree::Config[:referal_incentive].to_d/100) * @order.total

        earning.save
      end
    end

    def completion_route
      process_affiliate_earning
      token_order_path(@order, @order.token)
    end

  end
end
