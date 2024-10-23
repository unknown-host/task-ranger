defmodule TaskRanger do
  #@spec ranging(list(map()), atom()) :: list(map())
   def ranging(data, limit, sorting_order) do
    data
    |> Enum.map(&Map.put(&1, :coefficient, (&1.duration / limit) * &1.value))
    |> Enum.sort_by(&Map.get(&1, :coefficient), sorting_order)
  end

  # @spec ranging_with_limit(list(map()), integer()) :: list(map())
  # def ranging_with_limit(data, total_time) do
  #   data
  #   |> ranging(:asc)
  #   |> Enum.reduce_while([], fn task, acc ->
  #     acc_duration = fn -> Enum.sum(Enum.map(acc, & &1.duration)) end
  #     if acc_duration.() + task.duration <= total_time do
  #   |> Enum.reduce_while([], fn(task, acc) ->
  #     acc_duration = fn -> Enum.sum(Enum.map(acc, & &1.duration)) end
  #     if acc_duration.() + task.duration <= lack_time do
  #       {:cont, [task | acc]}
  #     else
  #       {:halt, acc}
  #   end
  #   |> (& sorting_data -- &1).()
  # end


  # @spec ranging(tuple())::list(Task.t())
  def ranging_with_lack_of_time({list, numb}) do
    {task_list, time_limit} = {list, numb}
    tasks_duration_sum = task_list |> Enum.map(& &1.duration) |> Enum.sum
    lack_of_time = time_limit - tasks_duration_sum


  end
end
