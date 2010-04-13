class Phrase < ActiveRecord::Base
  belongs_to  :universe
  
  validates_presence_of :phrase, :universe_id
  before_validation :downcase!
  
  def proper
    @phrase ||= titleize ? phrase.titleize : phrase.humanize
  end
  
  def address
    @address ||= website ? website : "http://google.com/search?q=#{proper}"
  end
  private
  
  def downcase!
    self.phrase = phrase.downcase.gsub(' ','_') if attribute_present?("phrase")
  end
end
