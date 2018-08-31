

function scrollMessages() {
  const messagesContainer = document.querySelectorAll('.message');
  console.log(messagesContainer);
  if (messagesContainer.length > 0) {
    const messages = document.querySelectorAll('.message');
    const lastMessage = messages[messages.length - 1];
    if (lastMessage) {
      lastMessage.scrollIntoView();
    console.log('scroll');
    }
  }
}

export { scrollMessages }
