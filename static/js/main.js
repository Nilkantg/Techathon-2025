document.getElementById('imageUpload').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const imagePreview = document.getElementById('imagePreview');
        imagePreview.innerHTML = '<img src="' + URL.createObjectURL(file) + '" style="max-width: 224px; max-height: 224px;">';
        document.querySelector('.image-section').style.display = 'block';
    }
});

document.getElementById('btn-predict').addEventListener('click', function() {
    const formData = new FormData(document.getElementById('upload-file'));
    const loader = document.querySelector('.loader');
    const result = document.getElementById('result');

    loader.style.display = 'block';
    result.innerHTML = '<span>Processing...</span>';

    fetch('/disease/predict', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(data => {
        loader.style.display = 'none';
        result.innerHTML = `<span>${data}</span>`;
    })
    .catch(error => {
        loader.style.display = 'none';
        result.innerHTML = `<span>Error: ${error}</span>`;
    });
});