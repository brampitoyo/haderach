drwho = Universe.find_by_name("doctor_who")

Word.create(:word => "tardis", :universe_id => drwho.id, :is_acronym => true) 
##############
## Proper Nouns
%(dalek skaro kaled rani yeti sontarans silurians 
autons
).each{|word| Word.create(:word => word, :universe_id => drwho.id, :is_name => true)}

#############
## Regular words
%(
).each{|word| Word.create(:word => word, :universe_id => drwho.id)}