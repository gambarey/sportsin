import { Application } from "@hotwired/stimulus"
import ScrollProgress from 'stimulus-scroll-progress'
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

const application = Application.start()
application.register('scroll-progress', ScrollProgress)

$(function(){
  //WOW plugin init
  new WOW().init();

  //parallax effect for banner
  (function() {
      var posY;
      var image = document.getElementById('parallax');;
      function paralax() {
          posY = window.pageYOffset;
          image.style.top = posY * 0.9 + 'px';
      }
      window.addEventListener('scroll', paralax);
  })();
});
