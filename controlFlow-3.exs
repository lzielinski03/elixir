defmodule MustBe do
	def ok!({ :ok, data }), do: data

	def ok!({ error_type, error_msg}), do: raise("#{error_type}: #{error_msg}")
end

try do
	MustBe.ok!(File.open("controlFlow-2.exs"))
rescue x ->
	IO.puts "ERROR"
	IO.puts x.message
end