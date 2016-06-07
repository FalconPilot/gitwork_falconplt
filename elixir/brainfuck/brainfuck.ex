defmodule BF do

  # Instructions parsing
  def parse(str) do
    parse(String.codepoints(str), [])
  end

  def parse([], acc) do
    Enum.reverse(acc)
  end

  def parse(["+"|t], acc) do
    parse(t, [:plus|acc])
  end

  def parse(["-"|t], acc) do
    parse(t, [:minus|acc])
  end

  def parse(["<"|t], acc) do
    parse(t, [:left|acc])
  end

  def parse([">"|t], acc) do
    parse(t, [:right|acc])
  end

  def parse(["."|t], acc) do
    parse(t, [:output|acc])
  end

  def parse([","|t], acc) do
    parse(t, [:input|acc])
  end

  def parse(["["|t], acc) do
    buf = parse(t, [])
    sub = Map.fetch!(buf, :lst)
    rst = Map.fetch!(buf, :tl)
    parse(rst, [{sub}|acc])
  end

  def parse(["]"|t], acc) do
    %{lst: Enum.reverse(acc), tl: t}
  end

  def parse([_h|t], acc) do
    parse(t, acc)
  end

end

IO.inspect BF.parse("+-+-[++[<>+-]--],.")
