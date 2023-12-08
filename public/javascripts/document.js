const documentForm = document.getElementById("documentForm");
const pendingDocument = document.getElementById("pendingDocument");
const pendingDisplay = document.getElementById("pendingDisplay");

function populateDocument() {
  fetch('/getSubmittedDocuments')
    .then(response => response.json())
    .then(records => {
      records.forEach(record => {

        const newLabel = document.createElement("label");
        newLabel.textContent = record.docName;
        newLabel.htmlFor = record.docName;
        newLabel.style.color = 'green';

        documentForm.appendChild(newLabel);

        documentForm.appendChild(document.createElement("br"));
      });
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

populateDocument();
populatePendingDocument();
