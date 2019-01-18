function factorial_generator(memo)
	local _memo = memo or {}
	_memo[1] = 1
	
	function factorial(n)
		if not _memo[n] then
			_memo[n] = n * factorial(n - 1)
		end
		
		return _memo[n]
	end
	
	return factorial
end