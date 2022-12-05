{:ok, body} = File.read("input.txt")

IO.write("Part one result = ")
IO.puts body
  |> String.split("\n\n", trim: true)
  |> Enum.map(&String.split(&1, "\n", trim: true))
  |> Enum.map(&(Enum.map(&1, fn(x) -> String.to_integer(x) end)))
  |> Enum.map(&(Enum.sum(&1)))
  |> Enum.max

#Part 2
IO.write("Part one result = ")
IO.puts body
  |> String.split("\n\n", trim: true)
  |> Enum.map(&String.split(&1, "\n", trim: true))
  |> Enum.map(&(Enum.map(&1, fn(x) -> String.to_integer(x) end)))
  |> Enum.map(&(Enum.sum(&1)))
  |> Enum.sort
  |> Enum.reverse
  |> Enum.take(3)
  |> Enum.sum
