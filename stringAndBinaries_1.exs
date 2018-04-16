defmodule MyString do
	def isPrintable(string) do
		Enum.all?(string, fn ch -> ch in ?\s..?~ end)
	end
end

IO.inspect MyString.isPrintable('hello')
IO.inspect Enum.to_list ?\s ..?~