class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    
  end

  def index
    if params[:search].present?

      search = params[:search].present? ? params[:search] : "*"
      where = {}

      # if params[:date_filter].present?
      #   where[:date] = {
      #     gte: DateTime.strptime(params[:date_filter], '%m/%d/%Y %l:%M %p').beginning_of_day,
      #     lte: DateTime.strptime(params[:date_filter], '%m/%d/%Y %l:%M %p').end_of_day
      #   }
      # end

      @for_bidding = Project.search( search, where: where.merge(status: 1), order: {created_at: :desc}, misspellings: false )
      @ongoing = Project.search( search, where: where.merge(status: 2), order: {created_at: :desc}, misspellings: false )
      @completed = Project.search( search, where: where.merge(status: 3), order: {created_at: :desc}, misspellings: false )

      # @ingoing = Document.search( search, where: where.merge(:outgoing => false), order: {created_at: :desc}, misspellings: false )
      # @outgoing = Document.search( search, where: where.merge(:outgoing => true), order: {created_at: :desc}, misspellings: false )

    else
      @projects = Project.all
      @for_bidding = @projects.where(status: 1).order('created_at desc')
      @ongoing = @projects.where(status: 2).order('created_at desc')
      @completed = @projects.where(status: 3).order('created_at desc')
    end

    respond_to do |format|
      format.html
      format.xlsx {
        render xlsx: "index", filename: "documents_spreadsheet.xlsx"
      }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project_attachment = @project.project_attachments.build
  end

  # GET /projects/1/edit
  def edit
    @project_attachment = @project.project_attachments.build unless @project.project_attachments.count > 0
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        if params[:project_attachments]
          params[:project_attachments].each do |a|
            # logger.debug "New attachment: #{a}"
            @project_attachment = @project.project_attachments.create!(attachment: a)
          end
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        if params[:project_attachments]
          params[:project_attachments].each do |a|
            # logger.debug "New attachment: #{a}"
            @project_attachment = @project.project_attachments.create!(attachment: a)
          end
        end
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recent_updates
    @activities = PublicActivity::Activity.all.order('created_at desc').limit(30)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(
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
        :university_id,
        project_attachments_attributes: [
          :id,
          :attachment,
          :project_id,
          :_destroy
        ],
        project_funds_attributes: [
          :id,
          :source,
          :amount,
          :project_id,
          :_destroy
        ]
      )
    end
end
