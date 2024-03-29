class Status < ActiveRecord::Base
  attr_accessible :brick, :content, :user_id
  belongs_to :user
  validates :user_id, :presence => true
end
