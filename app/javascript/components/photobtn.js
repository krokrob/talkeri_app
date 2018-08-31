function photoBtn() {
  const photoButton = document.getElementById('photo-btn')
  const cloudinaryInput = document.getElementById('message_photo')
  const submitSimpleForm = document.getElementById("submit-text");
  if (photoButton) {
    photoButton.addEventListener( 'click', (event) => {
      cloudinaryInput.click();
      cloudinaryInput.addEventListener( 'change', (event) => {
        submitSimpleForm.click();
      });
    });
  }
}

export { photoBtn }
