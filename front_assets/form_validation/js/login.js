const mobileEl_l = document.querySelector('#mobile_l');
const passwordEl_l = document.querySelector('#password_l');


const form_signin = document.querySelector('#signin');


const checkMobileLogin = () => {
    let valid = false;
    const mobile = mobileEl_l.value.trim();
    if (!isRequired(mobile)) {
        showError(mobileEl_l, 'Mobile cannot be blank.');
    } else if (!ismobileValid(mobile)) {
        showError(mobileEl_l, 'Mobile is not valid.')
    } else {
        showSuccess(mobileEl_l);
        valid = true;
    }
    return valid;
};

const checkPasswordLogin = () => {
    let valid = false;

    const password = passwordEl_l.value.trim();

    if (!isRequired(password)) {
        showError(passwordEl_l, 'Password cannot be blank.');
    } else if (!isPasswordSecure(password)) {
        showError(passwordEl_l, 'Password must has at least 8 characters that include at least 1 lowercase character, 1 uppercase characters, 1 number, and 1 special character in (!@#$%^&*)');
    } else {
        showSuccess(passwordEl_l);
        valid = true;
    }

    return valid;
};

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


form_signin.addEventListener('submit', function (e) {
    // prevent the form from submitting
    e.preventDefault();

    // validate fields 

    let ismobileValid_login = checkMobileLogin(),
        isPasswordValid_login = checkPasswordLogin();

    let isFormValidLogin = ismobileValid_login &&
        isPasswordValid_login;      

    // submit to the server if the form is valid
    if(isFormValidLogin){
        var mobRegi = $("#mobile_l").val();
        var passRegi = $("#password_l").val();
        var href = base_url+"shop/loginajax";
        $.ajax({
            type: "POST",
            url: href,
            data: { mobile_no:mobRegi,password:passRegi},
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

form_signin.addEventListener('input', debounce(function (e) {
    switch (e.target.id) {
        case 'mobile_l':
            checkEmail();
            break;    
        case 'password_l':
            checkPassword();
            break;    
    }
}));