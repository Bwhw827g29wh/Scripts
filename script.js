let clickLogin = document.getElementById('btnlogin');
let viewPass = document.getElementById('ViewPass');
const pass = document.getElementById('pass');
let remember = document.getElementById('remb');
const uSn = document.getElementById('username');
document.addEventListener('DOMContentLoaded', function() {
    if (localStorage.getItem('username')) {
        uSn.value = localStorage.getItem('username');
    }
});

const password = 'Meow';
const UN = 'GGH';

function checkPassword(enteredPass) {
    if (enteredPass === password) {
        return true;
    } else {
        alert('incorrect password, please try again.');
        clickLogin.classList.toggle('meow', true);
        setTimeout(() => {
            clickLogin.classList.toggle('meow', false);
        }, 2000);
        return false;
    }
}

function checkUsername(enteredName) {
    if (enteredName === UN) {
        return true;
    } else {
        alert('incorrect username, please try again.');
        clickLogin.classList.toggle('meow', true);
        setTimeout(() => {
            clickLogin.classList.toggle('meow', false);
        }, 2000);
        return false;
    }
}

function handleClickLogin() {
    const enteredPass = pass.value;
    const enteredName = uSn.value;
    if (checkPassword(enteredPass) && checkUsername(enteredName)) {
        window.location.href = "https://pastebin.com/u/GGH52Lan" target="_blank";
        //location.replace('https://pastebin.com/u/GGH52Lan')
        localStorage.setItem('username', uSn.value);
        localStorage.setItem('password', pass.value);
        alert('correct! redirecting...');
    } else if (checkUsername(enteredName)) {
        localStorage.setItem('username', uSn.value);
    } else if (checkPassword(enteredPass)) {}
}

function handleTogglePassVisibility() {
    if (viewPass.checked) {
        pass.type = 'text';
    } else {
        pass.type = 'password';
    }
}

function validateForm() {
    if (uSn.value === '' || pass.value === '') {
        alert('Please enter both username and password.');
        return false;
    }
    return true;
}

clickLogin.addEventListener('click', function() {
    if (validateForm()) {
        handleClickLogin();
    }
});
viewPass.addEventListener('change', handleTogglePassVisibility);