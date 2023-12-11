
// Assuming this code is included after the HTML content is loaded
document.addEventListener("DOMContentLoaded", function () {
  const documentForm = document.getElementById("documentForm");
  const pendingDocument = document.getElementById("pendingDocument");
  const pendingDisplay = document.getElementById("pendingDisplay");
  const submittedDisplay = document.getElementById("submittedDisplay");
  const updates = document.getElementById('updates'); // Assuming updates is the container for announcements

  function populateDocument() {
    fetch('/getSubmittedDocuments')
      .then(response => response.json())
      .then(records => {
          if (records.length === 0) {
              submittedDisplay.style.display = 'none';
              documentForm.style.display = 'none';
              pendingDisplay.innerText = "Required Documents";
            } else {
          records.forEach(record => {
  
              const newLabel = document.createElement("label");
              newLabel.textContent = record.docName;
              newLabel.htmlFor = record.docName;
              newLabel.style.color = 'green';
  
              documentForm.appendChild(newLabel);
  
              documentForm.appendChild(document.createElement("br"));
          });
          }
      })
      .catch(error => {
        console.error('Error fetching latest records:', error);
      });
  }

  function populatePendingDocument() {
    fetch('/getPendingDocuments')
      .then(response => response.json())
      .then(records => {
        if (records.length === 0) {
            pendingDocument.style.display = 'none';
            pendingDisplay.style.display = 'none';
          } 
          else{
        records.forEach(record => {
  
          const newLabel = document.createElement("label");
          newLabel.textContent = record.docName;
          newLabel.htmlFor = record.docName;
          newLabel.style.color = '#FF8C00';
  
          pendingDocument.appendChild(newLabel);
  
          pendingDocument.appendChild(document.createElement("br"));
        });
    }
      })
      .catch(error => {
        console.error('Error fetching latest records:', error);
      });
  }


  function populateAnnouncement() {
    fetch('/getAnnouncements')
      .then(response => response.json())
      .then(records => {
        if (records.length === 0) {
          updates.innerHTML = '<p>No announcements available</p>';
        } else {
          records.forEach(record => {
            const newDiv = document.createElement("div");
            newDiv.classList.add("announcement");

            const titleElement = document.createElement("h3");
            titleElement.textContent = record.title;

            const dateElement = document.createElement("small");
            dateElement.textContent = `Date: ${formatDate(record.date)}`; // Use formatDate function here

            const textElement = document.createElement("p");
            textElement.textContent = record.text;

            newDiv.appendChild(titleElement);
            newDiv.appendChild(dateElement);
            newDiv.appendChild(textElement);

            updates.appendChild(newDiv);
          });
        }
      })
      .catch(error => {
        console.error('Error fetching announcements:', error);
        updates.innerHTML = '<p>Error fetching announcements</p>';
      });
  }

  function formatDate(dateString) {
    const options = { year: 'numeric', month: '2-digit', day: '2-digit' };
    return new Date(dateString).toLocaleDateString(undefined, options);
  }

  populateDocument();
  populatePendingDocument();
  populateAnnouncement();
});


