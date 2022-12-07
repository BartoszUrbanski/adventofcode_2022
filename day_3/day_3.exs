{:ok, body} = File.read("input.txt")
all_letters = Enum.concat(?a..?z, ?A..?Z) |> List.to_string |> String.graphemes
all_priorities = Enum.to_list(1..52)

letter_priority = Enum.zip(all_letters, all_priorities) |> Enum.into(%{})

find_same_letters = fn {text1, text2} ->
  String.graphemes(text2)
  |> Enum.map(&(if String.contains?(text1, &1) do &1 else nil end))
  |> Enum.reject(&is_nil/1)
  |> Enum.uniq
end

IO.write("Part one result = ")
IO.puts body
  |> String.split("\n", trim: true)
  |> Enum.map(&String.split_at(&1, div(String.length(&1),2)))
  |> Enum.flat_map(&find_same_letters.(&1))
  |> Enum.map(&letter_priority[&1])
  |> Enum.sum

#Part 2
find_same_letters = fn [text1, text2, text3] ->
  String.graphemes(text1 <> text2 <> text3)
  |> Enum.uniq
  |> Enum.map(&(if String.contains?(text1, &1) && String.contains?(text2, &1) && String.contains?(text3, &1) do &1 else nil end))
  |> Enum.reject(&is_nil/1)
  |> Enum.uniq
end

IO.write("Part two result = ")
IO.puts body
  |> String.split("\n", trim: true)
  |> Enum.chunk_every(3)
  |> Enum.flat_map(&find_same_letters.(&1))
  |> Enum.map(&letter_priority[&1])
  |> Enum.sum
