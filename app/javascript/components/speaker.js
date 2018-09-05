function speaker(audio, messages, data) {
  const speaker_name = document.getElementById('speaker-avatar-name')
  const speaker_photo = document.getElementById('speaker-avatar-photo')
  const recbtn = document.getElementById('open-talkie');
  audio[0].addEventListener("playing", (event) => {
    messages.classList.add('display-none');
    const speaker = document.getElementById("speaker")
    speaker.classList.remove("display-none");
    speaker_name.innerHTML = data.first_name_sender;
    speaker_photo.src = `${data.photo_url}`;
    recbtn.classList.add('speaker-playing')
  });
  audio[0].addEventListener("ended", (event) => {
    messages.classList.remove('display-none');
    const speaker = document.getElementById("speaker")
    speaker.classList.add("display-none");
    recbtn.classList.remove('speaker-playing')
  });
  audio[0].play();
};

export { speaker }
