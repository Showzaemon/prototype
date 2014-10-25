class Firm < ActiveRecord::Base
	include DMC_callable
	before_save { self.name.downcase! }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :step, numericality:{ only_integer: true, greater_than: 0 }
	validates :stock, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
end
