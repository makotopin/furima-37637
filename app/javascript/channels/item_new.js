function TaxCalc() {    
  const ItemPrice = document.getElementById('item-price');
  const AddTaxPrice = document.getElementById('add-tax-price');
  const Profit = document.getElementById('profit');
  
  ItemPrice.addEventListener("keyup", () => {
    AddTaxPrice.innerHTML = Math.floor(ItemPrice.value * 0.1);
    Profit.innerHTML = Math.ceil(ItemPrice.value * 0.9);
  });
}
window.addEventListener('load', TaxCalc)
