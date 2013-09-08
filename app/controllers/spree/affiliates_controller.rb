module Spree
  class AffiliatesController  < Spree::StoreController
    rescue_from  Errno::ENOENT, :with => :render_404

    def show_details
      @user = spree_current_user
      if @user.nil?
        @user = @user_session.record
      end
    end

    def request_payment
      Spree::AffiliateMailer.request_payment(spree_current_user).deliver
      flash[:notice] = t('request_sent')
      redirect_to :back
    end

    def delete_cookie
      cookies.delete Spree::Config[:cookie_name]
      puts 'cookie deleted'
    end

    def pay_user
      affiliate_earning_ids = params[:affiliate_earning]
      affiliate_credit_ids = params[:affiliate_credit]
      user = params[:user]
      
      AffiliatePayment.new do |payment|
        payment.affiliate_user_id = user["id"]
        payment.user_id = spree_current_user.id
        payment.amount = user["total_earnings"].to_d
        payment.save

        if affiliate_earning_ids && affiliate_earning_ids.values
          affiliate_earning_ids.values.each do |earning_id|
            earning = AffiliateEarning.find(earning_id)
            earning.affiliate_payment = payment
            earning.status = "paid"
            earning.save
          end
        end

        if affiliate_credit_ids && affiliate_credit_ids.values
          affiliate_credit_ids.values.each do |credit_id|
            credit = AffiliateCredit.find(credit_id)
            credit.affiliate_payment = payment
            credit.status = "paid"
            credit.save
          end
        end        
      end
      flash[:notice] = t('payment_processed')
      redirect_to :back
    end
  end
end
