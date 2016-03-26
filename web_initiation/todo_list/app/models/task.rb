class Task < ActiveRecord::Base
  def done?(reverse=false)
    if !reverse
      return (@done.nil? ? "Pending" : "Completed")
    else
      return (@done.nil? ? "Completed" : "Pending")
    end
  end

  def switch
    @done = true
  end

  def obj
    return self
  end
end
