/**************** Toggle for Uploading or writing notes. ****************/
function showUploadSection() {
    document.getElementById("uploadSection").style.display = "block";
    document.getElementById("writeSection").style.display = "none";
}

function showWriteSection() {
    document.getElementById("uploadSection").style.display = "none";
    document.getElementById("writeSection").style.display = "block";
}


/**************** Validate Form ****************/
//function validateForm() {
//    var category = document.getElementById("category").value;
//    var title = document.getElementById("title").value;
//    var tags = document.getElementById("tags").value;
//    var fileUpload = document.getElementById("fileUpload").value;
//    var write = document.getElementById("write").value;
//
//    if (category === "--select--") {
//        alert("Please select a valid category!");
//        return false;
//    }
//    if (title === "" || tags === "") {
//        alert("Please fill in all the required fields!");
//        return false;
//    }
//    if (document.getElementById("uploadNotes").checked && fileUpload === "") {
//        alert("Please select a file to upload.");
//        return false;
//    }
//    if (document.getElementById("writeNotes").checked && write === "") {
//        alert("Please write your notes.");
//        return false; // Prevent form submission
//    }
//    var fup = document.getElementById('fileUpload');
//    var fileName = fup.value;
//    var validExtensions = ["pdf", "ppt", "pptx", "doc", "docx", "html", "css", "js", "ipynb", "py", "exe", "java", "png", "jpg"];
//
//    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
//    if (validExtensions.includes(ext)) {
//        alert("Submitted Successfully!");
//        return true;
//    } else {
//        alert("Please select a file with a valid extension: " + validExtensions.join(", "));
//        fup.focus();
//        return false;
//    }
////     return true;
//}