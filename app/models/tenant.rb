class Tenant < ActiveRecord::Base
	validates :first_name, :second_name, :rent_start_date, :presence => true
	validates :house_phone, :mobile_phone, :length => {:minimum => 9, :maximum => 15}, :format => { :with => /\A\S[0-9\+\/\(\)\s\-]*\z/i }, :allow_blank => true
	validates :email, :format => { :with => /\A[^@]+@[^@]+\z/ }, :allow_blank => true

	mount_uploader :tenancy_agreement, DocumentUploader

	belongs_to :property
	has_one :payment
end
