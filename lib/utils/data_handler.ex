defmodule DataHandler do
  @moduledoc """
  TODO: Load data from json file and convert it to list of maps.of valid numbers.

  defp pos_num(i), do: is_integer(i) and i > -1
  defp validate(data=[%{id: _, time: _, value: _} | _]) do
    #Enum.all?(data, &is_map/0) and
    Enum.all?(data, fn map ->
      Enum.all?(map, fn {_key, value} -> pos_num(value) end)
    end)
  end
  """
  @spec sanitize_output(list(map()), list(atom())) :: list(map())
  def sanitize_output(result, keys) do
    Enum.map(result, &Map.drop(&1, keys))
  end
  # @spec sanitize_output(list(map())) :: list(map())
  def sanitize_output(result), do: sanitize_output(result, [:coefficient])

end
