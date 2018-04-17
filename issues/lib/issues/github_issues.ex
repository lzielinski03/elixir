defmodule Issues.GithubIssues do
	
	@user_agent [ {"user_agent", "Elixir dave@pragprod.com"} ]

	def fetch(user, proyect) do
		issues_url(user, proyect)
			|> HTTPoison.get(@user_agent)
			|> handle_response
	end
	

	def handle_response({:ok, %{body: body, status_code: 200}}) do
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