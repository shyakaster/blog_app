class Article < ActiveRecord::Base
  validates :body, :title ,presence: true
  default_scope {order(:created_at => :desc)}
end
