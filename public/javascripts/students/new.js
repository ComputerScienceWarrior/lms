const fname = document.querySelector('#first-name')
const lname = document.querySelector('#last-name')
const uname = document.querySelector('#username')
const password = document.querySelector('#password')
const passwordConf = document.querySelector('#password-conf')
var counter = 0

if (password.value != passwordConf.value){
    alert("Passwords do not match, please try again!")
}

