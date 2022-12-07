import flatpickr from "flatpickr";
  const initFlatpickr = () => {
    flatpickr(".datepicker", {
      minDate: "today",
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
    });
}
export { initFlatpickr };
