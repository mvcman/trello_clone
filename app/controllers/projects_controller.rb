class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append("projects", partial: "projects/project", locals: { project: @project})
          ]
        end 
      else
        format.html { render :new, status: :unprocessable_entity }
      end 
    end 
  end 

  def edit 
  end 

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(@project, partial: "projects/project", locals: { project: @project})
          ]
        end 
      else
        format.html { render :new, status: :unprocessable_entity }
      end 
    end 
  end

  def destroy
    @project.destroy 
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@project)
        ]
      end 
    end 
  end

  private

  def project_params
    params.require(:project).permit(:name, :description) 
  end 

  def set_project
    @project = Project.find(params[:id])
  end 
end
