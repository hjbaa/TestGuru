document.addEventListener('turbolinks:load', function () {
    let PasswordInput = document.getElementById('user_password')
    let PasswordConfirmationInput = document.getElementById('user_password_confirmation')
    if (PasswordInput) { PasswordInput.onkeyup = checkPasswords; }
    if (PasswordConfirmationInput) { PasswordConfirmationInput.onkeyup = checkPasswords; }
})

function checkPasswords() {
    let PasswordInput = document.getElementById('user_password')
    let PasswordConfirmationInput = document.getElementById('user_password_confirmation')

    if (PasswordInput.value === '' && PasswordConfirmationInput.value === '') {
        PasswordInput.style.borderColor = "LightGrey"
        PasswordConfirmationInput.style.borderColor = "LightGrey"
        return
    }

    if (PasswordInput.value === PasswordConfirmationInput.value) {
        PasswordInput.style.borderColor = "Green"
        PasswordConfirmationInput.style.borderColor = "Green"
    } else {
        PasswordInput.style.borderColor = "Red"
        PasswordConfirmationInput.style.borderColor = "Red"
    }
}
