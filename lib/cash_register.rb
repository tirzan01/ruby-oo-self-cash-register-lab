class CashRegister

  attr_accessor :total, :items, :last_item_price
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, amount = 1)
    amount.times do
      self.items = @items << title
      self.total = @total + price
    end
    self.last_item_price = {price: price, amount: amount}
  end

  def apply_discount
    return 'There is no discount to apply.' if @discount == 0
    self.total = @total - @total * @discount / 100
    "After the discount, the total comes to $#{@total}."
  end

  def void_last_transaction
    @last_item_price[:amount] do
      self.items = @items.pop
    end
    if @items.length > 0
      self.total = @total - @last_item_price[:price] * @last_item_price[:amount]
    else
      self.total = 0.0 if @items.length == 0
    end
    self.last_item_price = nil
  end

end
