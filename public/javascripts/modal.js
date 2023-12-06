const modal = document.getElementById('myModal');
const modalBtn = document.getElementById('modalBtn');
const closeBtn = document.getElementsByClassName('close')[0];
const workForm = document.getElementById('workForm');

modalBtn.onclick = function() {
    modal.style.display = 'block';
}

closeBtn.onclick = function() {
    modal.style.display = 'none';
}

window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
}

// workForm.addEventListener('submit', function(e) {
//     e.preventDefault();
//     const renderedHours = document.getElementById('renderedHours').value;
//     const description = document.getElementById('description').value;
//     // Here, you can handle the submitted data (renderedHours and description)
//     // For example, you might send it to a server using fetch or perform other actions.
//     // Then, you can close the modal:
//     modal.style.display = 'none';
// });
