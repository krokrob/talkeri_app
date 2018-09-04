function speaker(audio, messages) {
  audio[0].addEventListener("playing", (event) => {
    messages.classList.add('display-none');
    const speaker = document.getElementById("speaker")
    speaker.classList.remove("display-none");
  });
  audio[0].addEventListener("ended", (event) => {
    messages.classList.remove('display-none');
    const speaker = document.getElementById("speaker")
    speaker.classList.add("display-none");
  });
  audio[0].play();
};


export { speaker }
