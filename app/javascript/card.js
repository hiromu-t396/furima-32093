const pay = () => {
  Payjp.setPublicKey("pk_test_892575701fd1ce48fc0413bd");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("item_purchase[card]"),
      exp_month: formData.get("item_purchase[exp_month]"),
      exp_year: formData.get("item_purchase[exp_year]"),
      cvc: formData.get("item_purchase[cvc]"),
    };
  });
};

window.addEventListener("load", pay);