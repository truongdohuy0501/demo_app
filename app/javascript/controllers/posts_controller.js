import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["body", "add", "show"]

  addBody() {
    let content = this.bodyTarget.value;
    this.addTarget.insertAdjacentHTML('beforebegin', "<li class='post'>" + content + "</li>");
  }

  showAll() {
    this.showTarget.style.visibility = "visible";
  }

  upvote(event) {
    let post = event.target.closest(".post");
    post.insertAdjacentHTML('beforeend', '<i class="fa fa-check-circle"></i>');
  }

  remove(event) {
    let post = event.target.closest(".post");
    post.style.visibility = "hidden";
  }
}