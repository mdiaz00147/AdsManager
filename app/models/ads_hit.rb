class AdsHit < ApplicationRecord
	belongs_to :ad
	belongs_to :country_config
end
