require 'rails_helper'

RSpec.describe Firm do
  firm = Firm.new(name:"cow_one", step: 10, stock: 0)
  subject { firm }

  context "when firm is valid" do
		it { expect(firm).to be_valid }
		it { expect(firm.getId).to eq firm.id }   
		end

	context "when firm is invalid" do
	  it "cause name is not unique" do
			same_name_firm = firm.dup
			same_name_firm.name.downcase! 
			same_name_firm.save
	    expect(firm).not_to be_valid
	  end
	  it "cause name is not present" do
			firm = Firm.new(name:"  ", step: 10, stock: 0)
			expect(firm).not_to be_valid
	  end
	  it "cause step is float" do
			firm = Firm.new(name:"cow_one", step: 0.1, stock: 0)
			expect(firm).not_to be_valid
	  end
	  it "cause step is not positive" do
			firm = Firm.new(name:"cow_one", step: 0, stock: 0)
			expect(firm).not_to be_valid
	  end
	  it "cause stock is float" do
			firm = Firm.new(name:"cow_one", step: 10, stock: 0.1)
			expect(firm).not_to be_valid
	  end
	  it "cause stock is negative" do
			firm = Firm.new(name:"cow_one", step: 10, stock: -1)
			expect(firm).not_to be_valid
	  end
	end
end