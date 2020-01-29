function isAuth() {
    let user = localStorage.getItem('user');
    if (!user) {
        let loginRoute = '<a id="login-link" href="#/login/">Login</a> '
        let signupRoute = '<a id="signup-link" href="#/signup/">Signup</a>'
        $("#navbar").append(loginRoute, signupRoute);
    } else {
        $("#login-link").remove();
        $("#signup-link").remove();

    }
}

function onLogin() {
    console.log("ha")
}