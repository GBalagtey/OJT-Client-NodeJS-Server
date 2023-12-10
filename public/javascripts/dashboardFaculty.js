function formatDate(dateString) {
  const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
  return new Date(dateString).toLocaleDateString(undefined, options);
}

function populateStudentRecords() {
  const recordsTable = document.getElementById('recordsTable');
  const modalContent = document.getElementById('modalContent'); // Added this line
  const sortDropdown = document.getElementById('sortDropdown');
  const sortByName = document.getElementById('sortByName');
  const sortByCompany = document.getElementById('sortByCompany');
  const sortByProgress = document.getElementById('sortByProgress');

  let currentSortOption = sortDropdown.value;
  
  fetch('/getStudentRecords')
    .then(response => response.json())
    .then(records => {
      records.sort((a, b) => (a.firstName + a.lastName).localeCompare(b.firstName + b.lastName));
      populate(records);
        sortDropdown.addEventListener('change', function () {
          currentSortOption = sortDropdown.value;
          if (currentSortOption === 'name') {
            records.sort((a, b) => (a.firstName + a.lastName).localeCompare(b.firstName + b.lastName));
            populate(records);
          } else if (currentSortOption === 'company') {
              records.sort((a, b) => (a.companyName || 'None').localeCompare(b.companyName || 'None'));
              populate(records);
          } else if (currentSortOption === 'progress') {
              records.sort((a, b) => calculateProgress(b.total_time, b.hours_required) - calculateProgress(a.total_time, a.hours_required));
              populate(records);
          }
        });
    })
    .catch(error => {
      console.error('Error fetching student records:', error);
    });
}

function populate(records){
  recordsTable.innerHTML = '';
  records.forEach(record => {
    const hardcodedTotalRenderedHours = record.total_time;
    const hardcodedTotalRequiredHours = record.hours_required;
    console.log(hardcodedTotalRenderedHours);
    console.log(hardcodedTotalRequiredHours);
    const progressPercentage = calculateProgress(hardcodedTotalRenderedHours, hardcodedTotalRequiredHours);
    if (record.companyName == null) {
      record.companyName = 'None';
    }

    const row = document.createElement('tr');
    row.innerHTML = `
              <td>${record.firstName} ${record.lastName}</td>
              <td>${record.companyName}</td>
              <td>
              <div class="progress-container">
                  <div class="progress-circle"></div>
                  <div class="progress-circle2" style="background: conic-gradient(
                    #7380ec 0% var(--progress, 0%),
                    #7380ec ${(progressPercentage.toFixed(2)/100)*360}deg var(--progress, 0%),
                    transparent ${(progressPercentage.toFixed(2)/100)*360}deg 360deg">
                    <div class="percentage"">${progressPercentage.toFixed(0)}%</div>
                  </div>
                </div>
              </td>
              
              <td>${record.courseNumber}: ${record.courseCode}</td>
              <td>${record.studEmail}</td>
          `;

    row.addEventListener('click', () => {
      // Call a function to populate modal content based on the clicked row
      openModal(record, progressPercentage);
    });
    
    // Add hover effect in JavaScript
    row.addEventListener('mouseenter', () => {
      // Apply hover effect when the mouse enters the row
      row.style.backgroundColor = '#f0f0f0'; // Change the background color as needed
      row.style.cursor = 'pointer'; // Change the cursor style as needed
    });
    
    row.addEventListener('mouseleave', () => {
      // Remove hover effect when the mouse leaves the row
      row.style.backgroundColor = ''; // Reset to default or remove this line if not needed
      row.style.cursor = ''; // Reset to default or remove this line if not needed
    });
    recordsTable.appendChild(row);
  });
}

function openModal(record, progressPercentage) {
  const modalContent = document.getElementById('modalContent');
  console.log(record.studID);

  // Fetch all documents
  fetch('/getDocuments') // Adjust the URL if needed
    .then(response => response.json())
    .then(documents => {
      // Fetch student documents from the new route
      fetch(`/getStudentDocumentsFaculty?studID=${record.studID}`) // Adjust the URL if needed
        .then(response => response.json())
        .then(studentDocuments => {
          console.log('record.studID', record.studID );
          console.log('All Documents:', documents);
          console.log('Student Documents:', studentDocuments);
          // Example: Populate modal content with documents as checkboxes
          modalContent.innerHTML = `
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 class="title-modal">Documents</h2>
            <div class="progress-bar" style="position: relative; width: 100%; background-color: #e0e0e0; border-radius: 5px;">
              <div style="position: absolute; top: 0; left: 0; width: ${progressPercentage}%; height: 100%; background-color: #7380ec; border-radius: 5px;"></div>
            </div>
            <p>Student: ${record.firstName} ${record.lastName}</p>
            <p>Company: ${record.companyName}</p>
            <h3>All Documents:</h3>
            <form id="documentForm">
              ${documents.map(doc => {
                const isChecked = studentDocuments.some(studentDoc => studentDoc.docID === doc.docID);
                return `<label><input type="checkbox" name="documents" value="${doc.docID}" ${isChecked ? 'checked' : ''}>${doc.docName}</label><br>`;
              }).join('')}
            </form>
            <button id="updateDocumentsButton">Update Documents</button>
            `;

          const modal = document.getElementById('myModal');
          modal.style.display = 'block';
          document.getElementById('updateDocumentsButton').addEventListener('click', () => {
            console.log('Button clicked');
            updateDocuments(record.studID);
          });
        })
        .catch(error => {
          console.error('Error fetching student documents:', error);
        });
    })
    .catch(error => {
      console.error('Error fetching documents:', error);
    });
}

function updateDocuments(studID) {
  const documentForm = document.getElementById('documentForm');
  const checkboxes = documentForm.querySelectorAll('[name="documents"]');
  const selectedDocuments = Array.from(checkboxes).filter(checkbox => checkbox.checked).map(checkbox => checkbox.value);

  fetch('/updateDocuments', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      studID,
      selectedDocuments,
    }),
  })
    .then(response => response.json())
    .then(data => {
      console.log('Documents updated successfully:', data);
      closeModal(); // Close the modal after updating
    })
    .catch(error => {
      console.error('Error updating documents:', error);
    });
}


// function openModal(record, progressPercentage) {
//   const modalContent = document.getElementById('modalContent');
//   console.log(record.studID);

//   // Fetch additional data based on the clicked row
//   fetch(`/getAdditionalData?studID=${record.studID}`) // Adjust the URL and parameters as needed
//     .then(response => response.json())
//     .then(additionalData => {
//       // Example: Populate modal content with the data from the clicked row and additional data
//       modalContent.innerHTML = `
//         <span class="close" onclick="closeModal()">&times;</span>
//         <h2 class="title-modal">Add Work Details</h2>
//         <div class="progress-bar" style="position: relative; width: 100%; background-color: #e0e0e0; border-radius: 5px;">
//           <div style="position: absolute; top: 0; left: 0; width: ${progressPercentage}%; height: 100%; background-color: #7380ec; border-radius: 5px;"></div>
//         </div>
//         <p>Student: ${record.firstName} ${record.lastName}</p>
//         <p>Company: ${record.companyName}</p>

//         <div class="announcements">
//           <h2>Requirements</h2>
//           <div class="updates">
//             <div class="message">
//               <h3 id="submittedDisplay">Submitted Documents</h3>
//               <form id="documentForm" style="display: grid">
//                 <!-- Populate submitted documents here -->
//               </form>
//               <h3 id="pendingDisplay">Other required documents</h3>
//               <form id="pendingDocument" style="display: grid">
//                 <!-- Populate pending documents here -->
//               </form>
//             </div>
//           </div>
//         </div>
//         <button id="updateButton">Update</button>
//       `;

//       const modal = document.getElementById('myModal');
//       modal.style.display = 'block';

//       document.getElementById('updateButton').addEventListener('click', () => {
//         updateData(record.studID);
//       });

//       console.log("LOOK AT ME ",  record.studID);
//       // Populate submitted documents
//       const documentForm = document.getElementById('documentForm');
//       fetch(`/getSubmittedDocumentsFaculty?studID=${record.studID}`, )
//         .then(response => response.json())
//         .then(submittedDocuments => {
//           submittedDocuments.forEach(doc => {
//             const checkbox = document.createElement('input');    
//             checkbox.checked = true;  
//             checkbox.type = 'checkbox';
//             checkbox.name = 'submittedDocument';
//             checkbox.value = doc.docName;
//             const label = document.createElement('label');
//             label.appendChild(checkbox);
//             label.appendChild(document.createTextNode(doc.docName));
//             documentForm.appendChild(label);
//           });

//         })
//         .catch(error => {
//           console.error('Error fetching submitted documents:', error);
//         });

//       // Populate pending documents
//       const pendingDocumentForm = document.getElementById('pendingDocument');
//       fetch(`/getPendingDocumentsFaculty?studID=${record.studID}`)
//         .then(response => response.json())
//         .then(pendingDocuments => {
//           pendingDocuments.forEach(doc => {
//             const checkbox = document.createElement('input');
//             checkbox.type = 'checkbox';
//             checkbox.name = 'pendingDocument';
//             checkbox.value = doc.docName;
//             const label = document.createElement('label');
//             label.appendChild(checkbox);
//             label.appendChild(document.createTextNode(doc.docName));
//             pendingDocumentForm.appendChild(label);
//           });
//         })
//         .catch(error => {
//           console.error('Error fetching pending documents:', error);
//         });
//     })
//     .catch(error => {
//       console.error('Error fetching additional data:', error);
//     });
// }

// function updateData(studID){
//   console.log("update", studID);


//   const documentForm = document.getElementById('documentForm');
//   const pendingDocumentForm = document.getElementById('pendingDocument');

//   const submittedDocuments = getFormData(documentForm, 'submittedDocument');
//   const pendingDocuments = getFormData(pendingDocumentForm, 'pendingDocument');

//   console.log('Submitted Documents:', submittedDocuments);
//   console.log('Pending Documents:', pendingDocuments);
// }

// function getFormData(form, checkboxName) {
//   const checkboxes = form.querySelectorAll(`[name="${checkboxName}"]:checked`);
//   const formData = [];

//   checkboxes.forEach(checkbox => {
//     formData.push({
//       docID: checkbox.value, // Assuming 'value' is the docID
//       studID: form.getAttribute('data-studID'), // Add a data-studID attribute to the form
//       isChecked: true, // You can customize this based on your requirements
//     });

//     // Log the values
//     console.log('studID:', form.getAttribute('data-studID'));
//     console.log('docID:', checkbox.value);
//     console.log('isChecked:', true); // Change this based on your logic
//   });

//   return formData;
// }




function closeModal() {
  const modal = document.getElementById('myModal');
  modal.style.display = 'none';
}

function calculateProgress(totalRenderedHours, totalRequiredHours) {
  const renderedHours = parseTime(totalRenderedHours);
  const requiredHours = parseTime(totalRequiredHours);
  const percentage = (renderedHours / requiredHours) * 100;

  // Ensure the percentage does not exceed 100%
  const cappedPercentage = Math.min(percentage, 100);

  console.log(`Percentage: ${cappedPercentage}%`);
  return cappedPercentage;
}

// Function to convert time to seconds
function parseTime(timeString) {
  const [hours, minutes, seconds] = timeString.split(':').map(Number);
  return hours * 3600 + minutes * 60 + seconds;
}

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

//UPLOAD PHOTO
function handleFileSelect(event) {
  const fileInput = event.target;
  const file = fileInput.files[0];

  if (file) {
    const reader = new FileReader();

    reader.onload = function (e) {
      const profilePhotoImg = document.getElementById('profile-photo-img');
      profilePhotoImg.src = e.target.result;

      uploadFile(file);
    };

    reader.readAsDataURL(file);
  }
}

function uploadFile(file) {
  const formData = new FormData();
  formData.append('file', file);

  fetch('/upload', {
    method: 'POST',
    body: formData,
  })
    .then(response => response.json())
    .then(data => {
      console.log('File uploaded successfully:', data);
    })
    .catch(error => {
      console.error('Error uploading file:', error);
    });
}