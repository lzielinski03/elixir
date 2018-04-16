defmodule MyList do

	def reduce([], value, _), do: value

	def reduce([head | tails], value, func) do
		reduce(tails, func.(head, value), func)
	end

	def map([], _func), do: []

	def map([head | tail], func) do
		[func.(head) | map(tail, func)]
	end

	def mapsum([head | tail], func) do
		reduce(map([head | tail], func), 0, &(&1 + &2))
	end
end

IO.puts MyList.mapsum([1, 2, 3], &(&1 * &1))
