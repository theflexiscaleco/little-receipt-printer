$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'sinatra/base'
require 'oj'
require 'multi_json'
require 'lib/shopify_order'
require 'typhoeus'

class LpReceipt < Sinatra::Base
  set :public_folder, File.dirname(__FILE__) + '/static'
  post '/print_receipt' do
    order_details = MultiJson.load(request.body.read.to_s)
    order = ShopifyOrder.new(order_details)
    Typhoeus.post("http://remote.bergcloud.com/playground/direct_print/#{ENV['PRINTER_KEY']}", :params => {:html => order.to_html(request.host)})
    "OK"
  end

  get '/test' do
    order_details = MultiJson.load(open('spec/test_request_body.json'))
    order = ShopifyOrder.new(order_details)
    order.to_html(request.host)
  end
end