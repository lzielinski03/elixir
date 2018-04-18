defmodule Issues.GithubIssues do

	require Logger
	
	@user_agent [ {"user_agent", "Elixir dave@pragprod.com"} ]

	def fetch(user, proyect) do
		Logger.info "Fetching user #{user}'s proyect #{proyect}"
		issues_url(user, proyect)
			|> HTTPoison.get(@user_agent)
			|> handle_response
	end
	

	def handle_response({:ok, %{body: body, status_code: 200}}) do
		Logger.info "Successful response"
		Logger.debug fn -> inspect(body) end
		{ :ok, :jsx.decode(body) }
	end

	def handle_response({_, %{body: body, status_code: ___}}) do
		{ :error, :jsx.decode(body) }
	end

	@github_url Application.get_env(:issues, :github_url)

	def issues_url(user, proyect) do
		"#{@github_url}/repos/#{user}/#{proyect}/issues"
	end

end