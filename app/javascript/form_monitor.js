/* console.log('form_monitor.js loaded');
const linkElement = document.getElementById('rent-your-goat-link');

linkElement.addEventListener('click', function() {
  console.log('Link clicked');
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

    console.log(allFilled);

    if (allFilled) {
      submitBtn.classList.add('all-filled');
      submitBtn.disabled = false;
      localStorage.setItem('formFilled', 'true');
    } else {
      submitBtn.classList.remove('all-filled');
      submitBtn.disabled = true;
      localStorage.setItem('formFilled', 'false');
    }
  }
  console.log(form) */
  /* form.addEventListener('input', checkFormFilled); */

  // Check if the form was previously filled
/*   const isFormFilled = localStorage.getItem('formFilled');
  if (isFormFilled === 'true') {
    submitBtn.classList.add('all-filled');
    submitBtn.disabled = false;
  }

  checkFormFilled();
}); */
