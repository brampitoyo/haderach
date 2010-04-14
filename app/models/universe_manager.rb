class UniverseManager < ActiveRecord::Base
  belongs_to  :manager
  belongs_to  :universe
end
