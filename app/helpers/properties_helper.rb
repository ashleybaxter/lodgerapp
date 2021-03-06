module PropertiesHelper
	def full_address(property)
		[property.house_number, property.street_address, property.street_address_two, property.city, property.postcode.upcase,].compact.reject(&:blank?).join(', ')
	end

	def list_tenant_by_name(property)
		property.tenants.all().map {|p| link_to("#{p.first_name} #{p.second_name}", property_tenant_path(property, p), {:class => "tenant"} )}.to_sentence.html_safe
	end

	def tenant_rent_weekly(property)
	for tenant in property.tenants
		if tenant.rent_frequency == "weekly"
		a = tenant.rent_due_in_weekly
		end
	end
 	a
	end

	def tenant_rent_fortnightly(property)
	for tenant in property.tenants.reject
		if tenant.rent_frequency == "fortnightly"
		a = tenant.rent_due_in_fortnightly
		end
	end
	a
	end

	def tenant_rent_monthly(property)
	for tenant in property.tenants.reject
		if tenant.rent_frequency == "monthly"
		a = tenant.rent_due_in_monthly
		end
	end
	a
	end
	def tenant_rent_min(property)
		[tenant_rent_weekly(property), tenant_rent_fortnightly(property), tenant_rent_monthly(property)].compact.min
	end

	def rent_class(property)
		if tenant_rent_min(property) <= 7
		return 'rent due-soon'
		else
		return 'rent due-distance'
	end
	end

	def vacant_count(property)
		current_user.properties.count - occupied_count(property)
	end

	def occupied_count(property)
		current_user.tenants.where("tenants.id IS NOT NULL").count
	end
end
