require 'spec_helper'

describe Employee do
  it "belongs to a division" do
    division = Division.create({:name => "water"})
    employee = Employee.create({:name => "Jack Doe", :division_id => division.id})
    division.employees.should eq [employee]
  end
end
