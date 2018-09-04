function hideSidebar() {
  const sidebar = document.getElementById("sidebar");
  const logo = document.getElementById("logo");
  const logo_closing = document.getElementById("wrapper-grey-light")
  if (logo) {
    logo.addEventListener('click', (event) => {
    sidebar.classList.remove('sidebar-collapse');
    });
    logo_closing.addEventListener('click', (event) => {
      sidebar.classList.add('sidebar-collapse');
    });
  }
}

export {hideSidebar};

// function displayChannel () {
//   const events = document.querySelectorAll(".event-title");
//   const channels = document.querySelectorAll(".chatrooms-#{item.name}");
//   events.forEach((item) => {
//   if (item) { item.addEventListener('click', (event) => {
//     channels.classList.toggle('.chatrooms-toggle');
//      });
// }

//   export{displayChannel};
