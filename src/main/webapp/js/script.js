function validateForm() {

    const units =
        document.getElementById("units");

    const error =
        document.getElementById("clientError");

    error.textContent = "";

    if (units.value === "") {

        error.textContent =
            "Please enter the number of units.";

        return false;
    }

    if (Number(units.value) < 0) {

        error.textContent =
            "Units cannot be negative.";

        return false;
    }

    if (!Number.isInteger(Number(units.value))) {

        error.textContent =
            "Please enter a whole number of units.";

        return false;
    }

    return true;
}
