class UserStoriesController < ApplicationController
  before_action :find_project, only: [:index, :show, :new, :create, :destroy]

  def index
    @user_stories = @project.user_stories.all
  end

  def show
    @user_story = @project.user_stories.find(params[:id])
  end

  def new
    @user_story = @project.user_stories.new
  end

  def create
    @user_story = @project.user_stories.create(user_story_params)

    if @user_story.save
      redirect_to project_user_story_path(@project, @user_story), notice: "User story created."
    else
      render 'new'
    end
  end

  def destroy
    @user_story = @project.user_stories.find(params[:id])
    @user_story.destroy
    redirect_to project_path(@project)
  end

  private

  def user_story_params
    params.require(:user_story).permit(:actor, :goal, :reason, :criteria, :priority)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
