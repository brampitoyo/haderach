class Phrase < ActiveRecord::Base
  belongs_to  :universe
  
  validates_presence_of :phrase, :universe_id
  before_validation :downcase!
  
  def self.some
    Phrase.find :all, :order => 'random()', :offset => (Phrase.count * rand).to_i, :limit => rand(100) + 1
  end

  def self.one
    Phrase.find :all, :order => 'random()', :offset => (Phrase.count * rand).to_i, :limit => 1
  end

  def proper
    titleize ? phrase.titleize : phrase.humanize
  end
  
  def address
    website ? website : "http://google.com/search?q=#{proper}"
  end
  private
  
  def downcase!
    self.phrase = phrase.downcase.gsub(' ','_') if attribute_present?("phrase")
  end
end
