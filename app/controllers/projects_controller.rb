class ProjectsController < ApplicationController
before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, flash[:notice] = "Project was successfully created." }
        format.js {}
      else
        format.html { render :new, flash[:notice] = "Invalid form submission. Please fill out the form." }
        format.js {}
      end
    end
  end

  def show
    @commentable = @project
    @comment = @project.comments.build
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to(@project, notice: 'Project was successfully updated.') }
        format.json { render :show, status: :ok, location: @project }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :tech, :description, :image)
    end
end
