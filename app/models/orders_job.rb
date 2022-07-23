class OrdersJob < ApplicationRecord
  belongs_to :order
  belongs_to :job
end
