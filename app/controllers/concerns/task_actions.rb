module TaskActions
  def task_generator_process
    @tasks = []
    @process_list = []

    get_process_list
    format_process
  end

  def task_destroy_process
    task_kill
    redirect_to home_root_path
  end

  private

  def create_process(process)
    data = process_data(process)
    return if data[:command] === 'top'

    @tasks << data
  end

  def task_kill
    system("kill -9 #{params[:id]}")
  end

  def clean_old_tasks
    Task.destroy_all
  end

  def get_process_list
    IO.foreach("|top -b -n 1") { |line| @process_list << line.split  }
  end

  def format_process
    @process_list.each_with_index do |p, index|
      create_process(p) if index > 6
    end
  end

  def process_data(process)
    {
      process_id: process[0],
      command: process[11],
      user: process[1],
      virtual_size: process[4],
      resident_size: process[5],
      shareable_size: process[6],
      state: process[7],
      cpu_percentage: process[8].split(',').join('.').to_f * 2,
      memory_percentage: process[9].split(',').join('.').to_f * 2
    }
  end

end
