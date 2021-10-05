class LeasingAgentsController < ApplicationController

  before_action :set_leasing_agent, only: [:show, :edit, :update, :destroy]


  # get list of properties
  def getproperties
    #@properties = Property.all
    @properties = Property.where('leasing_agent_id = ?', current_leasing_agent.id)
  end

  # GET /leasing_agents or /leasing_agents.json
  def index
    if admin_signed_in?
      redirect_to show_leasing_agents_path
      end
      @leasing_agents = LeasingAgent.all
  end

  # GET /leasing_agents/1 or /leasing_agents/1.json
  def show

  end

  # GET /leasing_agents/new
  def new
    @leasing_agent = LeasingAgent.new
  end

  # GET /leasing_agents/1/edit
  def edit
    @leasing_agent = LeasingAgent.find(params[:id])
  end

  # POST /leasing_agents or /leasing_agents.json
  def create
    @leasing_agent = LeasingAgent.new(leasing_agent_params)
    respond_to do |format|
      if @leasing_agent.save
        format.html { redirect_to @leasing_agent, notice: "Leasing agent was successfully created." }
        format.json { render :show, status: :created, location: @leasing_agent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @leasing_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leasing_agents/1 or /leasing_agents/1.json
  def update
    @leasing_agent = LeasingAgent.find(params[:id])
    respond_to do |format|
      if @leasing_agent.update(leasing_agent_params)
        format.html { redirect_to show_leasing_agents_path, notice: "Leasing agent was successfully updated." }
        format.json { render :show, status: :ok, location: @leasing_agent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @leasing_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leasing_agents/1 or /leasing_agents/1.json
  def destroy
    @leasing_agent.destroy
    respond_to do |format|
      format.html { redirect_to show_leasing_agents_path, notice: "Leasing agent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_leasing_agent
      @leasing_agent = LeasingAgent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def leasing_agent_params
      params.require(:leasing_agent).permit(:name, :password, :email, :phone_number)
    end
end
