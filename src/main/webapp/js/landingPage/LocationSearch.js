import FormValidation from "./FormValidation.js";

/**
 * module controls logic for location search form submission, validates and sends data to java back end api
 */
export const LocationSearch = () => {

    event.preventDefault();

    const searchForm = document.getElementById("locationSearchForm").elements;

    const formData = { zipcode:  searchForm.namedItem("location").value };

    //returns true if errors were found else false if validation passed
    const validationResults = new FormValidation(formData).validateForm();

    const url = "postalCodeSearchJSON?maxRows=1&postalcode=" + zipcode;

    //if valid results create house object passing in house form data
    if (!(validationResults).includes(false)) {
        fetch(url, {
            method: 'GET',
            body: JSON.stringify(formData),
            headers: {'Content-type': 'application/json; charset=UTF-8'}
        }).then(function (response) {
            return response.ok ? response.json() : {};
        }).then(function (data) {
            console.log(data);
        }).catch(function (error) {
            alert("Something went wrong! Try again.")
        });
    }

    return false;
};

document.querySelector('#locationSearchForm').addEventListener('submit', LocationSearch);
