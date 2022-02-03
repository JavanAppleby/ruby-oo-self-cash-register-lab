class CashRegister
  attr_writer :total
  attr_reader :discount
  attr_accessor :items

  def initialize(discount = 0)
    @total = 0
    @subtotal = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(name, price, qty = 1)
    @subtotal = @total
    @total += price * qty
    qty.times { @items << name }
  end

  def apply_discount
    @total *= (1 - self.discount.to_f / 100)
    if self.discount != 0
      p "After the discount, the total comes to $#{self.total.to_i}."
    else p "There is no discount to apply."     end
  end

  def void_last_transaction
    @total = @subtotal
    @items.pop
  end
end
