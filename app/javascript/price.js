window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1;
    addTaxDom.innerHTML = Math.floor(addTaxDom.innerHTML);
    const addTaxDom2 = document.getElementById("profit");
    addTaxDom2.innerHTML = inputValue - addTaxDom.innerHTML;
    addTaxDom2.innerHTML = Math.floor(addTaxDom2.innerHTML);
    console.log(inputValue);

  })
});