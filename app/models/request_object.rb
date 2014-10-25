class RequestObject < ActiveRecord::Base
	validates :cycle, numericality:{ only_integer: true, greater_than: 0 }
	validates :instance_id, numericality:{ only_integer: true, greater_than_or_equal_to: 0 }
	validates :class_name, presence: true
	validate  :available_class, :existing_instance

	def available_class
		return class_name.constantize.new
	rescue NameError
		errors.add(:class_name, "is not available")
		return false
	else
		return false
	end

	def existing_instance
		return class_name.constantize.getInstance(instance_id) &&
							class_name.constantize.include?(DMC_callable)
	rescue NameError
		errors.add(:class_name, "is not available")
		return false
	rescue NoMethodError
		errors.add(:instance_id, "dose not exist")
		return false
	else
		return false
	end

	def referInstance()
		return class_name.constantize.getInstance(instance_id)
	rescue NameError, NoMethodError => exist
		logger.warn(
			"[Waring] Skip calling a method of #{request_object.inspect}. #{ex.message}")
		return nil
	else
		logger.fatal("[fatal] Skip #{request_object.inspect} cause of #{ex.message}")
		return nil
	end
end
