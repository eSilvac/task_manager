class TaskManagerController < ApplicationController
  include TaskActions

  def index
    task_generator_process
  end

  def destroy
    task_destroy_process
  end
end
