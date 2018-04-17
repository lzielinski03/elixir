defmodule Issues.CLI do
	
	@default_count 4

	@moduledoc """
	Handle the command line parsing and the dispatch to
	the various functions that end up generating a 
	table of the last _n_ issues in a github proyect
	"""

	def run(argv) do
		argv
			|> parse_args
			|> process
	end

	@doc """
	`argv` can be -h or --help, which returns :help.
	Otherwise it is a github user name, proyect name, and (optionally)
	the number of entries to format.
	Return a tuple of `{ user, proyect, count }`, or `:help` if help was given.
	"""

	def parse_args(argv) do
		parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

		case parse do
			{[ help: true ], _, _ } 			-> :help
			{ _, [ user, proyect, count ], _} 	-> { user, proyect, String.to_integer(count) }
			{ _, [ user, proyect ], _ } 		-> { user, proyect, @default_count }
			_ -> :help
		end
	end

	def process(:help) do

		IO.puts """
		usage: issues <user> <proyect> [ count | #{@default_count} ]
		"""
		System.halt(0)
	end

	def process({ user, proyect, count }) do
		Issues.GithubIssues.fetch(user, proyect)
			|> decode_response
			|> convert_to_list_of_hashdicts
			|> sort_into_ascending_order
			|> Enum.take(count)
			|> organize_rows
	end

	def decode_response({ :ok, body }), do: body

	def decode_response({ :error, error }) do
		{ _, message } = List.keyfind(error, "message", 0)
		IO.puts "Error fetching from Github: #{message}"
		System.halt(2)
	end

	def convert_to_list_of_hashdicts(list) do
		list |> Enum.map(&Enum.into(&1, Map.new))
	end

	def sort_into_ascending_order(list_of_issues) do
		Enum.sort list_of_issues, fn i1, i2 -> i1["created_at"] <= i2["created_at"] end
	end

	def organize_rows(list) do
		IO.puts String.duplicate("-", 120)
		IO.puts format_row("id", "date", "title")
		IO.puts String.duplicate("-", 120)
		list |> Enum.map(fn (x) -> IO.puts(format_row(Integer.to_string(x["id"]), x["created_at"], x["title"])) end )
		IO.puts String.duplicate("-", 120)
	end

	def format_row(id, created_at, title) do
		id = String.pad_trailing(id, 10)
		created_at = String.pad_trailing(created_at, 21)
		title = String.pad_trailing(title, 84)
		"#{id} | #{created_at} | #{title}"
	end
end
