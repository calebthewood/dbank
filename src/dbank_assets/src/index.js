import { dbank } from "../../declarations/dbank";

const USD = Intl.NumberFormat("en-US", { style: "currency", currency: "USD" });

async function updateDisplayedValue() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = USD.format(currentAmount);
}

window.addEventListener("load", updateDisplayedValue);

document.querySelector("form").addEventListener("submit", async function (event) {
  event.preventDefault();
  const deposit = document.getElementById("input-amount");
  const withdrawal = document.getElementById("withdrawal-amount");
  const button = event.target.querySelector("#submit-btn");

  button.setAttribute("disabled", true);

  if (deposit.value.length !== 0) {
    await dbank.topUp(parseFloat(deposit.value));
    deposit.value = "";
  }

  if (withdrawal.value.length !== 0) {
    await dbank.withdraw(parseFloat(withdrawal.value));
    withdrawal.value = "";
  }

  await dbank.compoundInterest();

  button.removeAttribute("disabled");
  await updateDisplayedValue();
});