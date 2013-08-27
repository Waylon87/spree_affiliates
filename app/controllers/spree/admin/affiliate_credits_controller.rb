module Spree
  class Admin::AffiliateCreditsController  < Admin::ResourceController
    belongs_to 'spree/user'

    #  def new
    #    user = User.find(params[:user_id])
    #    @affiliate_credit = user.affiliate_credits.new
    #    render :action => :new, :layout => false
    #  end

    def update
      if params[:affiliate_credit]['amount'].blank? || params[:affiliate_credit]['comment'].blank?
        flash[:error] = t("affiliate_credit_add_error")
        redirect_to :back
      else
        @user = Spree.user_class.find(params[:affiliate_credit]['user_id'])
        affiliate_credit = @user.affiliate_credits.new
        if affiliate_credit.update_attributes(params[:affiliate_credit])
          flash[:notice] = t("account_updated")
        end
        redirect_to admin_user_url(@user)
      end
    end
  end
end
