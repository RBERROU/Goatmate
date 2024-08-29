import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="check-booking-date"
export default class extends Controller {
  static targets = ["rentStart", "rentEnd"]

  connect() {
    this.updateEndDate();
  }

  updateEndDate() {
    const startDate = new Date(this.rentStartTarget.value);
    const endDate = new Date(this.rentEndTarget.value);

    // Set the minimum date for rent_end to be the same as rent_start
    this.rentEndTarget.min = this.rentStartTarget.value;

    // If rent_end is earlier than rent_start, or if they are the same, clear rent_end
    if (endDate <= startDate) {
      this.rentEndTarget.value = "";
    }
  }
}
