require("factorial")

--define a helper function to print all cached values
function PrintCache(t)
	print("n   | n!   ")
	print("-----------")
	for k,v in pairs(t) do
		print( string.format("%-3d | %-3d", k, v) )
	end
end


--create a memoized factorial calculator object
--we will give it our own table to use as cache space so that we can inspect it directly
local cache = {}
local factorial_functor = factorial_generator(cache)

--calculate factorial of 20 (aka "20!"). this will require that 1! through 19! also be calculated
factorial_functor(20)

--print the cache table. you will notice that it contains 1! through 19!, as these were calculated while solving for 20!
--any subsequent calls to factorial_functor asking for factorials in this range will be taken from this table
--factorial calculations are defined recursively, so the cache lookups will also be performed for factorial calculations on larger values
PrintCache(cache)

-- expected output:
-- n   | n!   
-- -----------
-- 1   | 1  
-- 2   | 2  
-- 3   | 6  
-- 4   | 24 
-- 5   | 120
-- 6   | 720
-- 7   | 5040
-- 8   | 40320
-- 9   | 362880
-- 10  | 3628800
-- 11  | 39916800
-- 12  | 479001600
-- 13  | 6227020800
-- 14  | 87178291200
-- 15  | 1307674368000
-- 16  | 20922789888000
-- 17  | 355687428096000
-- 18  | 6402373705728000
-- 19  | 121645100408832000
-- 20  | 2432902008176640000
