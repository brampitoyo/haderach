# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

%w(
science_fiction fantasy
).each{|genre| Genre.create(:name => genre) }

scifi = Genre.find_by_name("Science Fiction")

%w(
pern xanth elenium mists_of_avalon buffy_the_vampire_slayer narnia
).each{ |univ| Universe.create(:name => univ, :genre_id => Genre.find_by_name("Fantasy")) }

%w(
star_wars star_trek doctor_who Ender's_game ringworld discworld wild_cards
).each{ |univ| Universe.create(:name => univ, :genre_id => scifi.id) }

Universe.create(:name => "dune", :website => "http://en.wikipedia.org/wiki/Dune_(novel)", :genre_id => scifi.id)
Universe.create(:name => "foundation", :website => "http://en.wikipedia.org/wiki/Foundation_series", :genre_id => scifi.id)

dune = Universe.find_by_name("dune")

%w(shaddam corrino atreides alia ghanima leto muad'dib kwisatz_haderach bene_gesserit dune arrakis arrakeen
harkonnen hasimir_fenring glossu_rabban feyd-rautha lankiveil geidi_prime caladan bela_tegeuse chakobsa
dictum_familia ecaz faufreluches fedaykin zensunni fremen galach ginaz hagel harmonthep shai-hulud ichwan_bedwine
istislah ix richese mahdi usul misr missionaria_protectiva mudir_nahya panoplia_propheticus poritrin
quizara_tafwid salusa_secundus sardaukar sayyadina shah-nama shaitan tleilax wallach jacurutu sabiha muriz wadquiyas
gurney_halleck palimbasha farad'n tyekanik irulan javid tabr habbanya_ridge bashar ziarenka chusuk gamont grumman
quizariat shadout_mapes Tupali varota combine_honnete_ober_advancer_mercantiles bhotani_jib lisan_al-gaib
).each{ |word| Word.create(:word => word, :universe_id => dune.id, :is_name => true) }

%w(choam).each{ |word| Word.create(:word => word, :universe_id => dune.id, :is_acronym => true) }

%w(seitch melange mentat fremkit adab akarso alam_al-mithal al-lat ampoliros amtal auliya aumas ayat bakka baliset
baradye baraka bindu prana_bindu bled burseg butlerian caid chaumas chaumurky cherem cielago
crysknife derch distrans elacca el-sayal erg fai filt-plug fiqh fremkit geyrat ghafla giudichar graben gridex_plane
gom_jabbar guild haiiiii-yoh harj hajra heighliner hiereg ibad ijaz ikhut-eigh ilm inkvine jubba kanly karama khala
kindjal kiswa kitab_al-ibar krimskell kull_wahad kulon lazgun liban literjon maker mantene maula metaglass mihna 
minimic_film mish_mish mushtamal musky naib nezhoni noukkers opafire ornithopter out-freyn plasteel pleniscenta prana
proces_verbal pundi pyons pyretic portyguls qanat qirtaiba rachag razzia recaths sepkit rimwall sadus sapho sarfa
schlag selamlik semuta servok shah-nama shari-a shigawire sihaya sirat solari solido sondagi tahaddi taqwa ulema
umma uroshnor batigh varite wali weirding yali suk bi-la_kaifa
).each{ |word| Word.create(:word => word, :universe_id => dune.id)}

Word.create(:word => "tardis", :universe_id => Universe.find_by_name("doctor_who"), :is_acronym => true) 
%(dalek skaro kaled rani yeti sontarans silurians autons).each{ Word.create(:word => "tardis", :universe_id => Universe.find_by_name("doctor_who"), :is_name => true)}