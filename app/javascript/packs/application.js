// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(document).on('turbolinks:load', function() {
  $(function () {
    $(".page-top").click(function () {
      $('html, body').animate({
        scrollTop: 0
      }, 300);
    });
    $(window).scroll(function () {
      if ($(window).scrollTop() > 1) {
        $('.page-top').fadeIn(300).css('display', 'flex')
      } else {
        $('.page-top').fadeOut(300)
      }
    });
  });
});