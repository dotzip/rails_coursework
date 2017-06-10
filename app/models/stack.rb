class Stack < ActiveRecord::Base
  belongs_to :room
  has_many :items, dependent: :destroy
    
    validates :number, :places, :width, :height, :depth, :max_total_load, presence: true

  accepts_nested_attributes_for :room,
	allow_destroy: true	
end
