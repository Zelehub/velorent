import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["rentalStart", "rentalEnd", "display"]
  static values = { price: Number }

  connect() {
    // console.log(this.hasPriceValue)
    // console.log(this.priceValue)
    // this.displayTarget.innerHTML = "Please choose the start and end date"
  }

  showPrice() {
    const date1 = new Date(this.rentalStartTarget.value)
    const date2 = new Date(this.rentalEndTarget.value)
    if (!isNaN(date1) && !isNaN(date2) && ((date2 - date1) > 0)) {
      this.displayTarget.classList.remove("invalid-date")
      // console.log(((date2 - date1) / 86400000) * this.priceValue)
      const price = ((date2 - date1) / 86400000) * this.priceValue
      this.displayTarget.innerHTML = `${price} <i class="fa-solid fa-euro-sign" style="color: #FFD43B;"></i>`
      // console.log((date2 - date1) / 86400000)
    } else if ((date2 - date1) < 0){
      this.displayTarget.classList.add("invalid-date")
      this.displayTarget.innerHTML = "End date can't come before Start date"
    } else {
      this.displayTarget.classList.remove("invalid-date")
      this.displayTarget.innerHTML = "Please choose the start and end date"
    }
  }
}
