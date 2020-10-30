class TaskManagerController < ApplicationController
  include TaskActions

  def index
    task_generator_process

    @tasks = Task.order('cpu_percentage DESC')
  end

  def destroy
    @task = Task.find(params[:id])

    task_destroy_process
  end
end
