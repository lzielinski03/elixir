

defmodule MyList do

	def flatten([]), do: []

	def flatten([ head | tail ]) do
		if is_list(head) do
			Enum.concat(flatten(head), flatten(tail))
		else
			[head | flatten(tail)]
		end
	end

	def flatten2(list) do
		_flatten2(list, [])
	end

	defp _flatten2([], result), do: Enum.reverse(result)

	defp _flatten2([ [ h | []] | tail ], result) do
		_flatten2([ h | tail ], result)
	end
		
	defp _flatten2([ [ h | t ] | tail ], result) do
		_flatten2([ h, t | tail ], result)
	end

	defp _flatten2([ head | tail ], result) do
		IO.puts head
		_flatten2(tail, [ head | result ])
	end
end

IO.inspect List.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
IO.inspect MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
IO.inspect MyList.flatten2([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
