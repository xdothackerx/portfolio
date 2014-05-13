class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project was successfully created."
      redirect_to @project
    else
      # TODO
    end
  end

  def project_params
    params.require(:project).permit(:title, :tech, :description)
  end

  def show
    @project = Project.find(params[:id])
  end

end
