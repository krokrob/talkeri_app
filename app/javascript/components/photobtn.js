function photoBtn() {
  const photoButton = document.getElementById('photo-btn');
  const cloudinaryInput = document.getElementById('message_photo');
  const submitSimpleForm = document.getElementById("submit-photo");
  if (photoButton) {
    // photoButton.addEventListener( 'click', (event) => {
      // cloudinaryInput.click();
      cloudinaryInput.addEventListener( 'change', (event) => {
        document.getElementById('photo-form').submit();
      // });
    });
  }
}

export { photoBtn }
