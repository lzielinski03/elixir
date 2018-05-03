defmodule MyList do
	def calculate(string) do
		IO.inspect String.split(List.to_string(string))
		
	end
end

MyList.calculate('123 + 27')