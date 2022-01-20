document.addEventListener('turbolinks:load', function () {
    const timer = document.getElementById('timer');
    if (timer) time_counter();
})

function time_counter() {
    let hoursDisplay = document.getElementById('h')
    let minutesDisplay = document.getElementById('m')
    let secondsDisplay = document.getElementById('s')

    let hours = Number(hoursDisplay.textContent)
    let minutes = Number(minutesDisplay.textContent)
    let seconds = Number(secondsDisplay.textContent)

    if (seconds !== 0) {
        secondsDisplay.textContent = String(--seconds)
    } else if (minutes === 0 && hours === 0) {
        document.getElementById('submit-button').click();
    } else if (hours === 0) {
        minutesDisplay.textContent = String(minutes - 1);
        secondsDisplay.textContent = '59'
    } else if (minutes === 0) {
        hoursDisplay.textContent = String(hours - 1)
        minutesDisplay.textContent = '59'
        secondsDisplay.textContent = '59'
    }

    setTimeout(time_counter, 1000);
}
