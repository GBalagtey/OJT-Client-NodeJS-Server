// Sample lol, Greg pleasee fix hahaha
const latestRecords = [
    {
        date: '2023-12-01',
        totalHours: '4',
        description: 'Worked on project A'
    },
    {
        date: '2023-11-30',
        totalHours: '5',
        description: 'Attended workshop'
    },
    {
        date: '2023-11-29',
        totalHours: '3',
        description: 'Studied for exams'
    }
];

// Function to populate the recent records table
function populateRecentRecords() {
    const recordsTable = document.getElementById('recordsTable');
    recordsTable.innerHTML = ''; // Clear existing content

    // Loop through the latest three records and create table rows
    latestRecords.slice(0, 3).forEach(record => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${record.date}</td>
            <td>${record.totalHours}</td>
            <td>${record.description}</td>
        `;
        recordsTable.appendChild(row);
    });
}

// Call the function to populate the table when the page loads
populateRecentRecords();
