class ComponentAttachmentsController < ApplicationController
  before_action :set_component_attachment, only: [:show, :edit, :update, :destroy]

  # GET /component_attachments
  # GET /component_attachments.json
  def index
    @component_attachments = ComponentAttachment.all
  end

  # GET /component_attachments/1
  # GET /component_attachments/1.json
  def show
  end

  # GET /component_attachments/new
  def new
    @component_attachment = ComponentAttachment.new
  end

  # GET /component_attachments/1/edit
  def edit
  end

  # POST /component_attachments
  # POST /component_attachments.json
  def create
    @component_attachment = ComponentAttachment.new(component_attachment_params)

    respond_to do |format|
      if @component_attachment.save
        format.html { redirect_to @component_attachment, notice: 'Component attachment was successfully created.' }
        format.json { render :show, status: :created, location: @component_attachment }
      else
        format.html { render :new }
        format.json { render json: @component_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /component_attachments/1
  # PATCH/PUT /component_attachments/1.json
  def update
    respond_to do |format|
      if @component_attachment.update(component_attachment_params)
        format.html { redirect_to @component_attachment, notice: 'Component attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @component_attachment }
      else
        format.html { render :edit }
        format.json { render json: @component_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /component_attachments/1
  # DELETE /component_attachments/1.json
  def destroy
    @component_attachment.destroy
    respond_to do |format|
      format.html { redirect_to component_attachments_url, notice: 'Component attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_component_attachment
      @component_attachment = ComponentAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def component_attachment_params
      params.require(:component_attachment).permit(:attachment, :component_id)
    end
end
