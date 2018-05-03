defmodule MyList do

	def split(list, count), 		do: _split(list, [], count)

	defp _split([], filtered, _), 	do: {Enum.reverse(filtered), []}

	defp _split(list, filtered, 0), do: {Enum.reverse(filtered), list}

	defp _split([ head | tail ], filtered, count) when count > 0 do
		_split(tail, [ head | filtered ], count - 1)
	end

	defp _split(list, filtered, count) when count < 0 do
		n = length(list) + count
		newCount = if n < 0, do: 0, else: n
		_split(list, filtered, newCount)
	end


	def take([], _), 			do: []

	defp _take(_, taked, 0), 	do: Enum.reverse(taked)
	
	defp _take([ head | tail ], taked, count) do
		_take(tail, [ head | taked ], count - 1)
	end

	def take([ head | tail ], count) when count > 0 do
		_take(tail, [head], count - 1)
	end

	def take(list, count) when count < 0 do
		n = length(list) + count
		newCount = if n < 0, do: 0, else: n
		elem(split(list, newCount), 1)
	end
end

#IO.inspect Enum.split([1, 2, 3, 4, 5], -2)
#IO.inspect MyList.split([1, 2, 3, 4, 5], -2)

IO.inspect Enum.take([1, 2, 3, 4, 5], -2)
IO.inspect MyList.take([1, 2, 3, 4, 5], -2)