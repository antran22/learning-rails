import { Controller } from "@hotwired/stimulus";

export default class CloseController extends Controller {
  connect() {}

  close() {
    this.element.classList.remove("animate-in");
    this.element.classList.add("animate-out");
    this.element.addEventListener("animationend", () => {
      this.element.remove();
    });
  }
}
