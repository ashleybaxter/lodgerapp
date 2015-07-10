module PropertiesHelper
	def full_address(property)
		[property.house_number, property.street_address, property.street_address_two, property.city, property.postcode.upcase,].compact.reject(&:blank?).join(', ')
	end

	def list_tenant_by_name(property)
		property.tenants.all().map {|p| link_to("#{p.first_name} #{p.second_name}", property_tenant_path(property, p), {:class => "tenant"} )}.to_sentence.html_safe
	end
end
