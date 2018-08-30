function hideSidebar() {
  const sidebar = document.getElementById("sidebar");
  const logo = document.getElementById("logo");
  const logo_closing = document.getElementById("logo-closing")
  logo.addEventListener('click', (event) => {
  sidebar.classList.toggle('sidebar-collapse');
  sidebar.classList.toggle('absolute');
  });
  logo_closing.addEventListener('click', (event) => {
    sidebar.classList.toggle('sidebar-collapse');
    sidebar.classList.toggle('absolute');
  });
}

export {hideSidebar};
