const resultTable = document.querySelector(".table-result");
const amountText = document.querySelector(".amount").textContent;

if (amountText === "null" || amountText === 0 || amountText === "0.0") {
  resultTable.classList.add("hidden");
} else {
  resultTable.classList.remove("hidden");
}
