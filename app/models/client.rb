class Client < ActiveRecord::Base
	has_many :items, dependent: :destroy
    
    validates :entity_name, :bank_details, presence: true
    validates :entity_name, length: {in: 0..64}
end
