class Employee < ActiveRecord::Base
  belongs_to(:division)
  has_and_belongs_to_many(:projects)

  def self.list_by_name
    self.all.each do |emp|
     puts emp.name
    end
  end

  def self.list_by_div(div_name)
    division = Division.find_by name: div_name
    result = division.id
    Employee.all.each do |emp|
      if emp.division_id == result
        puts emp.name
    end
  end
end
end

