module TenantsHelper
	def full_name(tenant)
  	tenant.first_name + " " + tenant.second_name
	end
end
