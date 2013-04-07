class Status < ActiveRecord::Base
  attr_accessible :brick, :content
  belongs_to :user
end
