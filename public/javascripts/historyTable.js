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
            <td>${record.renderedHours}</td>
            <td>${record.workDescription}</td>
          `;
          recordsTable.appendChild(row);
        });
      })
      .catch(error => {
        console.error('Error fetching latest records:', error);
      });
  }
  
  populateRecentRecords();
  