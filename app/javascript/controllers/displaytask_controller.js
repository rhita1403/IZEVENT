import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="displaytask"
export default class extends Controller {
  static targets = ["togglableElement"]
  connect() {
    console.log("hello")
  }
  async fire(event){
    event.preventDefault()
    const response = await fetch("/form_task")
    console.log(response)
    const partialHtml = await response.text()
    console.log(partialHtml)
    // const html = this.togglableElementTarget.innerHTML
    // const element = document.createElement("hr")
    // this.togglableElementTarget.insertAdjacentElement("beforeend", element)
    this.togglableElementTarget.insertAdjacentHTML("beforeend", partialHtml)
  }
}

// def index
//   @monuments = Monument.all
//   @monument = Monument.new
// end

// data-action="change->displaytask#handleChange" data-displaytask-target="output"
