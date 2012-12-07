require 'sinatra/base'
class LpReceipt < Sinatra::Base
  post '/print_receipt' do
    puts params
  end
end