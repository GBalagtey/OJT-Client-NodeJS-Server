function formatDate(dateString) {
    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    return new Date(dateString).toLocaleDateString(undefined, options);
  }

  function populateRecentRecords() {
    const recordsTable = document.getElementById('recordsTable');
    
    fetch('/getLatestRecords')
      .then(response => response.json())
      .then(records => {
        recordsTable.innerHTML = '';
        records.forEach(record => {
          const row = document.createElement('tr');
          row.innerHTML = `
            <td>${formatDate(record.date)}</td>
            <td>${record.workDescription}</td>
            <td>${record.renderedHours}</td>
          `;

          recordsTable.appendChild(row);
        });
      })
      .catch(error => {
        console.error('Error fetching latest records:', error);
      });
  }
  
  function progressWidthFill() {
    const progressWidth = document.getElementById('progress');

    fetch('/getProgress')
      .then(response => response.json())
      .then(data => {
        if(data.length > 0){
          const totalRenderedHours = parseTime(data[0].total_time);
          let percentage = 0;  
          const totalRequiredHours = parseTime(data[0].hours_required);
          percentage = (totalRenderedHours/ totalRequiredHours) * 100;
          console.log(`Percentage: ${percentage}%`);
          progressWidth.style.width = percentage + '%';
      }
      })
      .catch(error => {
        console.error('Error fetching latest records:', error);
      });
  }
  //function to convert time to seconds
function parseTime(timeString) {
  const [hours, minutes, seconds] = timeString.split(':').map(Number);
  return hours * 3600 + minutes * 60 + seconds;
}
  populateRecentRecords();
  progressWidthFill();
  