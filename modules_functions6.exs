defmodule Chop do

	def guess(actual, low..high) when actual > div(low+high, 2) do
		guess = div(low+high, 2)		
		IO.puts "Is it #{guess}"
		guess(actual, low+1..high)
	end
		
	def guess(actual, low..high) when actual < div(low+high, 2) do
		guess = div(low+high, 2)
		IO.puts "Is it #{guess}"
		guess(actual, low..high-1)
	end

	def guess(actual, _) do
		IO.puts "Is it #{actual}"
	end

end

Chop.guess(273, 1..1000)