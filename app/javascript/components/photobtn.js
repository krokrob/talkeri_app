function photoBtn() {
  const photoButton = document.getElementById('photo-btn')
  const cloudinaryInput = document.getElementById('message_photo')
  photoButton.addEventListener( 'click', (event) => {
    console.log(cloudinaryInput )
    cloudinaryInput.click();
  });
}

export { photoBtn }
