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
    Shelter.create(shelter_params)
    redirect_to '/shelters'
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    shelter = Shelter.find(params[:id])
    shelter.update(shelter_params)
    redirect_to "/shelters/#{shelter.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to '/shelters'
  end

  def pet_index
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets
  end

  def pet_new

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
