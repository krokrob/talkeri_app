function scrollMessages() {
  if (document.querySelectorAll('.message').length > 0) {
    const messages = document.querySelectorAll('.message');
    const lastMessage = messages[messages.length - 1];
    if (lastMessage) {
      lastMessage.scrollIntoView();
    }
  }
}

export { scrollMessages }
