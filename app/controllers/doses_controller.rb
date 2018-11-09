class DosesController < ApplicationController

  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :set_cocktail, only: [:new, :create]

  def index       # GET /restaurants
  end

  def show          # GET /restaurants/:id
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
