class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property = Property.find(params[:id])
    @applications = Application.where('property_id = ?', @property.id)
  end

  def moveout
    @property = Property.find(params[:property_id])
    @property.availability = true
    @property.occupied_by = 'none'
    @property.occupant_id = 0
    @property.save
    respond_to do |format|
      format.html { redirect_to applicants_path, notice: "Moved out successfully." }
    end
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties or /properties.json
  def create
    create_params = property_params
    if leasing_agent_signed_in?
    create_params[:leasing_agent_id] = current_leasing_agent.id
    end

    @property = Property.new(create_params)


    respond_to do |format|
      if @property.save
        if leasing_agent_signed_in?
          format.html { redirect_to @property, notice: "Property was successfully created." }
          format.json { render :showproperties, status: :created, location: @property }
        else
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      if admin_signed_in?
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      else
        format.html { redirect_to getproperties_path, notice: "Property was successfully destroyed." }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      # params.require(:property).permit(:name, :address, :size, :features_pets, :features_laundry, :features_parking, :terms_available, :earliest_start_time, :application_fee, :monthly_rent, :occupied_by, :leasing_agent_id)
      params.require(:property).permit(:name, :address, :size, :features_pets, :features_laundry, :features_parking, :terms_available, :earliest_start_time, :application_fee, :monthly_rent, :occupied_by, :availability, :leasing_agent_id)
    end
end
