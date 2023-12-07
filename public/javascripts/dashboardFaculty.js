function formatDate(dateString) {
    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    return new Date(dateString).toLocaleDateString(undefined, options);
  }
  
  function populateStudentRecords() {
    const recordsTable = document.getElementById('recordsTable');

    fetch('/getStudentRecords')
        .then(response => response.json())
        .then(records => {
            recordsTable.innerHTML = '';
            records.forEach(record => {
                const row = document.createElement('tr');
                const progressPercentage = calculateProgressPercentage(record.requiredHours, record.totalRenderedHoursOjt);

                // Update the row to include a progress bar
                row.innerHTML = `
                    <td>${record.firstName} ${record.lastName}</td>
                    <td>${record.companyName}</td>
                    <td>
                        <div class="progress-bar" style="width: ${progressPercentage}%"></div>
                    </td>
                    <td>${record.totalRenderedHoursOjt}</td>
                `;
                console.log(record.firstName);
                console.log(record.requiredHours);
                console.log(record.totalRenderedHoursOjt);

                recordsTable.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error fetching student records:', error);
        });
}
  
  function calculateProgressPercentage(requiredHours, totalRenderedHoursOjt) {
    const totalRequiredHours = requiredHours; // Use the total required hours from the record itself
    const totalRenderedHours = totalRenderedHoursOjt;
    const percentage = (totalRenderedHours / totalRequiredHours) * 100;
    return Math.min(100, percentage); // Ensure the percentage does not exceed 100%
}

  // Function to convert time to seconds
  function parseTime(timeString) {
    const [hours, minutes, seconds] = timeString.split(':').map(Number);
    return hours * 3600 + minutes * 60 + seconds;
  }
  
  populateStudentRecords();
  progressWidthFill();
  