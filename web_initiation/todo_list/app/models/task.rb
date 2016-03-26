class Task < ActiveRecord::Base
  def done?
    if @done.nil?
      return "Pending"
    else
      return "Completed"
    end
  end

  def switch
    @done = true
  end

  def obj
    return self
  end
end
