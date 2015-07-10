class Property < ActiveRecord::Base
	belongs_to :user
	has_many :tenants
	
	validates 	:postcode, :city, :presence => true

	validate :at_least_one_street_address_must_be_present

	private

	def at_least_one_street_address_must_be_present
		if (street_address.blank? and street_address_two.blank?)
			errors.add(:base, "At least one street address must be present")
		end
	end
end
