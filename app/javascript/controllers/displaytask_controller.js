import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="displaytask"
export default class extends Controller {
  static targets = ["togglableElement"]
  connect() {
    console.log("hello")
  }
  fire(){
    console.log(this.togglableElementTarget.innerHTML)
    this.togglableElementTarget.insertAdjacentHTML("beforeend", this.togglableElementTarget.innerHTML)
  }
}

// def index
//   @monuments = Monument.all
//   @monument = Monument.new
// end

// data-action="change->displaytask#handleChange" data-displaytask-target="output"
