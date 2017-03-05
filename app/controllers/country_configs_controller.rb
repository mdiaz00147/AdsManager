class CountryConfigsController < ApplicationController
	def index
		@ads = CountryConfig.all
		render json: @ads
	end
	def show

		country_ads	=	CountryConfig.find_by(iso:params[:iso])
		country_ads_fix	=	[]
		if country_ads.ads_relations.present?
			country_ads.ads_relations.each do |country|
				country_ad 	=	country.ad
				country_ads_fix << country_ad
			end
		else
			default_ads	=	Ad.all
			country_ads_fix = default_ads
		end

		return render json: country_ads_fix

	end
end
