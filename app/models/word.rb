class Word < ActiveRecord::Base
  belongs_to  :universe
  
  validates_presence_of :word, :universe_id
  before_validation :downcase!
    
  def rand(chance = 10)
    rand(chance) == 1 ? proper : word
  end
  
  def proper
    @word ||= is_name ? word.titleize : word.humanize.downcase
  end
  
  def address
    @link ||= website ? website : "http://en.wikipedia.org/wiki/#{word}"
  end

  private
  
  def downcase!
    self.word = word.downcase.gsub(' ','_') if attribute_present?("word")
  end
  
end
