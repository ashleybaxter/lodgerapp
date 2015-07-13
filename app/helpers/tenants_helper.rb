module TenantsHelper
	def full_name(tenant)
		tenant.first_name + " " + tenant.second_name
	end

	def property_address(tenant)
		[tenant.property.house_number, tenant.property.street_address, tenant.property.street_address_two, tenant.property.city, tenant.property.postcode.upcase].compact.reject(&:blank?).join(', ')
	end

	def deposit_true_or_false(tenant)
		if tenant.payment.deposit_received == true
			"Yes"
		else
			"No"
		end
	end
end
