/* global Intl */

const prevBtns = document.querySelectorAll(".btn-prev");
const nextBtns = document.querySelectorAll(".btn-next");
const progress = document.getElementById("progress");
const formSteps = document.querySelectorAll(".form-step");
const progressSteps = document.querySelectorAll(".progress-step");

let formStepsNum = 0;

nextBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        formStepsNum++;
        updateFormSteps();
        updateProgressbar();
    });
});

prevBtns.forEach((btn) => {
    btn.addEventListener("click", () => {
        formStepsNum--;
        updateFormSteps();
        updateProgressbar();
    });
});

function updateFormSteps() {
    formSteps.forEach((formStep) => {
        formStep.classList.contains("form-step-active") &&
                formStep.classList.remove("form-step-active");
    });

    formSteps[formStepsNum].classList.add("form-step-active");
}

function updateProgressbar() {
    progressSteps.forEach((progressStep, idx) => {
        if (idx < formStepsNum + 1) {
            progressStep.classList.add("progress-step-active");
        } else {
            progressStep.classList.remove("progress-step-active");
        }
    });

    const progressActive = document.querySelectorAll(".progress-step-active");

    progress.style.width =
            ((progressActive.length - 1) / (progressSteps.length - 1)) * 100 + "%";
}

//-------------------------------------
const container = document.querySelector('.seat_container');
const seats = document.querySelectorAll('.rows .seats:not(.occupied');
const count = document.getElementById('count');
const movie_total = document.getElementById('movie_total');
const grand_total = document.getElementById('grand_total');
const price = document.getElementById('price');

// populateUI();
let ticketPrice = price.value * 1000;

var formatter = new Intl.NumberFormat('en-US', { maximumSignificantDigits: 10 });



// update total and count
function updateSelectedCount() {
    const selectedSeats = document.querySelectorAll('.rows .seats.selected');

    const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));

    localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));

    //copy selected seats into arr
    // map through array
    //return new array of indexes

    const selectedSeatsCount = selectedSeats.length;

    count.innerText = selectedSeatsCount;
    movie_total.innerText = formatter.format(selectedSeatsCount * ticketPrice);
    grand_total.innerText = formatter.format(selectedSeatsCount * ticketPrice);
}

// get data from localstorage and populate ui
// function populateUI() {
//   const selectedSeats = JSON.parse(localStorage.getItem('selectedSeats'));
//   if (selectedSeats !== null && selectedSeats.length > 0) {
//     seats.forEach((seat, index) => {
//       if (selectedSeats.indexOf(index) > -1) {
//         seat.classList.add('selected');
//       }
//     });
//   }

//   const selectedMovieIndex = localStorage.getItem('selectedMovieIndex');

//   // if (selectedMovieIndex !== null) {
//   //   movieSelect.selectedIndex = selectedMovieIndex;
//   // }
// }

// Movie select event
// movieSelect.addEventListener('change', (e) => {
//   ticketPrice = +e.target.value;
//   setMovieData(e.target.selectedIndex, e.target.value);
//   updateSelectedCount();
// });

// Seat click event
container.addEventListener('click', (e) => {
    if (e.target.classList.contains('seats') && !e.target.classList.contains('occupied')) {
        e.target.classList.toggle('selected');
        
        updateSelectedCount();
        updateSeatID();
        allowNextButton();
    }
});

// intial count and total
updateSelectedCount();