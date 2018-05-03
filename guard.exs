defmodule Guard do

	def what_is(x) when is_number(x) do
		IO.puts "#{x} is a number"
	end

	def what_is(x) when is_list(x) do
		IO.puts "#{inspect(x)} is a list"
	end

	def what_is(x) when is_atom(x) do
		IO.puts "#{x} is a atom"
	end

end

Guard.what_is(1)
Guard.what_is([1, 2])
Guard.what_is(:ok)