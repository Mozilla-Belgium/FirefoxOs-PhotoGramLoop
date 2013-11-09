var deviceStoragePicturesDisplay =  document.querySelector("#device-storage-pictures-display");
    if (deviceStoragePicturesDisplay) {
        showGallery();
    }

function showGallery() {

    var deviceStorage = navigator.getDeviceStorage("pictures"),
        cursor = deviceStorage.enumerate();

    deviceStoragePicturesDisplay.innerHTML = "";
    cursor.onsuccess = function () {


        var filePresentation = "<p id='gallery'>";
        
        var idImage = 0;
        var images = new Array;

        while (cursor.result) {
            var file = cursor.result;

            filePresentation += "<img class='image' id='image"+idImage+"' src='" + window.URL.createObjectURL(file) + "' alt=''>";
            deviceStoragePicturesDisplay.innerHTML += filePresentation;

            
            images[idImage] =  document.querySelector("#image"+idImage);
            images[idImage].onclick = function () {
                showImage(idImage);
            };

            idImage++;
            cursor.continue();
        }

        filePresentation += "/<p>";
    };

    cursor.onerror = function () {
        console.log("Error");
        deviceStoragePicturesDisplay.innerHTML = "<h4>Result from deviceStorage - pictures</h4><p>deviceStorage failed</p>";
        deviceStoragePicturesDisplay.style.display = "block";
    }
}


function showImage(id) {
    alert("show "+id);
}

