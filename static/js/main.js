document.getElementById('imageUpload').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const imagePreview = document.getElementById('imagePreview');
        imagePreview.innerHTML = '<img src="' + URL.createObjectURL(file) + '" style="max-width: 224px; max-height: 224px;">';
        document.querySelector('.image-section').style.display = 'block';
    }
});

document.getElementById('upload-file').addEventListener('submit', function(e) {
    e.preventDefault();
    const formData = new FormData(this);
    const loader = document.querySelector('.loader');
    const result = document.getElementById('result');

    loader.style.display = 'block';
    result.innerHTML = '<span>Processing...</span>';

    fetch('/disease/predict', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        loader.style.display = 'none';
        if (data.status === 'success') {
            result.innerHTML = `
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Prediction Result</h5>
                        <p><strong>Crop:</strong> ${data.crop}</p>
                        <p><strong>Disease:</strong> ${data.disease}</p>
                        <p><strong>Organic Pesticide:</strong> ${data.organic_pesticide}</p>
                        <p><strong>Inorganic Pesticide:</strong> ${data.inorganic_pesticide}</p>
                    </div>
                </div>
            `;
        } else {
            result.innerHTML = `<div class="alert alert-danger">${data.error}</div>`;
        }
    })
    .catch(error => {
        loader.style.display = 'none';
        result.innerHTML = `<div class="alert alert-danger">Error: ${error.message}</div>`;
    });
});