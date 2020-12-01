window.addEventListener('load', function(){
  const priceInput = document.getElementById("item-price"); //価格
  priceInput.addEventListener("input", () => {
    const inputValue = Math.floor(priceInput.value);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1); //販売手数料(10%)
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(inputValue - (inputValue * 0.1)); //販売利益
  })
})