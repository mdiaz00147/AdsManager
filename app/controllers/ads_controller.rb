class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :update, :destroy]

  # GET /ads
  def index
    @ads = Ad.all.order(id: :desc)
    render json: @ads
  end

  # GET /ads/1
  def show
    render json: @ad
  end

  # POST /ads
  def create
    # return render json: params
    @ad = Ad.new(ad_params)
    if @ad.save
      render json: @ad, status: :created, location: @ad
    else
      render json: @ad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ads/1
  def update
    if @ad.update(ad_params)
      render json: @ad
    else
      render json: @ad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ads/1
  def destroy
    @ad.destroy
  end
  def index_count
    # ads  = Ad.all
    # ads_fixed = []
    # ads.each do |ad|
    #   ad_count  = ad.ads_hits.count
    #   ad  = ad.attributes
    #   ad['total'] = ad_count
    #   ads_fixed << ad
    # end
    # render json: ads_fixed
    ad_select  = Ad.joins(:ads_hits).all.group(:id).group(:name,:source).size

    render json: Array(ad_select)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ad_params
      params.permit(:name, :source)
    end
end
