defmodule TaskRangerTest do
  use ExUnit.Case
  defp test_data() do
    [
      {
        [
          %{id: 1, duration: 1, value: 1},
          %{id: 2, duration: 3, value: 2},
          %{id: 3, duration: 4, value: 3}
        ],
        7
      },
      {
        [
          %{id: 1, duration: 1, value: 1},
          %{id: 2, duration: 2, value: 3},
          %{id: 3, duration: 3, value: 4}
        ],
        5
      }
    ]
  end

  test "here are results" do
    assert TaskRanger.rank(List.first(test_data())) ==
      [
        %{id: 3, duration: 4, value: 3},
        %{id: 2, duration: 3, value: 2}
      ]
    assert TaskRanger.rank(List.last(test_data())) ==
      [
        %{id: 3, duration: 3, value: 4},
        %{id: 2, duration: 2, value: 3}
      ]
  end

end
