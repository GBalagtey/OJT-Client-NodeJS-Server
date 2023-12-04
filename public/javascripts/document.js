const documentForm = document.getElementById("documentForm");

const newInput = document.createElement("input");
newInput.type = "checkbox";
newInput.id = "document4";
newInput.name = "document4";
newInput.value = "Document 4";

const newLabel = document.createElement("label");
newLabel.textContent = "Document 4";
newLabel.htmlFor = "document4";

documentForm.appendChild(newInput);
documentForm.appendChild(newLabel);

documentForm.appendChild(document.createElement("br"));
