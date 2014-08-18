require 'spec_helper'

describe Project do
  it "has many employees" do
    project = Project.create({:name => "water"})
    employee1 = Employee.create({:name => "Jack Doe"})
    employee1.projects << project
    employee2 = Employee.create({:name => "John Doe"})
    employee2.projects << project
    project.employees.should eq [employee1, employee2]
  end
end
