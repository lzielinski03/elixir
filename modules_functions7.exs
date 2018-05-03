defmodule Exer do

	def floatToString(float) when is_float(float) do
		:io.format("The number is ~.2f\n", [float])
	end

	def getOperatingSystemEnvVar(path), do: IO.puts System.get_env(path)

end

Exer.floatToString 4.213
Exer.getOperatingSystemEnvVar("PATH")