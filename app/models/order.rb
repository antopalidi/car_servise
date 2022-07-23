class Order < ApplicationRecord
  belongs_to :worker
  has_many :orders_jobs, dependent: :destroy
  has_many :jobs, through: :orders_jobs

  validates :client_name, presence: true
  validates :client_phone, presence: true

  scope :filter_by_client, -> { order(:client_name) }
  scope :filter_by_desc, -> { order(created_at: :desc) }
  scope :filter_by_asc, -> { order(created_at: :asc) }

  def unique_categories(jobs)
    jobs.map { |item| item.category.title }.uniq
  end
end
