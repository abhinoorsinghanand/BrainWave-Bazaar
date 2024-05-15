function loadNotes() {
    var category = document.getElementById("category").value;
    var notesSection = document.getElementById("notesSection");
    notesSection.innerHTML = ""; // Clear previous notes

    // Make an AJAX request to fetch notes based on the selected category
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/fetch-notes?category=" + category, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var notesData = JSON.parse(xhr.responseText);

                // Iterate through notesData and create HTML elements for each note
                notesData.forEach(function(note) {
                    var noteCard = document.createElement("div");
                    noteCard.classList.add("col-md-4", "mb-4");

                    var card = document.createElement("div");
                    card.classList.add("card");

                    var cardBody = document.createElement("div");
                    cardBody.classList.add("card-body");

                    var title = document.createElement("h5");
                    title.classList.add("card-title");
                    title.textContent = note.title;

                    var content = document.createElement("p");
                    content.classList.add("card-text");
                    content.textContent = note.content;

                    cardBody.appendChild(title);
                    cardBody.appendChild(content);
                    card.appendChild(cardBody);
                    noteCard.appendChild(card);
                    notesSection.appendChild(noteCard);
                });
            } else {
                console.error("Failed to fetch notes");
            }
        }
    };
    xhr.send();
}
