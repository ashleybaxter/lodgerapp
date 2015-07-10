class TenantsController < ApplicationController
	def new
		@tenant = Tenant.new
	end

	def create
		@tenant = Tenant.new(app_params)
		if @tenant.save
			redirect_to tenant_path(@tenant)
		else
			render('new')
		end
	end

	def show
		@tenant = Tenant.find(params[:id])
	end

	def edit
		@tenant = Tenant.find(params[:id])
	end

	def update
		@tenant = Tenant.find(params[:id])
		if @tenant.update_attributes(app_params)
			redirect_to (@tenant)
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
		@tenants = Tenant.all
	end

	def app_params
		params.require(:tenant).permit(:first_name, :second_name, :house_phone, :mobile_phone, :email, :rent_start_date, :rent_frequency, :tenancy_term, :tenancy_agreement)
	end
end
