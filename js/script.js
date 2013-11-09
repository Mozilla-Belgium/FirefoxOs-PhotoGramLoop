var $gallery =  $("#gallery");
    if ($gallery) {
        showGallery();
    }

function showGallery() {

    var idImage = 0;
    var deviceStorage = navigator.getDeviceStorage("pictures"),
        cursor = deviceStorage.enumerate();        
    
    cursor.onsuccess = function () {

        if (cursor.result) {
            var file = cursor.result;
            $gallery.append("<img class='image' data-id='"+idImage+"' src='" + window.URL.createObjectURL(file) + "' alt=''>");
            idImage = idImage+1;
            cursor.continue();
        }

    };

    cursor.onerror = function () {
        console.log("Error");
        $gallery.append("<h4>Result from deviceStorage - pictures</h4><p>deviceStorage failed</p>");
    }
}


function showImage(id) {
    alert("show "+id);
}

$('body').on('click','.image', function () {
    var id = $(this).data('id');
    showImage(id);
})

