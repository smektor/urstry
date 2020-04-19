class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @projects = Project.where(user_id: current_user)
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

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

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Congratulation! Project modified."
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find(params[:id])
  end

end
