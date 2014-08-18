require 'active_record'
require './lib/division'
require './lib/employee'
require './lib/project'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu
  loop do
    puts "Press 'a' to add an employee\nPress 'p' to add an employee to a project\nPress 'l' to list employees\nPress 'd' to list all your divisions\nPress 'le' to list all employes in a division\nPress 'x' to exit"
    user_input = gets.chomp
    if user_input == 'a'
      add_emp
    elsif user_input == 'l'
      list_emp
    elsif user_input == 'p'
      add_emp_to_proj
    elsif user_input == 'd'
      list_div
    elsif user_input == 'le'
      list_employees_in_div
    elsif user_input == 'x'
      puts 'Goodbye'
      exit
    else
      puts 'Not a valid option'
    end
  end
end

def add_emp
  puts 'What division is human slaving in?'
  user_input = gets.chomp
  new_div = Division.find_or_create_by(name: user_input)
  puts 'What is the human name?'
  user_input_two = gets.chomp
  new_emp = Employee.create({name: user_input_two, division_id: new_div.id})
  puts 'Slave added'
end

def list_emp
  puts 'Here are your employees'
  Employee.list_by_name
end

def list_div
  puts 'Here are your divisions'
  Division.list_by
end

def list_employees_in_div
  list_div
  puts "\n\n"
  puts "What division would you like to see?"
  puts "\n\n"
  user_choice = gets.chomp
  Employee.list_by_div(user_choice)
end

def add_emp_to_proj
  list_emp
  puts "\nWhat human are you referring to?\n"
  user_choice = gets.chomp
  puts "\nWhat project is this person working on?\n"
  user_project = gets.chomp
  new_emp = Employee.find_or_create_by(name: user_choice)
  new_proj = Project.find_or_create_by(name: user_project)
  new_emp.projects << new_proj
end




main_menu
