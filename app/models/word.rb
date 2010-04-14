class Word < ActiveRecord::Base
  belongs_to  :universe
  
  validates_presence_of :word, :universe_id
  before_validation :downcase!
    
  def self.some
    Word.find :all, :order => 'random()', :offset => (Word.count * rand).to_i, :limit => rand(100) + 1
  end

  def self.one
    Word.find(:all, :order => 'random()', :offset => (Word.count * rand).to_i, :limit => 1)[0]
  end
  
  def self.paragraph(min = 20)
    para = self.some
    while para.count < min
      para += self.some
    end
    para[0].is_name = true #Make it titleize this once to start the paragraph, but don't save to the DB
    para
  end
  
  def self.universes(para)
    universes = []
    para.each{|word| universes << word.universe}
    universes.uniq
  end
  
  def proper
    if is_acronym
      word.upcase
    elsif is_name
      word.titleize
    else
      word.humanize.downcase
    end
  end
  
  def address
    website ? website : "http://en.wikipedia.org/wiki/#{word}"
  end

  private
  
  def downcase!
    self.word = word.downcase.gsub(' ','_') if attribute_present?("word")
  end
  
end
