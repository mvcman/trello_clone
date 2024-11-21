import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.element.showModal();
    }

    close() {
        console.log("got called!");
        document.getElementById("form_modal").close();
    }
}
