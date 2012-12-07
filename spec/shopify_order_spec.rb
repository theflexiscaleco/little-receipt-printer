require 'rspec'
require './shopify_order'
require 'multi_json'

describe ShopifyOrder do
  before(:each) do
    @test_response = MultiJson.load(open('./spec/test_request_body.json'))
    @order = ShopifyOrder.new(@test_response)
  end
  it "should have a method missing for params" do
    @order.total_price.should == "239.94"
  end
  describe "full shipping address" do
    it "should assemble the test case well" do
      @order.full_shipping_address.should == "Steve Shipper\nShipping Company\n123 Shipping Street\nShippington\nK2P0S0\nUnited States"
    end
  end
end