window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const Tax = 0.1;
  const priceInputValue = priceInput.value;
  const tax_fee = priceInputValue * Tax;
  const profit = priceInputValue - tax_fee;
  const addTaxDom = document.getElementById("add-tax-price");
  const profitarea = document.getElementById("profit")
  addTaxDom.innerHTML = Math.floor(tax_fee);
  profitarea.innerHTML = Math.floor(profit);
})
})
