class Ad < ApplicationRecord
	has_many :ads_hits
	has_many :ads_relations
end
