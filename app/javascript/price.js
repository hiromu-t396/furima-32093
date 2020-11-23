window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1);
    console.log("Math.floor",addTaxDom);
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = (inputValue-addTaxDom.innerHTML);
    console.log(addProfitDom);
})
});


