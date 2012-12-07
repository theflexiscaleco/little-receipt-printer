require 'rspec'
require './lib/shopify_order'
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
      @order.full_shipping_address.should == "Steve Shipper<br />Shipping Company<br />123 Shipping Street<br />Shippington<br />K2P0S0"
    end
  end
  describe "to html" do
    it "should create some html with the person's name in" do
      @order.to_html.should include('Steve Shipper')
    end
  end
end