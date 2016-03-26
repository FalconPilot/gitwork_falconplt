class Task < ActiveRecord::Base

  def done?(reverse=false)
    valtrue = "Completed"
    valfalse = "Pending"
    if !reverse
      return (self.done ? valtrue : valfalse)
    else
      return (self.done ? valfalse : valtrue)
    end
  end

end
