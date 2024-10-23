defmodule TaskRanger do

  @spec sort(list(map()), number(), atom()) :: list(map())
  defp sort(data, limit, sorting_order) do
    data
    |> Enum.map(&Map.put(&1, :coefficient, (&1.duration / limit) * &1.value))
    |> Enum.sort_by(&Map.get(&1, :coefficient), sorting_order)
  end

  defp sum_of_duration(task_list) do
    Enum.sum(Enum.map(task_list, & &1.duration))
  end

  @spec rank(tuple())::list(map())
  def rank(data) do
    {task_list, time_limit} = data
    sorted_less_coeff = sort(task_list, time_limit, :asc)
    lack_of_time = sum_of_duration(task_list) - time_limit

    excessive_part = Enum.reduce_while(sorted_less_coeff, [],
      fn(task, list_extra_task) ->
        if (sum_of_duration(list_extra_task) + task.duration) <= lack_of_time do
          {:cont, [task | list_extra_task]}
        else
          {:halt, list_extra_task}
        end
      end
    )

    sorted_less_coeff -- excessive_part
    |> Enum.reverse()
    |> DataHandler.sanitize_output()
  end

end
