const sideMenu = document.querySelector("aside");
const profileBtn = document.querySelector("#profile-btn");
const themeToggler = document.querySelector(".theme-toggler");

profileBtn.onclick = function() {
    sideMenu.classList.toggle('active');
}
window.onscroll = () => {
    sideMenu.classList.remove('active');
    if(window.scrollY > 0){document.querySelector('header').classList.add('active');}
    else{document.querySelector('header').classList.remove('active');}
}

themeToggler.onclick = function() {
    document.body.classList.toggle('dark-theme');
    themeToggler.querySelector('span:nth-child(1)').classList.toggle('active')
    themeToggler.querySelector('span:nth-child(2)').classList.toggle('active')
}

// Requirements modal

// Function to open the modal
function openDocumentModal() {
    const modal = document.getElementById('documentModal');
    modal.style.display = 'block';
}

// Function to close the modal
function closeDocumentModal() {
    const modal = document.getElementById('documentModal');
    modal.style.display = 'none';
}

// Function to handle form submission
document.getElementById('documentForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // Collect selected documents
    const selectedDocuments = [];
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach(checkbox => {
        if (checkbox.checked) {
            selectedDocuments.push(checkbox.value);
        }
    });

    // Do something with the selected documents (e.g., submit them)
    console.log('Selected Documents:', selectedDocuments);

    // Close the modal after submission
    closeDocumentModal();
});
