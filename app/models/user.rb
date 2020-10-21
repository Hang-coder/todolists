class User < ActiveRecord::Base
	has_one :profile, dependent: :destroy
	has_many :todo_lists, dependent: :destroy
	has_many :todo_items, through: :todo_lists, source: :todo_items #, dependent: :delete
	validates :username, presence: true
	has_secure_password
	def get_completed_count
		User.find(self.id).todo_items.where(completed: true).count 
		# HV my code and syntax works: User.find(self.id).todo_items.where("completed= ?",true).count
		# 1 - many relationship, must be 1 user vs many items. Hence can not use User.all here 
		# note where can not work here, must use find
		#@customer = Customer.includes(:perks).where('perks.guessed = ?', true)
		#User.where(guest: [false, nil]).count
	end
end
