module OrdersHelper
  def order_num
    "SSS-#{Order.last.id + 1}"
  end
end
