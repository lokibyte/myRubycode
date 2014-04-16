def add(a,b)
	if a.is_a? String
		if (a.to_i.to_s == a)
			return a.to_i + b
		else
			return "#{a}#{b}"
		end
	else
		return a + b
	end
end

