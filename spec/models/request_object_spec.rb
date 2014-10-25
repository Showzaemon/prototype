require 'rails_helper'

class Aclass
	include DMC_callable
  def self.getInstance(instance_id)
  	return Aclass.new
  end
end


describe RequestObject do
  ro = RequestObject.new(cycle:3, class_name: "Aclass", instance_id: 7)

	context "when request object is valid" do
	  it { expect(ro).to be_valid }
	end

	context "when requst object is invalid" do
	  it "cause cycle is not integer" do
			ro = RequestObject.new(cycle:0.1, class_name: "Aclass", instance_id: 7)
			expect(ro).not_to be_valid
	  end
	  it "when cycle is not positive" do
			ro = RequestObject.new(cycle:0, class_name: "Aclass", instance_id: 7)
			expect(ro).not_to be_valid
	  end
	  it "when class_name is not present" do
			ro = RequestObject.new(cycle:3, class_name: "  ", instance_id: 7)
			expect(ro).not_to be_valid
	  end
	  it "when instance_id is not integer" do
			ro = RequestObject.new(cycle:3, class_name: "Aclass", instance_id: 0.7)
			expect(ro).not_to be_valid
	  end
	  it "when instance_id is negative" do
			ro = RequestObject.new(cycle:3, class_name: "Aclass", instance_id: -7)
			expect(ro).not_to be_valid
	  end
	end
end