class Tenant < ActiveRecord::Base
	include IceCube

	validates :first_name, :second_name, :rent_start_date, :presence => true
	validates :house_phone, :mobile_phone, :length => {:minimum => 9, :maximum => 15}, :format => { :with => /\A\S[0-9\+\/\(\)\s\-]*\z/i }, :allow_blank => true
	validates :email, :format => { :with => /\A[^@]+@[^@]+\z/ }, :allow_blank => true

	mount_uploader :tenancy_agreement, DocumentUploader

	belongs_to :property
	has_one :payment

	accepts_nested_attributes_for :payment

	def weekly
		schedule = Schedule.new(rent_start_date.to_time)
		schedule.add_recurrence_time(Time.now)
		schedule.add_recurrence_rule Rule.weekly
		schedule.next_occurrence
	end

	def fortnightly
		schedule = Schedule.new(rent_start_date.to_time)
		schedule.add_recurrence_time(Time.now)
		schedule.add_recurrence_rule Rule.weekly(2)
		schedule.next_occurrence
	end

	def monthly
		schedule = Schedule.new(rent_start_date.to_time)
		schedule.add_recurrence_time(Time.now)
		schedule.add_recurrence_rule Rule.monthly
		schedule.next_occurrence
	end

	def rent_due_in_weekly
		d = Date.today.strftime("%e %b %Y")
		e = weekly.strftime("%e %b %Y")
		now = Date.parse(d)
		due = Date.parse(e)
		(due - now).to_i		
	end

	def rent_due_in
		d = Date.today.strftime("%e %b %Y")
		e = fortnightly.strftime("%e %b %Y")
		now = Date.parse(d)
		due = Date.parse(e)
		(due - now).to_i
	end
    
	def rent_due_in_monthly
		d = Date.today.strftime("%e %b %Y")
		e = monthly.strftime("%e %b %Y")
		now = Date.parse(d)
		due = Date.parse(e)
		(due - now).to_i
	end
end
