function toggleFooter() {
  const id = document.getElementById("open-chat");
  const id2 = document.getElementById("open-talkie");
  id.addEventListener('click', (event) => {
    const chat = document.getElementById('chat')
    if (!chat.classList.contains('item-selected')) {
      chat.classList.add("item-selected")
      document.getElementById('talkie').classList.remove("item-selected")
    }
  });
  id2.addEventListener('click', (event) => {
    const talkie = document.getElementById('talkie')
    if (!talkie.classList.contains('item-selected')) {
      talkie.classList.add("item-selected")
      document.getElementById('chat').classList.remove("item-selected")
    }
  });
}

export { toggleFooter };
