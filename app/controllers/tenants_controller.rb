class TenantsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@property = Property.find(params[:property_id])
		@tenant = @property.tenants.build
	end

	def create
		@property = Property.find(params[:property_id])
		@tenant = @property.tenants.build(app_params)
		if @tenant.save
			redirect_to property_tenant_path(@property, @tenant)
		else
			render('new')
		end
	end

	def show
		@property = Property.find(params[:property_id])
		@tenant = @property.tenants.find(params[:id])
	end

	def edit
		@property = Property.find(params[:property_id])
		@tenant = @property.tenants.find(params[:id])
	end

	def update
		@property = Property.find(params[:property_id])
		@tenant = @property.tenants.find(params[:id])
		if @tenant.update_attributes(app_params)
			redirect_to property_tenant_path(@property, @tenant)
		else
			render('edit')
		end
	end

	def destroy
		@tenant = Tenant.find(params[:id])
		@tenant.destroy
		redirect_to properties_path
	end

	def current
		@tenants = current_user.tenants.all
	end

	def app_params
		params.require(:tenant).permit(:first_name, :second_name, :house_phone, :mobile_phone, :email, :rent_start_date, :rent_frequency, :tenancy_term, :tenancy_agreement)
	end
end
