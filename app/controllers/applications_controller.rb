class ApplicationsController < ApplicationController
  before_action :set_application, only: %i[ show edit update destroy ]

  # GET /applications or /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1 or /applications/1.json
  def show
    @applicant = Applicant.where('applicant_id = ?', @application.applicant_id)
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications or /applications.json
  def create
    create_params = application_params
    if applicant_signed_in?
      create_params[:applicant_id] = current_applicant.id
    end
    @application = Application.new(create_params)

    respond_to do |format|
      if @application.save
        format.html { redirect_to @application, notice: "Application was successfully created." }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: "Application was successfully updated." }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      if admin_signed_in?
        format.html { redirect_to show_applications_path, notice: "Application was successfully destroyed." }
      else
        format.html { redirect_to applicants_path, notice: "Application was successfully destroyed." }
      end
      format.json { head :no_content }
    end
  end

  def checkin
    if leasing_agent_signed_in? || admin_signed_in?
      @applicant = Applicant.find(params[:applicant_id])
      @property= Property.find(params[:property_id])
      @application = Application.find(params[:id])
      @application.status='Approved'
      @applications=Application.all
      @applications.each do |application|
        if application.id!=@application
          application.status='Rejected'
          application.save
        end
      end
      @application = Application.find(params[:id])
      @application.status='Approved'
      @application.save
      @property.availability=false
      @property.occupied_by=Applicant.find(params[:applicant_id]).name
      @property.occupant_id= Applicant.find(params[:applicant_id]).id
      @property.save
      respond_to do |format|
          format.html { redirect_to @property, notice: "Application is checkedin successfully." }
      end
    end
  end

  def checkout
    if leasing_agent_signed_in? || admin_signed_in?
      @property = Property.find(params[:property_id])
      @property.availability = true
      @property.occupied_by = "none"
      @property.occupant_id = 0
      @property.save
      respond_to do |format|
        format.html { redirect_to @property, notice: "Application is checked out successfully." }
      end
    end
  end

  def reject
    if leasing_agent_signed_in? || admin_signed_in?
      @applicant = Applicant.find(params[:applicant_id])
      @property= Property.find(params[:property_id])
      @application = Application.find(params[:id])
      if @application.status=="Approved"
        @property.availability=true
        @property.occupied_by="none"
        @property.occupant_id = 0
        @property.save
      end
      @application.status="Rejected"
      @application.save
      respond_to do |format|
        format.html { redirect_to @property, notice: "Application is rejected successfully." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:date_time, :status, :property_id, :applicant_id)
    end
end
