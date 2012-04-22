# $Id$

class String
	def with_ownership
		self + '\'' + (self.ends_with?('s') ? '' : 's')
	end
end