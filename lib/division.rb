class Division < ActiveRecord::Base
  has_many(:employees)

  def self.list_by
    self.all.each do |div|
     puts div.name
    end
  end
end
