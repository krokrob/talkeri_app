import $ from 'jquery';
import 'select2';                       // globally assign select2 fn to $ element
import 'select2/dist/css/select2.css';  // optional if you have css loader


import "bootstrap";
window.scrollTo(0,1);
import { audioPlayer } from '../components/audioplayer';
audioPlayer();

import { toggleFooter } from '../components/togglefooter';
toggleFooter();

// import { submitText } from '../components/submit-text';
// submitText();

import { scrollMessages } from '../components/messagescrolldown';
scrollMessages();

import {hideSidebar} from '../components/sidebar';
hideSidebar();

import { audioMicRecorder } from 'components/recorder';
audioMicRecorder();

import { sendText } from '../components/sendbtn';
sendText();

import { photoBtn } from '../components/photobtn';
photoBtn();

window.scrollMessages = scrollMessages

// import {hideSidebar} from 'components/sidebar';
// hideSidebar();


// $(() => {
//   $('.js-chatroom-form').select2();
// });

// window.$ = $

