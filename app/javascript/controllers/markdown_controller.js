import { Controller } from "@hotwired/stimulus";
import * as markdown from "@logue/markdown-wasm";

export default class extends Controller {
  connect() {
    (async () => {
      try {
        const content = this.element.textContent;
        await markdown.ready();
        const htmlContent = markdown.parse(content);

        this.element.innerHTML = htmlContent;
      } catch (error) {
        console.error("Failed to load or parse markdown");
      }
    })();
  }
}
