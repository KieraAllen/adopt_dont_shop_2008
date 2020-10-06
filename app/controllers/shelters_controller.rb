class SheltersController < ApplicationController

  def new
  end

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def create
    @shelter = Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  private
  def shelter_params
    params.permit(:name,
                  :address,
                  :city,
                  :state,
                  :zip
                  )
  end
end
