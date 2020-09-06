function profit1(){
  const item_price = document.getElementById("item-price")
  const tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  item_price.addEventListener("keyup", function(){
    item_price_new = item_price.value 
    const tax_price_new = item_price_new * 0.1
    const  now_profit = item_price_new - tax_price_new
    tax_price.textContent = tax_price_new
    
    profit.textContent = now_profit
  })
}

window.addEventListener("load", profit1);




