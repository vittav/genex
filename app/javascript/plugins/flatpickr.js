import "../plugins/flatpickr"
import "flatpickr/dist/flatpickr.css"

flatpickr(".datepicker", {
    enableTime: true,
    dateFormat: "Y-m-d H:i",
})
