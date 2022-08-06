module OrdersHelper
  def order_num
    if @orders.empty?
      "SSS-1"
    else
      "SSS-#{Order.last.id + 1}"
    end
  end

  def order_status(order)
    if order.status
      content_tag(:span, "Incomplete", class: 'text-red-500 bg-red-100 text-xs')
    else
      content_tag(:span, "Complete", class: 'text-green-500 bg-green-100 text-xs')
    end
  end
end
