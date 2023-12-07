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
  
        recordsTable.innerHTML = '';
        records.forEach(record => {
          const row = document.createElement('tr');
          row.innerHTML = `
            <td>${record.firstName} ${record.lastName}</td>
            <td>${record.companyName}</td>
            <td>${record.workDescription}</td>
            <td>${record.renderedHours}</td>
          `;
  
          recordsTable.appendChild(row);
        });
      })
      .catch(error => {
        console.error('Error fetching student records:', error);
      });
  }
  
  
  
//   function progressWidthFill() {
//     const progressWidth = document.getElementById('progress');
  
//     fetch('/getProgress')
//       .then(response => response.json())
//       .then(data => {
//         if (data.length > 0) {
//           const totalRenderedHours = parseTime(data[0].total_time);
//           const totalRequiredHours = parseTime(data[0].hours_required);
//           const percentage = (totalRenderedHours / totalRequiredHours) * 100;
//           console.log(`Percentage: ${percentage}%`);
//           progressWidth.style.width = percentage + '%';
//         }
//       })
//       .catch(error => {
//         console.error('Error fetching progress data:', error);
//       });
//   }
  
  // Function to convert time to seconds
  function parseTime(timeString) {
    const [hours, minutes, seconds] = timeString.split(':').map(Number);
    return hours * 3600 + minutes * 60 + seconds;
  }
  
  populateStudentRecords();
  progressWidthFill();
  