class ApplicationController < ActionController::API
	before_action :add_allow_credentials_headers
  	def index
  		count_ad	=	CountryConfig.joins(:ads_hits).select(:id,:iso,:name,'ads_hits.ad_id as ad_id','ads_hits.country_config_id as country_config_id').all.group(:iso)
  		# .select(:id,'lessons.start_date as start_date',:options,:user_id,:lesson_id)
  		render json: count_ad.size
  	end
	def add_allow_credentials_headers                                                                                                                                                                                                                                                        
		response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'                                                                                                                                                                                                     
		response.headers['Access-Control-Allow-Credentials'] = 'true'     
	end

	def options                                                                                                                                                                                                                                                                              
		head :status => 200, :'Access-Control-Allow-Headers' => 'accept, content-type'                                                                                                                                                                                                         
	end
end
