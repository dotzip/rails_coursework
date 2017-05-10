class Stack < ActiveRecord::Base
  belongs_to :room
  has_many :items
end
