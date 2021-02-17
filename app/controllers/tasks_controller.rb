class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end

  def new
    @new_task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:title, :details, :completed)

    @new_task = Task.new(task_params)

    @new_task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task_params = params.require(:task).permit(:title, :details, :completed)
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end
end
