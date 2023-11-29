import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "checkbox" ]

    connect () {
      console.log('Hi from checkboxes');
    }

    document.addEventListener('DOMContentLoaded', function() {
    var form = document.getElementById('myForm');
    var checkboxes = form.querySelectorAll('input[type="checkbox"]');
    var maxCheckboxes = 4;

        form.addEventListener('change', function(event) {
            var checkedCount = 0;
            checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                checkedCount++;
                checkbox.closest('.form-check').classList.add('checked');
            } else {
                checkbox.closest('.form-check').classList.remove('checked');
            }
            });

            if (checkedCount > maxCheckboxes) {
            event.target.checked = false;
            event.target.closest('.form-check').classList.remove('checked');
            }
        });
    });
}