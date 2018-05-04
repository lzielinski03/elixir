prefix = fn (prefix) -> 
	fn sufix -> IO.puts "#{prefix} #{sufix}" end
end

first = prefix.('Mr')

first.('Elixir')

prefix.('doc').('Emec')