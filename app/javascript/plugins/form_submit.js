const formsubmit = () => {
    const button = document.getElementById("form-button-submit")
    if (button) {
        button.addEventListener("click", myFunction);

        function myFunction() {
        const form = document.querySelector(".simple_form")
        form.submit();
        }
            }
}

export { formsubmit }