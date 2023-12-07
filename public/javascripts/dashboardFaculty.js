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
