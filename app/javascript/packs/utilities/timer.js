document.addEventListener('turbolinks:load', function () {

    let timer = document.getElementById('timer');
    if (timer) { time_counter(); }

})

function time_counter() {
    let hoursDisplay = document.getElementById('h')
    let minutesDisplay = document.getElementById('m')
    let secondsDisplay = document.getElementById('s')

    let hours = Number(hoursDisplay.textContent)
    let minutes = Number(minutesDisplay.textContent)
    let seconds = Number(secondsDisplay.textContent)

    seconds--;

    if (seconds === 0 && minutes === 0 && hours === 0) {
        let nextButton = document.getElementsByName('button-to-next-question')[0];
        setTimeout(() => nextButton.click(), 1000);

    } else if (seconds === 0 && minutes === 0) {
        hoursDisplay.textContent = String(hours - 1);
        minutesDisplay.textContent = '59';
        secondsDisplay.textContent = '59';
    } else if (seconds === 0 && hours === 0) {
        minutesDisplay.textContent = String(minutes - 1);
        secondsDisplay.textContent = '59';
    } else if (seconds === 0 && minutes !== 0) {
        minutesDisplay.textContent = String(minutes - 1);
        secondsDisplay.textContent = '59';
    } else {
        secondsDisplay.textContent = String(seconds)
    }

    setTimeout(time_counter, 1000);
}
