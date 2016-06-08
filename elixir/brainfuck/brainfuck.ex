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

  # Interpreter
  def compute(list) do
    mem = Enum.map(1..30000, fn _ ->
      0
    end)
    compute(list, mem, 0)
  end

  def compute([:plus|t], mem, index) do
    val = Enum.at(mem, index)
    if val >= 255 do
      val = -1
    end
    mem = List.delete_at(mem, index)
    mem = List.insert_at(mem, index, val + 1)
    compute(t, mem, index)
  end

  def compute([:minus|t], mem, index) do
    val = Enum.at(mem, index)
    if val <= 0 do
      val = 256
    end
    mem = List.delete_at(mem, index)
    mem = List.insert_at(mem, index, val - 1)
    compute(t, mem, index)
  end

  def compute([:left|t], mem, index) do
    if index <= 0 do
      index = 30000
    end
    compute(t, mem, index - 1)
  end

  def compute([:right|t], mem, index) do
    if index >= 29999 do
      index = -1
    end
    compute(t, mem, index + 1)
  end

  def compute([{tuple}|t], mem, index) do
    data = compute(tuple, mem, index)
    mem = Map.fetch!(data, :mem)
    index = Map.fetch!(data, :index)
    val = Enum.at(mem, index)
    if val == 0 do
      compute(t, mem, index)
    else
      compute([{tuple}|t], mem, index)
    end
  end

  def compute([:output|t], mem, index) do
    data = Enum.at(mem, index)
    IO.write(<<data>>)
    compute(t, mem, index)
  end

  def compute([], mem, index) do
    %{mem: mem, index: index}
  end

end

str = String.strip(IO.gets("Enter BF code here :\n"))
list = BF.parse(str)
BF.compute(list)
