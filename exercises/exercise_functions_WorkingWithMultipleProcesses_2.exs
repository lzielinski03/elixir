defmodule SpanTwoProcess do
	def run do
		pid1 = spawn(SpanTwoProcess, :call, [])
		pid2 = spawn(SpanTwoProcess, :call, [])

		send pid1, {self(), :fred}
		send pid2, {self(), :betty}

		receive do
			token -> IO.puts "name: #{token}"
		end
		receive do
			token -> IO.puts "name: #{token}"
		end
	end

	def call do
		receive do
			{sender, token} -> send sender, token
		end
	end
end

SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run
SpanTwoProcess.run