exer_fun2 =  fn 
	0, 0, _ -> IO.puts "FizzBuzz"
	0, _, _ -> IO.puts "Fizz"
	_, 0, _ -> IO.puts "Buzz"
	_, _, n -> IO.puts n
end

exer_fun3 = fn 
	n -> exer_fun2.(rem(n, 3), rem(n, 5), n)
end

exer_fun3.(10)
exer_fun3.(11)
exer_fun3.(12)