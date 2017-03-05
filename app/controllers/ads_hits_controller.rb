class AdsHitsController < ApplicationController
  before_action :set_ads_hit, only: [:show, :update, :destroy]

  # GET /ads_hits
  def index
    @ads_hits = AdsHit.all

    render json: @ads_hits
  end

  # GET /ads_hits/1
  def show
    render json: @ads_hit
  end

  # POST /ads_hits
  def create
    @ads_hit = AdsHit.new(ads_hit_params)

    if @ads_hit.save
      render json: @ads_hit, status: :created, location: @ads_hit
    else
      render json: @ads_hit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ads_hits/1
  def update
    if @ads_hit.update(ads_hit_params)
      render json: @ads_hit
    else
      render json: @ads_hit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ads_hits/1
  def destroy
    @ads_hit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ads_hit
      @ads_hit = AdsHit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ads_hit_params
      params.permit(:ad_id, :country_config_id)
    end
end
