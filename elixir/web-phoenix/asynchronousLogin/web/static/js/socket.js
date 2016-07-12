import {Socket} from "phoenix"

const login_btn       = document.getElementById('login-btn')
const register_btn    = document.getElementById('register-btn')

let login_params = {
  "username":     'username-login',
  "password":     'password-login'
}

let register_params = {
  "username":     'username-register',
  "email":        'email-register',
  "password":     'password-register',
  "pass_confirm": 'password-confirm'
}


let socket = new Socket("/socket", {params: {token: window.userToken}})

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/2" function
// in "web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, pass the token on connect as below. Or remove it
// from connect if you don't care about authentication.

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("user:connect", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

export default socket

login_btn.addEventListener("click", function() {
  let params = get_values(login_params)
  channel.push("login", params)
})

register_btn.addEventListener("click", function() {
  channel.push("register", register_params)
})

function get_values(hash) {
  let newhash = {}
  let keys = Object.keys(hash)
  for (let i = 0; i < keys.length; i++) {
    let key = keys[i]
    let id = hash[key]
    newhash[key] = document.getElementById(id).value
  }
  return newhash
}
