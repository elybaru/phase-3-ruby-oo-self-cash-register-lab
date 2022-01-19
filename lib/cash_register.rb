class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :last_transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end

    def add_item(item, price, quantity=1)
        self.total += price * quantity
        quantity.times do
            items << item 
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if self.discount > 0
            self.total= self.total - self.total * self.discount / 100
            return "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply." 
        end
    end

    def void_last_transaction
        if self.items.length == 0
            self.total = 0
        else
            self.total = self.total - self.last_transaction
        end
    end
end
