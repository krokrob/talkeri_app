function hideSidebar() {
  const sidebar = document.getElementById("sidebar");
  const logo = document.getElementById("logo");
  const logo_closing = document.getElementById("main-container-chatroom")
  if (logo) {
    logo.addEventListener('click', (event) => {
    sidebar.classList.remove('sidebar-collapse');
    });
    logo_closing.addEventListener('click', (event) => {
      console.log(sidebar);
      sidebar.classList.add('sidebar-collapse');
    });
  }
}
export {hideSidebar};
