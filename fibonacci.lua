function fibonacci_generator(memo)
	local _memo = memo or {}
	_memo[1] = 0
	_memo[2] = 1
	
	local function fibonacci(n)
		if not _memo[n] then
			_memo[n] = fibonacci(n-2) + fibonacci(n-1)
		end
		
		return _memo[n]
	end
	
	return fibonacci
end