function scrollMessages() {
  const messagesContainer = document.querySelectorAll('.message');
  if (messagesContainer.length > 0) {
    const messages = document.querySelectorAll('.message');
    const lastMessage = messages[messages.length - 1];
    if (lastMessage) {
      lastMessage.scrollIntoView();
    }
  }
}

export { scrollMessages }
