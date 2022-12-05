{:ok, body} = File.read("input.txt")
game_to_score = %{
  "A X" => 4,
  "A Y" => 8,
  "A Z" => 3,
  "B X" => 1,
  "B Y" => 5,
  "B Z" => 9,
  "C X" => 7,
  "C Y" => 2,
  "C Z" => 6
}

IO.write("Part one result = ")
IO.puts body
  |> String.split("\n", trim: true)
  |> Enum.map(&game_to_score[&1])
  |> Enum.sum

#Part 2
game_strategy_to_score = %{
  "X" => %{"A" => 3, "B" => 1, "C" => 2},
  "Y" => %{"A" => 4, "B" => 5, "C" => 6},
  "Z" => %{"A" => 8, "B" => 9, "C" => 7}
}

IO.write("Part two result = ")
IO.puts body
|> String.split("\n", trim: true)
|> Enum.map(&get_in(game_strategy_to_score, [String.last(&1), String.first(&1)]))
|> Enum.sum
