# Charcount module

defmodule Charcount do

  # Count characters
  def count(str) do
    count(String.codepoints(str), [])
  end

  def count([h|t], acc) do
    acc = replace(acc, h)
    count(t, acc)
  end

  def count([], acc) do
    Enum.reverse(acc)
  end

  # Replace accumulator
  def replace(list, char) do
    replace(list, char, list, 0)
  end

  def replace([], char, acc, _index) do
    map = %{character: char, count: 1}
    [map|acc]
  end

  def replace([h|t], char, acc, index) do
    if Map.fetch!(h, :character) == char do
      old = Enum.at(acc, index)
      new = %{character: char, count: Map.fetch!(old, :count) + 1}
      acc = List.delete_at(acc, index)
      acc = List.insert_at(acc, index, new)
    else
      replace(t, char, acc, index + 1)
    end
  end

end

IO.inspect Charcount.count("Coucou")
