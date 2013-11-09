var deviceStoragePictures = document.querySelector("device-storage-pictures"),
        deviceStoragePicturesDisplay =  document.querySelector("device-storage-pictures-display");
    if (deviceStoragePictures && deviceStoragePicturesDisplay) {
        deviceStoragePictures.onclick = function () {

            var deviceStorage = navigator.getDeviceStorage("pictures"),
                cursor = deviceStorage.enumerate();

            deviceStoragePicturesDisplay.innerHTML = "<h4>Result from deviceStorage - pictures</h4>";
            cursor.onsuccess = function () {
                if (!cursor.result) {
                    deviceStoragePicturesDisplay.innerHTML = "No files";
                }

                var file = cursor.result,
                    filePresentation;

                filePresentation = "<strong>" + file.name + ":</strong> " + parseInt(file.size / 1024, 10) + "kb<br>";
                filePresentation += "<p><img src='" + window.URL.createObjectURL(file) + "' alt=''></p>";
                deviceStoragePicturesDisplay.innerHTML += filePresentation;

                deviceStoragePicturesDisplay.style.display = "block";
            };

                cursor.onerror = function () {
                console.log("Error");
                deviceStoragePicturesDisplay.innerHTML = "<h4>Result from deviceStorage - pictures</h4><p>deviceStorage failed</p>";
                deviceStoragePicturesDisplay.style.display = "block";
            };
        };
    }