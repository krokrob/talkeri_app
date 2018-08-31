function audioMicRecorder(){

  const constraints = { audio: true };


  navigator.mediaDevices.getUserMedia(constraints)
    .then((stream) => {
      const options = {
        audioBitsPerSecond : 128000
      }
      const mediaRecorder = new MediaRecorder(stream, options);
      const recbutton = document.getElementById('open-talkie');
      // console.log(mediaRecorder.mimeType)
      // const stop = document.getElementById('talkie-btn');
      if (recbutton) {
        recbutton.addEventListener('click', (event) => {
          if (event.currentTarget.classList.contains('record')) {
            mediaRecorder.stop();
            event.currentTarget.classList.remove('record');
          } else {
            mediaRecorder.start();
            event.currentTarget.classList.add('record');
          }
        });
      }
      mediaRecorder.addEventListener('dataavailable', (event) => {
        if (event.data.size > 0) {
          const blob = event.data;
          const form = document.getElementById('new_message');
          const formData = new FormData(form);
          formData.append("blob",blob, 'test');

          fetch(form.action, {
            'Content-Type': 'text/html',
            method: 'post',
            body: formData
          })
          .then(response => response.text())
          .catch(error => console.error('Error:', error))
          .then((messageHTML) => {
            const messages = document.getElementById('msg-list');
            messages.insertAdjacentHTML('beforeend', messageHTML);
          });


        }
      });
    })
    .catch((error) => {
      console.log(error);
    });
  }







export { audioMicRecorder }
