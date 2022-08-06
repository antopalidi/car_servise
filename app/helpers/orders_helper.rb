module OrdersHelper
  def order_num
    if @orders.empty?
      "SSS-1"
    else
      "SSS-#{Order.last.id + 1}"
    end
  end
end
