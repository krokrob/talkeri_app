function hideSidebar() {
  console.log("Hello")
  const sidebar = document.getElementById("sidebar");
  const logo = document.getElementById("logo");
logo.addEventListener('click', (event) => {
  sidebar.classList.toggle('sidebar-collapse');
})
}

export {hideSidebar};
