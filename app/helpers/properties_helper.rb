module PropertiesHelper
	def full_address(property)
		[property.house_number, property.street_address, property.street_address_two, property.city, property.postcode.upcase,].compact.reject(&:blank?).join(', ')
	end
end
