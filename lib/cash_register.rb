

class CashRegister

	attr_accessor :total, :discount



	def initialize(discount = nil)
		@total = 0
		@items = []
		@discount = discount
		@last_transaction = 0
	end

	# def discount
	# 	if @discount != nil
	# 		@new_discount = (@discount / 100)
	# 	end
	# end

	def add_item(item, price, quantity = 1)
		@total += (price * quantity)
		while quantity > 0 do
			@items << item
			quantity -= 1
			@last_transaction = @total
		end
	end

	def items
		return @items
	end

	def apply_discount
		if @discount != nil
			@total = @total - ((@discount / 100.0) * @total)
			return "After the discount, the total comes to $#{@total.round}."
		else
			return "There is no discount to apply."
		end
	end

	def void_last_transaction
		@total = @total - @last_transaction
	end



end
