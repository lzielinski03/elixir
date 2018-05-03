defmodule MyList do

	def max([value]), do: value

	def max([head | tail]) do
		Kernel.max(head, max(tail))
	end

end

IO.puts MyList.max([1, 15, 9, 20, 3])