class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :show, :update, :destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project created."
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def update
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
