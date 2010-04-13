class Genre < ActiveRecord::Base
  has_many  :universes
  
  validates_presence_of :name
  before_validation :titleize!

  private
  
  def titleize!
    self.name = name.titleize if attribute_present?("name")
  end
  

end
