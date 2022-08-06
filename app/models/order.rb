class Order < ApplicationRecord
  belongs_to :worker
  has_many :orders_jobs, dependent: :destroy
  has_many :jobs, through: :orders_jobs

  validates :client_name, presence: true
  validates :client_phone, presence: true

  scope :filter_by_client_name, -> { order(client_name: :asc) }
  scope :filter_by_desc, -> { order(created_at: :desc) }
  scope :filter_by_asc, -> { order(created_at: :asc) }

  def unique_categories(jobs)
    jobs.map { |item| item.category.title }.uniq
  end

  def self.search_client(params)
    params[:query].blank? ? all : where(
      "client_name LIKE ?", "%#{sanitize_sql_like(params[:query])}%"
    )
  end

  def self.search_by_worker(search)
    where("worker_id = ?", search)
  end

  def self.search_by_category(search)
    category = Category.where("id = ?", search)
    category[0].jobs.map { |s| return s.orders }
  end

end
