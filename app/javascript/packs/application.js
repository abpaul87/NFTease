// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import { init } from './blogBg';
import { copyingText } from './shareBtn';
import { scrollingAnimation } from './scrolling'
import { myFunction, showPage } from './preloader';
import { autoPlay } from '../plugins/autoPlay';
import { formsubmit} from "../plugins/form_submit"
import { heart } from './like-button2';
import { scrollToTop } from './top-button'


Rails.start()
Turbolinks.start()
ActiveStorage.start()
//= require sortable.min

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initSortable } from '../plugins/init_sortable';
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  autoPlay();
  initSortable();
  copyingText();
  scrollingAnimation();
  formsubmit();
  heart();
  const landing = document.querySelector('#blob');
  if (landing) {
    init();
  }
  const preloader = document.querySelector('#preloader');
  if (preloader) {
    myFunction();
  }
  const top = document.getElementById('btn-back-to-top');
  if (top) {
    scrollToTop();
  }
});
