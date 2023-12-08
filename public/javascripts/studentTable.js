function populateStudentRecords() {
    const recordsTable = document.getElementById('timeTable');
  
    fetch('/getAllStudentRecords')
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
                    <td>${record.studEmail}</td>
                    <td>${record.teacherName}</td>
                    <td>${record.supervisor}</td>
                `;
  
                recordsTable.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error fetching student records:', error);
        });
  }

  populateStudentRecords();