class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]
  before_action :set_projects, only: [:show]

  # GET /universities
  # GET /universities.json
  def index
    @universities = University.all
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    respond_to do |format|
      format.html
      format.xlsx {
        render xlsx: "show", filename: "#{@university.description}_infrastructures.xlsx"
      }
    end
  end

  # GET /universities/new
  def new
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
  end

  # POST /universities
  # POST /universities.json
  def create
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to universities_path, notice: 'University was successfully created.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to universities_path, notice: 'University was successfully updated.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    @university.destroy
    respond_to do |format|
      format.html { redirect_to universities_url, notice: 'University was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    def set_projects
      @projects = @university.projects.order('created_at desc')
      @for_bidding = @projects.where(status: 1).order('created_at desc')
      @ongoing = @projects.where(status: 2).order('created_at desc')
      @completed = @projects.where(status: 3).order('created_at desc')
      @funding = @projects.where(status: 4).order('created_at desc')
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:description)
    end
end
