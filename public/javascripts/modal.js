const modalWork = document.getElementById('myModal');
const modalBtn = document.getElementById('modalBtn');
const closeWork = document.getElementById('closeWorkModal')
const closeCompany =document.getElementById('closeCompanyModal')
const workForm = document.getElementById('workForm');
const currentDate = document.getElementById('currentDate');
const modalCompany = document.getElementById('companyModal');
const selectCompanyModal = document.getElementById('selectCompanyModal');
const closeSelectCompany = document.getElementById('closeSelectCompanyModal');

modalBtn.onclick = function() {
    modalWork.style.display = 'block';
}

closeWork.onclick = function() {
    modalWork.style.display = 'none';
}
closeCompany.onclick = function(){
    modalCompany.style.display = 'none';
}

closeSelectCompany.onclick = function() {
    selectCompanyModal.style.display = 'none';
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

function selectCompany(){
    selectCompanyModal.style.display = "block";
}

function addCompany() {
    modalCompany.style.display= "block";
}

function filterCompanies(searchTerm) {
    const select = document.getElementById('companySelect');
    const options = select.getElementsByTagName('option');

    for (const option of options) {
        const company = option.textContent.toLowerCase();
        const searchTermLower = searchTerm.toLowerCase();

        if (company.includes(searchTermLower)) {
            option.style.display = '';
        } else {
            option.style.display = 'none';
        }
    }
}