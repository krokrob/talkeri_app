import MediaRecorder from 'audio-recorder-polyfill';

if (!window.MediaRecorder) {
  window.MediaRecorder = MediaRecorder;
}
