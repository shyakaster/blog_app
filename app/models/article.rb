class Article < ActiveRecord::Base
  validates :body, :title ,presence: true
  default_scope {order(:created_at => :desc)}
  belongs_to :user

  has_many :comments, dependent: :destroy
end
