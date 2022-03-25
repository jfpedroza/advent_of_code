input = IO.read(:eof) |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)

input
|> Stream.zip(tl(input))
|> Enum.count(fn {a, b} -> a < b end)
|> IO.inspect()
