// Function to show room details and highlight the active button
function showRoomDetails(roomType, button) {
    // Hide all room details
    document.getElementById('singleRoomDetails').style.display = 'none';
    document.getElementById('doubleRoomDetails').style.display = 'none';
    document.getElementById('tripleRoomDetails').style.display = 'none';

    // Remove the active class from all buttons
    var buttons = document.querySelectorAll('.btn-group .btn');
    buttons.forEach(function (btn) {
        btn.classList.remove('active');
    });

    // Add the active class to the clicked button
    button.classList.add('active');

    // Show the selected room details
    if (roomType === 'single') {
        document.getElementById('singleRoomDetails').style.display = 'block';
    } else if (roomType === 'double') {
        document.getElementById('doubleRoomDetails').style.display = 'block';
    } else if (roomType === 'triple') {
        document.getElementById('tripleRoomDetails').style.display = 'block';
    }
}

// Call the function on page load to display single room details by default
window.onload = function () {
    var singleButton = document.querySelector('button[onclick="showRoomDetails(\'single\', this)"]');
    showRoomDetails('single', singleButton);  // Show single room details and highlight the button
};
