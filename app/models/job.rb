class Job < ApplicationRecord
  belongs_to :category
  has_many :orders_jobs, dependent: :destroy
  has_many :orders, through: :orders_jobs

  validates :title, presence: true
end
