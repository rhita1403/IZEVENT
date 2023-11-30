import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = ["input"];

  connect() {
    flatpickr(this.inputTarget, {
      dateFormat: 'd-m-Y',
      minDate: 'today',
      theme: 'light'
    });
  }
}
