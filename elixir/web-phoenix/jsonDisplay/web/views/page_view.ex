defmodule JsonDisplay.PageView do
  use JsonDisplay.Web, :view

  # Get map keys
  def map_keys(map) do
    Map.keys map
  end

  # Check if a string is a valid URL
  def check_url(str) do
    check_url String.codepoints(str), ""
  end

  def check_url([h|t], acc) do
    if (String.contains?(acc, "ptth") && String.contains?(acc, "//:")) do
      true
    else
      check_url t, Enum.join([h, acc])
    end
  end

  def check_url([], _acc) do
    false
  end

end
