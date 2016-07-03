defmodule TodoList.PageView do
  use TodoList.Web, :view

  def get_status(code) do
    case code do
      false -> "Pending"
      true  -> "Completed"
      _ -> "Undefined"
    end
  end

  def switch_message(code) do
    Enum.join(["Switch to ", get_status(!code)])
  end

  def get_class(code) do
    Enum.join(["task-status ", String.downcase(get_status(code))])
  end

  def get_route(route, id) do
    str = Integer.to_string(id)
    Enum.join([route, str])
  end

end
