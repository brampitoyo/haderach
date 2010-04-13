class Universe < ActiveRecord::Base
  belongs_to  :genre
  
  has_many :words
  has_many :phrases
  
  validates_presence_of :name, :genre_id
  before_validation :downcase!
  
  def address
    @link ||= website ? website : "http://en.wikipedia.org/wiki/#{name}"
  end
  
  def proper
    @name ||= name.titleize
  end
  
  private
  
  def downcase!
    self.name = name.downcase.gsub(' ','_') if attribute_present?("name")
  end
  
end
