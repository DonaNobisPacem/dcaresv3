class ComponentFundsController < ApplicationController
  before_action :set_component_fund, only: [:show, :edit, :update, :destroy]

  # GET /component_funds
  # GET /component_funds.json
  def index
    @component_funds = ComponentFund.all
  end

  # GET /component_funds/1
  # GET /component_funds/1.json
  def show
  end

  # GET /component_funds/new
  def new
    @component_fund = ComponentFund.new
  end

  # GET /component_funds/1/edit
  def edit
  end

  # POST /component_funds
  # POST /component_funds.json
  def create
    @component_fund = ComponentFund.new(component_fund_params)

    respond_to do |format|
      if @component_fund.save
        format.html { redirect_to @component_fund, notice: 'Component fund was successfully created.' }
        format.json { render :show, status: :created, location: @component_fund }
      else
        format.html { render :new }
        format.json { render json: @component_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_funds/1
  # PATCH/PUT /component_funds/1.json
  def update
    respond_to do |format|
      if @component_fund.update(component_fund_params)
        format.html { redirect_to @component_fund, notice: 'Component fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @component_fund }
      else
        format.html { render :edit }
        format.json { render json: @component_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_funds/1
  # DELETE /component_funds/1.json
  def destroy
    @component_fund.destroy
    respond_to do |format|
      format.html { redirect_to component_funds_url, notice: 'Component fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_fund
      @component_fund = ComponentFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_fund_params
      params.require(:component_fund).permit(:source, :amount, :component_id)
    end
end
