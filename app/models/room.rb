class Room < ActiveRecord::Base
	has_many :stacks, dependent: :destroy
    
    validates :name, :volume, presence: true
end
