// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import * as markdown from "@logue/markdown-wasm"

(async () => {
  await markdown.ready();
  console.log(markdown.parse('# hello\n*world*'));
})();
