import flatpickr from "flatpickr";
  const initFlatpickr = () => {
    flatpickr(".datepicker", {
      minDate: "today"
    });
}
export { initFlatpickr };
