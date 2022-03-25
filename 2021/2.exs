input = IO.stream() |> Enum.map(&String.trim/1)

input
|> Enum.reduce({0, 0}, fn command, {pos, depth} ->
  case command do
    "forward " <> val ->
      {pos + String.to_integer(val), depth}

    "down " <> val ->
      {pos, depth + String.to_integer(val)}

    "up " <> val ->
      {pos, depth - String.to_integer(val)}
  end
end)
|> Tuple.product()
|> IO.inspect(label: "Part 1")

input
|> Enum.reduce({0, 0, 0}, fn command, {pos, depth, aim} ->
  case command do
    "forward " <> val ->
      val = String.to_integer(val)
      {pos + val, depth + aim * val, aim}

    "down " <> val ->
      {pos, depth, aim + String.to_integer(val)}

    "up " <> val ->
      {pos, depth, aim - String.to_integer(val)}
  end
end)
|> then(fn {pos, depth, _aim} -> pos * depth end)
|> IO.inspect(label: "Part 2")
