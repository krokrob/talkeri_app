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
          const onChatBtn = document.getElementById('chat-btn').classList.contains('grow-button');
          // si je suis pas sur le chat
          if (!onChatBtn) {
            // si je suis en train d'enregistrer
            if (event.currentTarget.classList.contains('record')) {
              // je veux arreter l'enregistrement
              mediaRecorder.stop();
              event.currentTarget.classList.remove('record');
            } else {
              // sinon
                // je veux record et ajouter la class record
              mediaRecorder.start();
              event.currentTarget.classList.add('record');
            }
          } else {
            // sinon
              // et toggle footer
              document.getElementById('talkie').classList.toggle('item-selected')
              document.getElementById('chat').classList.toggle('item-selected')
              document.getElementById('talkie-btn').classList.toggle('small-button')
              // et enlever growbutton sur chat
              document.getElementById('chat-btn').classList.remove('grow-button')
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
            method: 'post',
            body: formData
          })
          .then(response => response.json())
          .catch(error => console.error('Error:', error))
          .then(response => console.log('Success:', JSON.stringify(response)));
        }
      });
    })
    .catch((error) => {
      console.log(error);
    });
  }

export { audioMicRecorder }
