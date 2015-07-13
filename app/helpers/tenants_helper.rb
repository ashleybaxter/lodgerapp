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

def rent_due_class_weekly(tenant)
	if tenant.rent_due_in_weekly <= 7
		return 'rent due-soon'
	else
		return 'rent due-distance'
	end
end

def rent_due_class_monthly(tenant)
	if tenant.rent_due_in_monthly <= 7
		return 'rent due-soon'
	else
		return 'rent due-distance'
	end
end
  
def rent_due_class_fortnightly(tenant)
	if tenant.rent_due_in_fortnightly <= 7
		return 'rent due-soon'
	else
		return 'rent due-distance'
	end
end
end
