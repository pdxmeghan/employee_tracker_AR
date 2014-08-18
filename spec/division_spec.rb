require 'spec_helper'

describe Division do
  it "has many employees" do
    division = Division.create({:name => "water"})
    employee1 = Employee.create({:name => "Jack Doe", :division_id => division.id})
    employee2 = Employee.create({:name => "John Doe", :division_id => division.id})
    division.employees.should eq [employee1, employee2]
  end
end
