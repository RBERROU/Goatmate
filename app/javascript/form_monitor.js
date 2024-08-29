document.addEventListener("DOMContentLoaded", function() {
  const form = document.getElementById('goat-add-form');
  const submitBtn = document.getElementById('goat-add-submit');

  function checkFormFilled() {
     const requiredFields = form.querySelectorAll('[required]');
    let allFilled = true;

    requiredFields.forEach(function(field) {
      if (!field.value) {
        allFilled = false;
      }
    });
    console.log(allFilled)
    if (allFilled) {
      submitBtn.classList.add('all-filled');
      submitBtn.desabled = false;
    } else {
      submitBtn.classList.remove('all-filled');
      submitBtn.desabled = true;
    }
  }

  form.addEventListener('input', checkFormFilled);

  checkFormFilled();
});
