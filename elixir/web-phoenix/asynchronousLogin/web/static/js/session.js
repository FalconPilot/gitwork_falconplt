const login_btn   = document.getElementById('login-btn')
const logout_btn  = document.getElementById('logout-btn')

if (login_btn) {
  login_btn.addEventListener("click", function() {
    login_client()
  })
} else if (logout_btn) {
  logout_btn.addEventListener("click", function() {
    logout_client()
  })
}

const site_header = document.getElementById('header')

let username

// Login Client
function login_client() {
  let uname_login = document.getElementById('username-login')
  let upass_login = document.getElementById('password-login')
  $.ajax({
    type: "POST",
    url: "/login",
    headers: {
      'X-CSRF-Token':  getCSRF()
    },
    data: {
      'username':   uname_login.value,
      'password':   upass_login.value
    },
    success: function(data) {
      if (data === "0") {
        let username = uname_login.value
        load_logged_ui(username)
      } else {
        // alert("Identifiants incorrects !")
        uname_login.value = ""
        upass_login.value = ""
      }
    }
  })
}

// Logout Client
function logout_client() {
  $.ajax({
    type: "POST",
    url: "/logout",
    headers: {
      'X-CSRF-Token': getCSRF()
    },
    success: function(data) {
      let err_code = parseInt(data)
      if (data === "0") {
        load_delogged_ui()
      }
    }
  })
}

// Get CSRF Token
function getCSRF() {
  return document.getElementById("csrf").content
}

let fields = {
  "text":     "username",
  "password": "password"
}

// Load Logout
function load_logged_ui(username) {
  site_header.innerHTML = ""
  let msg = document.createElement("h1")
  msg.innerHTML = "Welcome " + username
  site_header.appendChild(msg)
  let button = document.createElement("button")
  button.id = "logout-btn"
  button.addEventListener("click", logout_client())
  site_header.appendChild(button)
}

// Load login
function load_delogged_ui() {
  site_header.innerHTML = ""
  let form = document.createElement("form")
  let keys = Object.keys(fields)
  for (let i = 0; i < keys.length; i++) {
    let elem = document.createElement("input")
    elem.type = keys[i]
    elem.name = fields[keys[i]]
    form.appendChild(elem)
  }
  site_header.appendChild(form)
}
