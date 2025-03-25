window.addEventListener("load", function () {

    setTimeout(() => {
 
        document.getElementById("loader").classList.add("loader-hidden");

    setTimeout(() => {
        document.getElementById("loader").style.display = "none";
}, 1000); // This should match the fade-out effect in CSS
}, 300); // Loader stays visible for 3 seconds before fading out
});