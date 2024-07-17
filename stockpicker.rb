def stockpicker (arr_prices)
  profit =0
  buyday = 0
  sellday = 0

  #run through array of prices to use each day's price as the basis for the buy price
  arr_prices.each_with_index do |pricebuy, indexbuy|
      #check the profit gained if the stock is sold on the rest of the days
      arr_prices.each_with_index do |pricesell, indexsell|
        #compare and save the pair of buy and sell days that yield the biggest profit
        if (indexsell>indexbuy) && ((pricesell-pricebuy) > profit)
          profit = pricesell-pricebuy
          buyday = indexbuy
          sellday = indexsell
        end
      end
  end

  return [buyday, sellday]
end

stockprices = [17,3,6,9,15,8,6,1,10]
p stockpicker(stockprices)