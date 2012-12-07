require 'erubis'

class ShopifyOrder
  attr_accessor :params
  def initialize(params)
    @params = params
  end
  
  def full_shipping_address
    ['name', 'company', 'address1', 'address2', 'city', 'zip'].collect { |address_part|
      shipping_address[address_part]
    }.compact.join("<br />")
  end
  
  def to_html(host='http://localhost')
    template = Erubis::Eruby.new(File.read("print.html.erb"))
    template.result(:order => self, :host => host)
  end
  
  def method_missing(meth, *args, &block)
    if @params.has_key?(meth.to_s)
      @params[meth.to_s]
    else
      super
    end
  end
end