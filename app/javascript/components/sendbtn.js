function sendText() {
  const element = document.getElementById('message_content');
  const submitSimpleForm = document.getElementById("submit-text");
  const sendbtn = document.getElementById("send-btn");
  if (element) {
    element.addEventListener('keyup', (event) => {
      if (element.value === "") {
        sendbtn.classList.add('display-none')
      } else {
        sendbtn.classList.remove('display-none')
        sendbtn.addEventListener('click', (event) => {
          submitSimpleForm.click();
        });
      };
    });
  }
};

export { sendText }


