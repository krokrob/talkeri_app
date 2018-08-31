import $ from 'jquery';
import 'select2';                       // globally assign select2 fn to $ element
import 'select2/dist/css/select2.css';  // optional if you have css loader


import "bootstrap";

import { audioPlayer } from '../components/audioplayer';
audioPlayer();

import { toggleFooter } from '../components/togglefooter';
// toggleFooter();

// import { submitText } from '../components/submit-text';
// submitText();

import { scrollMessages } from '../components/messagescrolldown';
// scrollMessages();

import {hideSidebar} from 'components/sidebar';
// hideSidebar();


$(() => {
  $('.js-chatroom-form').select2();
});

window.$ = $
