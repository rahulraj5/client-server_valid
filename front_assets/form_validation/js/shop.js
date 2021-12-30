const usernameEl_s = document.querySelector('#username_s');
const mobileEl_s = document.querySelector('#mobile_s');
const emailEl_s = document.querySelector('#email_s');
const passwordEl_s = document.querySelector('#password_s');
const confirmPasswordEl_s = document.querySelector('#confirm-password_s');

// const mobileEl_l = document.querySelector('#mobile_l');
// const passwordEl_l = document.querySelector('#password_l');

const form = document.querySelector('#signup');

// const form_signin = document.querySelector('#signin');


const checkUsername = () => {

    let valid = false;

    const min = 3,
        max = 25;

    const username = usernameEl_s.value.trim();

    if (!isRequired(username)) {
        showError(usernameEl_s, 'Username cannot be blank.');
    } else if (!isBetween(username.length, min, max)) {
        showError(usernameEl_s, `Username must be between ${min} and ${max} characters.`)
    } else {
        showSuccess(usernameEl_s);
        valid = true;
    }
    return valid;
};


const checkEmail = () => {
    let valid = false;
    const email = emailEl_s.value.trim();
    if (!isRequired(email)) {
        showError(emailEl_s, 'Email cannot be blank.');
    } else if (!isEmailValid(email)) {
        showError(emailEl_s, 'Email is not valid.')
    } else {
        showSuccess(emailEl_s);
        valid = true;
    }
    return valid;
};

const checkMobile = () => {
    let valid = false;
    const mobile = mobileEl_s.value.trim();
    if (!isRequired(mobile)) {
        showError(mobileEl_s, 'Mobile cannot be blank.');
    } else if (!ismobileValid(mobile)) {
        showError(mobileEl_s, 'Mobile is not valid.')
    } else {
        showSuccess(mobileEl_s);
        valid = true;
    }
    return valid;
};

const checkPassword = () => {
    let valid = false;

    const password = passwordEl_s.value.trim();

    if (!isRequired(password)) {
        showError(passwordEl_s, 'Password cannot be blank.');
    } else if (!isPasswordSecure(password)) {
        showError(passwordEl_s, 'Password must has at least 8 characters that include at least 1 lowercase character, 1 uppercase characters, 1 number, and 1 special character in (!@#$%^&*)');
    } else {
        showSuccess(passwordEl_s);
        valid = true;
    }

    return valid;
};

const checkConfirmPassword = () => {
    let valid = false;
    // check confirm password
    const confirmPassword = confirmPasswordEl_s.value.trim();
    const password = passwordEl_s.value.trim();

    if (!isRequired(confirmPassword)) {
        showError(confirmPasswordEl_s, 'Please enter the password again');
    } else if (password !== confirmPassword) {
        showError(confirmPasswordEl_s, 'The password does not match');
    } else {
        showSuccess(confirmPasswordEl_s);
        valid = true;
    }

    return valid;
};

// const checkMobileLogin = () => {
//     let valid = false;
//     const mobile = mobileEl_l.value.trim();
//     if (!isRequired(mobile)) {
//         showError(mobileEl_l, 'Mobile cannot be blank.');
//     } else if (!ismobileValid(mobile)) {
//         showError(mobileEl_l, 'Mobile is not valid.')
//     } else {
//         showSuccess(mobileEl_l);
//         valid = true;
//     }
//     return valid;
// };

// const checkPasswordLogin = () => {
//     let valid = false;

//     const password = passwordEl_l.value.trim();

//     if (!isRequired(password)) {
//         showError(passwordEl_l, 'Password cannot be blank.');
//     } else if (!isPasswordSecure(password)) {
//         showError(passwordEl_l, 'Password must has at least 8 characters that include at least 1 lowercase character, 1 uppercase characters, 1 number, and 1 special character in (!@#$%^&*)');
//     } else {
//         showSuccess(passwordEl_l);
//         valid = true;
//     }

//     return valid;
// };

const ismobileValid = (mobile) => {
    const re = /^[1-9]{1}[0-9]{9}$/;
    return re.test(mobile);
};

const isEmailValid = (email) => {
    const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
};

const isPasswordSecure = (password) => {
    const re = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");
    return re.test(password);
};

const isRequired = value => value === '' ? false : true;
const isBetween = (length, min, max) => length < min || length > max ? false : true;


const showError = (input, message) => {
    // get the form-field element
    const formField = input.parentElement;
    // add the error class
    formField.classList.remove('success');
    formField.classList.add('error');

    // show the error message
    const error = formField.querySelector('small');
    error.textContent = message;
};

const showSuccess = (input) => {
    // get the form-field element
    const formField = input.parentElement;

    // remove the error class
    formField.classList.remove('error');
    formField.classList.add('success');

    // hide the error message
    const error = formField.querySelector('small');
    error.textContent = '';
}


form.addEventListener('submit', function (e) {
    // prevent the form from submitting
    e.preventDefault();

    // validate fields
    let isUsernameValid = checkUsername(),
        ismobileValid = checkMobile(),
        isEmailValid = checkEmail(),
        isPasswordValid = checkPassword(),
        isConfirmPasswordValid = checkConfirmPassword();

    let isFormValid = isUsernameValid &&
        ismobileValid &&
        isEmailValid &&
        isPasswordValid &&
        isConfirmPasswordValid;        

    // submit to the server if the form is valid
    if (isFormValid) {
        var nameRegi = $("#username_s").val();
        var mobRegi = $("#mobile_s").val();
        var emailRegi = $("#email_s").val();
        var passRegi = $("#password_s").val();
        var href = base_url+"shop/subadmin_signup";
        $.ajax({
            type: "POST",
            url: href,
            data: { name:nameRegi,mobile_no:mobRegi,email:emailRegi,password:passRegi},
            dataType: "json",
            success : function(data){
                if (data.status == 1){
                    $.notify(data.msg, "success");
                    setTimeout(function(){window.location.href=base_url+"shop"},500);
                    } else {
                    $.notify(data.msg, "error");
                }
            },
            error: function(data) {
                $.notify(data.msg, "Oops Something went wrong");
            },
        });
    }
});

// form_signin.addEventListener('submit', function (e) {
//     // prevent the form from submitting
//     e.preventDefault();

//     // validate fields
//     let ismobileValid_login = checkMobileLogin(),
//         isPasswordValid_login = checkPasswordLogin();

//     let isFormValidLogin = ismobileValid_login &&
//         isPasswordValid_login;      

//     // submit to the server if the form is valid
//     if (isFormValidLogin){
//         var mobRegi = $("#mobile_l").val();
//         var passRegi = $("#password_l").val();
//         var href = base_url+"shop/loginajax";
//         $.ajax({
//             type: "POST",
//             url: href,
//             data: { mobile_no:mobRegi,password:passRegi},
//             dataType: "json",
//             success : function(data){
//                 if (data.status == 1){
//                     $.notify(data.msg, "success");
//                     setTimeout(function(){window.location.href=base_url+"shop"},500);
//                     } else {
//                     $.notify(data.msg, "error");
//                 }
//             },
//             error: function(data) {
//                 $.notify(data.msg, "Oops Something went wrong");
//             },
//         });
//     }    
// });

const debounce = (fn, delay = 500) => {
    let timeoutId;
    return (...args) => {
        // cancel the previous timer
        if (timeoutId) {
            clearTimeout(timeoutId);
        }
        // setup a new timer
        timeoutId = setTimeout(() => {
            fn.apply(null, args)
        }, delay);
    };
};

form.addEventListener('input', debounce(function (e) {
    switch (e.target.id) {
        case 'username_s':
            checkUsername();
            break;
        case 'email_s':
            checkEmail();
            break;
        case 'mobile_s':
            checkEmail();
            break;    
        case 'password_s':
            checkPassword();
            break;
        case 'confirm-password_s':
            checkConfirmPassword();
            break;
        case 'mobile_l':
            checkEmail();
            break;    
        case 'password_l':
            checkPassword();
            break;    
    }
}));

// form_signin.addEventListener('input', debounce(function (e) {
//     switch (e.target.id) {
//         case 'mobile_l':
//             checkEmail();
//             break;    
//         case 'password_l':
//             checkPassword();
//             break;    
//     }
// }));