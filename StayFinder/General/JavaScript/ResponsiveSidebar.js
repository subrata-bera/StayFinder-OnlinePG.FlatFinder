const icon = document.querySelector(".nav-icon svg");
const sidebar = document.querySelector(".nav");
const cross_icon = document.querySelector(".cross-icon svg");

icon.addEventListener("click", () => {
    sidebar.style.width = "280px";
icon.style.display = "none";
sidebar.style.padding = "12px";
cross_icon.style.display = "block";
});

cross_icon.addEventListener("click", () => {
    sidebar.style.width = "0";
icon.style.display = "block";
sidebar.style.padding = "0";
cross_icon.styele.display = "none";
})
