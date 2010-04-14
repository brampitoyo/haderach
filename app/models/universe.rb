class Universe < ActiveRecord::Base
  belongs_to  :genre
  belongs_to  :manager, :class_name => 'Helper'
  
  has_many :helper_universes
  has_many :helpers, :through => :helper_universes
  has_many :words
  has_many :phrases
  
  validates_presence_of :name, :genre_id
  before_validation :downcase!

  def self.one
    Universe.find(:all, :order => 'random()', :offset => (Universe.count * rand).to_i, :limit => 1)[0]
  end

  def address
    website ? website : "http://en.wikipedia.org/wiki/#{name}"
  end
  
  def words
    Word.find_all_by_universe_id(self.id)
  end
  
  def count
    words ? words.count : 0
  end
  
  def proper
    name.titleize
  end
  
  private
  
  def downcase!
    self.name = name.downcase.gsub(' ','_') if attribute_present?("name")
  end
  
end
