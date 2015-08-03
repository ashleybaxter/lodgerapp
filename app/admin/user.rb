ActiveAdmin.register User do
	permit_params :email, :password, :user_id

	index do
		column :email
		column :password
		column :user_id
	end

	form do |f|
		f.inputs "User Details" do
		f.inputs :email
		f.inputs :password
		end
	f.submit
	end

end
