function photoBtn() {
  const photoButton = document.getElementById('photo-btn');
  const cloudinaryInput = document.getElementById('message_photo');
  if (photoButton) {
    cloudinaryInput.addEventListener( 'change', (event) => {
      document.getElementById('photo-form').submit();
    });
  }
}

export { photoBtn }
