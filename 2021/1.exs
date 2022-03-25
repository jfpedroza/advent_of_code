input = IO.read(:eof) |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)

input
|> Stream.zip(tl(input))
|> Enum.count(fn {a, b} -> a < b end)
|> IO.inspect(label: "Part 1")

Stream.zip([input, tl(input), tl(tl(input))])
|> Enum.map(fn {a, b, c} -> a + b + c end)
|> then(&Stream.zip(&1, tl(&1)))
|> Enum.count(fn {a, b} -> a < b end)
|> IO.inspect(label: "Part 2")
