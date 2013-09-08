require 'spec_helper'

describe Spree::HomeController do
  let(:user) { stub_model(Spree.user_class) }
  let(:order) { FactoryGirl.create(:order_with_totals) }

  before do
    controller.stub :try_spree_current_user => user
    controller.stub :current_order => order
    user.email = "test@test.com"
  end

  context "user navigates to app with an affiliate query parameter" do
    it "should set a cookie with the affiliate_id" do
      affiliate = stub_model(Spree.user_class)
      affiliate_id = affiliate.affiliate_id # this generates one if it doesn't yet exist
      
      spree_get :index, {affiliate_id: affiliate_id}
      expect(response.cookies[Spree::Config[:cookie_name]]).to eq(affiliate_id)
    end
  end
end
