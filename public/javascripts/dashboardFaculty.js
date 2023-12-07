function formatDate(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function populateStudentRecords() {
  const recordsTable = document.getElementById('recordsTable');

  fetch('/getStudentRecords')
      .then(response => {
          console.log('Raw response:', response);
          return response.json();
      })
      .then(records => {
          console.log('Fetched records:', records);
          


          
          // const hardcodedTotalRenderedHours = record.totalRenderedHoursOjt;
          // const hardcodedTotalRequiredHours = record.requiredHours;
          

          recordsTable.innerHTML = '';
          records.forEach(record => {
            console.log(record.totalRenderedHoursOjt);
            console.log(record.requiredHours);
            const hardcodedTotalRenderedHours = record.totalRenderedHoursOjt;
            const hardcodedTotalRequiredHours = record.requiredHours;
            const progressPercentage = calculateProgress(hardcodedTotalRenderedHours, hardcodedTotalRequiredHours);
              const row = document.createElement('tr');
              row.innerHTML = `
                  <td>${record.firstName} ${record.lastName}</td>
                  <td>${record.companyName}</td>
                  <td>
                      <div class="progress-bar" style="width: ${progressPercentage}%; background-color: #7380ec;"></div>
                  </td>
                  <td>${progressPercentage.toFixed(2)}</td>
              `;

              recordsTable.appendChild(row);
          });
      })
      .catch(error => {
          console.error('Error fetching student records:', error);
      });
}

function calculateProgress(totalRenderedHours, totalRequiredHours) {
  const renderedHours = totalRenderedHours;
  const requiredHours = parseTime(totalRequiredHours);
  const percentage = (renderedHours / requiredHours) * 100;
  console.log(`Percentage: ${percentage}%`);
  return percentage;
}

// Function to convert time to seconds
function parseTime(timeString) {
  const [hours, minutes, seconds] = timeString.split(':').map(Number);
  return hours * 3600 + minutes * 60 + seconds;
}

// Call progressWidthFill before populateStudentRecords
populateStudentRecords();

// Function for Filter (you got this Gregg)
// Get the table rows
const table = document.getElementById('recordsTable');
const rows = table.getElementsByTagName('tr');

// Function to sort by student's name
function sortByName() {
  const sortedRows = Array.from(rows).slice(1); // Ignore the header row

  sortedRows.sort((a, b) => {
    const nameA = a.cells[0].textContent.toUpperCase();
    const nameB = b.cells[0].textContent.toUpperCase();

    if (nameA < nameB) return -1;
    if (nameA > nameB) return 1;
    return 0;
  });

  table.innerHTML = '';
  table.appendChild(rows[0]); // Add the header row

  sortedRows.forEach(row => {
    table.appendChild(row);
  });
}

// Function to sort by company name
function sortByCompany() {
  const sortedRows = Array.from(rows).slice(1); // Ignore the header row

  sortedRows.sort((a, b) => {
    const companyA = a.cells[1].textContent.toUpperCase();
    const companyB = b.cells[1].textContent.toUpperCase();

    if (companyA < companyB) return -1;
    if (companyA > companyB) return 1;
    return 0;
  });

  table.innerHTML = '';
  table.appendChild(rows[0]); // Add the header row

  sortedRows.forEach(row => {
    table.appendChild(row);
  });
}

// Function to sort by progress
function sortByProgress() {
  // Your logic for sorting by progress goes here
  // Assuming you have the progress as a numerical value in cells[2]
}

// Attach event listeners for sorting
document.getElementById('sortByName').addEventListener('click', sortByName);
document.getElementById('sortByCompany').addEventListener('click', sortByCompany);
document.getElementById('sortByProgress').addEventListener('click', sortByProgress);
