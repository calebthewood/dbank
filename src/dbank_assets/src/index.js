import { dbank } from "../../declarations/dbank";

const USD = Intl.NumberFormat("en-US",{style: "currency",currency: "USD"});

window.addEventListener("load", async function () {
  const currentAmount = await dbank.checkBalance();
  const valueUSD = USD.format(currentAmount)
  document.getElementById("value").innerText = valueUSD
});

