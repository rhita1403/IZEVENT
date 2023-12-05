import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox"
export default class extends Controller {
  connect() {

  }

  check(event) {
    const input = event.currentTarget.children[0]
    console.log(input.checked)
    input.checked = input.checked ? false : true
    console.log(input.checked)
    event.currentTarget.classList.toggle('user-border')
    // event.currentTarget.classList.toggle('border-danger')

  }
}
