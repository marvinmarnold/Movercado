module StockTransactionsHelper
  
  def warehouses
    %w[Maputo Nampula Inhambane Niassa]
  end
  
  def products
    {"Certeza" => 1, "Jeito Classico" => 2}
  end
  
  def directions
    {"Entry" => true, "Exit" => false}
  end
  
  #filter = 1 => in, 2=> out, 3=> net
  def quantity(filter, product)
    in_total = 0
    out_total = 0
    if filter == 1 || filter == 3
      in_transactions = StockTransaction.where(:product => product, :is_entry => true)
      in_transactions = in_transactions.where(:warehouse => @warehouse) if @warehouse
      in_total = 0
      in_transactions.each do |transaction|
        in_total += transaction.quantity
      end
      return in_total unless filter == 3
    end
    if filter == 2 || filter == 3
      out_transactions = StockTransaction.where(:product => product, :is_entry => false)
      out_transactions = out_transactions.where(:warehouse => @warehouse) if @warehouse
      out_total = 0
      out_transactions.each do |transaction|
        out_total += transaction.quantity
      end
      return out_total unless filter == 3
    end
    return in_total - out_total
  end
end
