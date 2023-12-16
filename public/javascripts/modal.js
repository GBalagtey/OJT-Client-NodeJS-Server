const modalWork = document.getElementById('myModal');
const modalBtn = document.getElementById('modalBtn');
const closeWork = document.getElementById('closeWorkModal')
const closeCompany =document.getElementById('closeCompanyModal')
const workForm = document.getElementById('workForm');
const currentDate = document.getElementById('currentDate');
const modalCompany = document.getElementById('companyModal');

modalBtn.onclick = function() {
    modalWork.style.display = 'block';
}

closeWork.onclick = function() {
    modalWork.style.display = 'none';
}
closeCompany.onclick = function(){
    modalCompany.style.display = 'none';
}

window.onclick = function(event) {
    if (event.target === modal) {
        modalWork.style.display = 'none';
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

function addCompany(){
    const companyModal = document.getElementById('companyModal');
    companyModal.style.display = "block";
}
