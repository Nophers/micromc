class Controller
  def initialize
    @view = View.new
    @tasks = []
  end

  def add
    description = @view.ask_user_for_description
    task = Task.new(description)
    @tasks << task
  end

  def remove 
    index = @view.ask_user_for_index
    @tasks.delete_at(index)
  end

  def list
    @view.display(@tasks)
  end

  def find
    description = @view.ask_user_for_description
    task = @tasks.find { |task| task.description == description }
    @view.display([task])
  end

  def mark_as_done
    index = @view.ask_user_for_index
    @tasks[index].mark_as_done!
  end

  def purge
    @tasks.delete_if { |task| task.done? }
  end
end