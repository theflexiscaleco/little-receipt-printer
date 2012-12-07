require 'sinatra/base'
class LpReceipt < Sinatra::Base
  post '/print_receipt' do
    puts "hello?"
    puts params
  end
end