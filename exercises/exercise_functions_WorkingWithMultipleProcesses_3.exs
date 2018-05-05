defmodule Monitor do
	
	import :timer, only: [ sleep: 1 ]

	def process do
		receive do
			sender -> send sender, :ok
			raise :end
			#exit(:end)
		end
	end

	def run do
		#pid = spawn_link(Monitor, :process, [])
		pid = spawn_monitor(Monitor, :process, [])

		send pid, self()
		sleep 500
		receive do
			msj -> IO.puts msj
		end
	end
end

Monitor.run