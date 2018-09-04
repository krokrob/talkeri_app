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
