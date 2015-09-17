class Article < ActiveRecord::Base
  validates :body, :title ,presence: true
end
