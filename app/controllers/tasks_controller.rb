class TasksController < ApplicationController
  before_action :search_items, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit; end

  def update
    @tasks.update(task_params)

    redirect_to tasks_path
  end

  def destroy
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def search_items
    @tasks = Task.find(params['id'])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
