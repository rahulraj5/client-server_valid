
    <div class="container">
        <form id="signup" class="form">
            <h1>Customer Login</h1>
            <div class="form-field">
                <label for="username">Mobile Number:</label>
                <input type="text" name="mobile" id="mobile" autocomplete="off">
                <small></small>
            </div>

            <div class="form-field">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" autocomplete="off">
                <small></small>
            </div>

            <div class="form-field">
                <input type="submit" value="Sign In">
            </div>
            <div class="form-field">
               Click here for <a href="<?php echo base_url()?>home/sign_up" class="" >  Sign Up</a>
          </div>
        </form>
    </div>

    <script src="<?php echo base_url()?>front_assets/form_validation/js/app.js"></script>
