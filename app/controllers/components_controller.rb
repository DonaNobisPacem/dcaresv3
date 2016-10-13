class ComponentsController < ApplicationController
  before_action :set_component, only: [:show, :edit, :update, :destroy]

  # GET /components
  # GET /components.json
  def index
    @components = Component.all
    @for_bidding = @components.where(status: 1).order('created_at desc')
    @ongoing = @components.where(status: 2).order('created_at desc')
    @completed = @components.where(status: 3).order('created_at desc')
    @funding = @components.where(status: 4).order('created_at desc')
  end

  # GET /components/1
  # GET /components/1.json
  def show
  end

  # GET /components/new
  def new
    @component = Component.new
    @component_attachment = @component.component_attachments.build
  end

  # GET /components/1/edit
  def edit
    @component_attachment = @component.component_attachments.build unless @component.component_attachments.count > 0
  end

  # POST /components
  # POST /components.json
  def create
    @component = Component.new(component_params)

    respond_to do |format|
      if @component.save
        if params[:component_attachments]
          params[:component_attachments].each do |a|
            # logger.debug "New attachment: #{a}"
            @component_attachment = @component.component_attachments.create!(attachment: a)
          end
        end
        format.html { redirect_to @component, notice: 'Component was successfully created.' }
        format.json { render :show, status: :created, location: @component }
      else
        format.html { render :new }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /components/1
  # PATCH/PUT /components/1.json
  def update
    respond_to do |format|
      if @component.update(component_params)
        if params[:component_attachments]
          params[:component_attachments].each do |a|
            # logger.debug "New attachment: #{a}"
            @component_attachment = @component.component_attachments.create!(attachment: a)
          end
        end
        format.html { redirect_to @component, notice: 'Component was successfully updated.' }
        format.json { render :show, status: :ok, location: @component }
      else
        format.html { render :edit }
        format.json { render json: @component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.json
  def destroy
    @component.destroy
    respond_to do |format|
      format.html { redirect_to components_url, notice: 'Component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component
      @component = Component.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_params
      params.require(:component).permit(
        :project_id, 
        :title, 
        :abc, 
        :status, 
        :classification, 
        :bidding_status, 
        :contractor, 
        :progress, 
        :tdc, 
        :noa, 
        :ntp, 
        :adc, 
        :cost, 
        :remarks,
        component_attachments_attributes: [
          :id,
          :attachment,
          :component_id,
          :_destroy
        ],
        component_funds_attributes: [
          :id,
          :source,
          :amount,
          :component_id,
          :_destroy
        ]
      )
    end
end
