class TasksController < ApplicationController

  def index
    # should fetch all tasks, and a view should loop over these to display them, like in the screenshot below.
    # List of the Tasks
    @tasks = Task.all
  end

  def show
    # We now have a list of tasks, and we would like to click on the task title and navigate to a new page, displaying the details of this task.
    @task = Task.find(params[:id])
  end

   def new
    @new_task = Task.new
  end

  def create
    #
    @task = Task.create(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    # We want to be able to edit a task, changing its title, its details and especially marking it as completed.
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end

 def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
