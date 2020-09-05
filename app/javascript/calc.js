function profit1(){
  const item_price = document.getElementById("item-price")
  const tax_price1 = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  item_price.addEventListener("keyup", function(){
    item_price2 = item_price.value 
    const tax_price = item_price2 * 0.1
    const  now_profit = item_price2 - tax_price
    tax_price1.textContent = tax_price
    
    profit.textContent = now_profit
  })
}

window.addEventListener("load", profit1);




