// function checkChatVisible(chat) {
//   return chat.classList.contains('item-selected')
// }

// function submitText() {
//  const submitSimpleForm = document.getElementById("submit-text")
//  const chat = document.getElementById("chat")
//  let prevChatVisible = checkChatVisible(chat)
//  console.log(prevChatVisible)
//  document.getElementById("open-chat").addEventListener('click', (event) => {
//   if (!prevChatVisible) {
//     prevChatVisible = !prevChatVisible
//   } else{
//     submitSimpleForm.click()
//   }
//  });
// };

// function submitText() {
//   const element = document.getElementById('message_content').value;
//   const submitSimpleForm = document.getElementById("submit-text");
//   const newSubmit = document.getElementById("open-chat");
//       console.log(element);
//   if (element.value.lenght > 0) {
//     newSubmit.addEventListener('click', (event) => {
//       submitSimpleForm.click();
//     });
//   };
// };

// export { submitText }
