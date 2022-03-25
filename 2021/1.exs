input = IO.stream() |> Stream.map(&String.trim/1) |> Enum.map(&String.to_integer/1)

input
|> Stream.zip(Stream.drop(input, 1))
|> Enum.count(fn {a, b} -> a < b end)
|> IO.inspect(label: "Part 1")

0..2
|> Stream.map(&Stream.drop(input, &1))
|> Stream.zip_with(fn [a, b, c] -> a + b + c end)
|> then(&Stream.zip(&1, Stream.drop(&1, 1)))
|> Enum.count(fn {a, b} -> a < b end)
|> IO.inspect(label: "Part 2")
