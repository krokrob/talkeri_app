function speaker(audio, messages, data) {
  const speaker_name = document.getElementById('speaker-avatar-name')
  const speaker_photo = document.getElementById('speaker-avatar-photo')

  if (!(current_user.first_name == data.first_name_sender)) {
    audio[0].addEventListener("playing", (event) => {
      messages.classList.add('display-none');
      const speaker = document.getElementById("speaker")
      speaker.classList.remove("display-none");
      speaker_name.innerHTML = data.first_name_sender;
      speaker_photo.src = `${data.photo_url}`;
    });
    audio[0].addEventListener("ended", (event) => {
      messages.classList.remove('display-none');
      const speaker = document.getElementById("speaker")
      speaker.classList.add("display-none");
    });
    audio[0].play();
  }

};

export { speaker }
