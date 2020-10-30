module TaskActions
  def task_generator_process
    get_process_list
  end

  private

  def get_process_list
    test = []
    IO.foreach("|top -b -n 1") { |line| test << line  }
  end
end
