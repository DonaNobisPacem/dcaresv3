class ProjectFundsController < ApplicationController
  before_action :set_project_fund, only: [:show, :edit, :update, :destroy]

  # GET /project_funds
  # GET /project_funds.json
  def index
    @project_funds = ProjectFund.all
  end

  # GET /project_funds/1
  # GET /project_funds/1.json
  def show
  end

  # GET /project_funds/new
  def new
    @project_fund = ProjectFund.new
  end

  # GET /project_funds/1/edit
  def edit
  end

  # POST /project_funds
  # POST /project_funds.json
  def create
    @project_fund = ProjectFund.new(project_fund_params)

    respond_to do |format|
      if @project_fund.save
        format.html { redirect_to @project_fund, notice: 'Project fund was successfully created.' }
        format.json { render :show, status: :created, location: @project_fund }
      else
        format.html { render :new }
        format.json { render json: @project_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_funds/1
  # PATCH/PUT /project_funds/1.json
  def update
    respond_to do |format|
      if @project_fund.update(project_fund_params)
        format.html { redirect_to @project_fund, notice: 'Project fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_fund }
      else
        format.html { render :edit }
        format.json { render json: @project_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_funds/1
  # DELETE /project_funds/1.json
  def destroy
    @project_fund.destroy
    respond_to do |format|
      format.html { redirect_to project_funds_url, notice: 'Project fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_fund
      @project_fund = ProjectFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_fund_params
      params.require(:project_fund).permit(:source, :amount, :project_id)
    end
end
