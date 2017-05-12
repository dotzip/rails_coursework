class Room < ActiveRecord::Base
	has_many :stacks, dependent: :destroy
end
