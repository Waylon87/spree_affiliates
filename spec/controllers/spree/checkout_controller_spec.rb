require 'spec_helper'

describe Spree::CheckoutController do
  let(:token) { 'some_token' }
  let(:user) { stub_model(Spree::User) }
  let(:order) { FactoryGirl.create(:order_with_totals) }
  let(:affiliate) { FactoryGirl.create(:user) } # we need a persisted record for our code to process the earning

  before do
    controller.stub :try_spree_current_user => user
    controller.stub :spree_current_user => user
    controller.stub :current_order => order
    
    order.stub :confirmation_required? => true
    order.update_column(:state, "confirm")
    order.stub :user => user
    # An order requires a payment to reach the complete state
    # This is because payment_required? is true on the order
    create(:payment, :amount => order.total, :order => order)
    order.payments.reload
    user.email = "test@test.com"
  end

  context "affiliate completes an order" do
    it "affiliate should not get credit for order" do

      affiliate_id = user.affiliate_id # this generates one if it doesn't yet exist

      spree_post :update, {:state => "confirm", :affiliate_id => affiliate_id}, { :access_token => token }
      affiliate.affiliate_earnings.should be_empty
    end
  end

  context "affiliate order is completed" do
    it "affiliate should get credit for order" do
      affiliate_id = affiliate.affiliate_id # this generates one if it doesn't yet exist

      spree_post :update, {:state => "confirm", :affiliate_id => affiliate_id}, { :access_token => token }
      affiliate.affiliate_earnings.should_not be_empty
    end
  end
end
