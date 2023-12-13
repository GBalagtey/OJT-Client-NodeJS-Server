const modal = document.getElementById('myModal');
const modalBtn = document.getElementById('modalBtn');
const closeBtn = document.getElementsByClassName('close')[0];
const workForm = document.getElementById('workForm');
const currentDate = document.getElementById('currentDate');

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

function interpretDate(dateString) {
    const [year, month, day] = dateString.split('-');
    const interpretedDate = new Date(year, month - 1, day);

    return interpretedDate;
}
const interpretedDate = interpretDate(currentDate.innerText);

const formattedDate = interpretedDate.toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
});

currentDate.innerText = formattedDate + ' (' + interpretedDate.toLocaleDateString('en-US', { weekday: 'short' }) + ')';


// workForm.addEventListener('submit', function(e) {
//     e.preventDefault();
//     const renderedHours = document.getElementById('renderedHours').value;
//     const description = document.getElementById('description').value;
//     // Here, you can handle the submitted data (renderedHours and description)
//     // For example, you might send it to a server using fetch or perform other actions.
//     // Then, you can close the modal:
//     modal.style.display = 'none';
// });
