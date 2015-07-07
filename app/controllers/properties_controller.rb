class PropertiesController < ApplicationController
	def index
		@properties = Property.all
	end

	def new
		@property = Property.new
	end

	def create
		@property = Property.new(app_params)
		if @property.save
			flash[:success] = render_to_body(:partial => "shared/new_property_message")
			redirect_to @property
		else
			render('new')
		end
	end

	def show
		@property = Property.find(params[:id])
	end

	def edit
		@property = Property.find(params[:id])
	end

	def update
		@property = Property.find(params[:id])
		if @property.update_attributes(app_params)
			redirect_to(@property)
		else
			render('edit')
		end
	end

	def destroy
		@property = Property.find(params[:id])
		@property.destroy
		redirect_to properties_path
	end

	def app_params
		params.require(:property).permit(:house_number, :street_address, :street_address_two, :city, :postcode)
	end
end