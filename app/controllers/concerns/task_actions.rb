module TaskActions
  def task_generator_process
    get_process_list
  end

  private

  def get_process_list
    IO.foreach("|top -b -n 1") { |line| puts line  }
  end
end
