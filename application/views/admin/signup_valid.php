
    <div class="container">
        <form id="signup" class="form">
            <h1>Admin Signup</h1>
            <div class="form-field">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" autocomplete="off">
                <small></small>
            </div>
            <div class="form-field">
                <label for="mobile">Mobile Number:</label>
                <input type="text" name="mobile" id="mobile" autocomplete="off">
                <small></small>
            </div>

            <div class="form-field">
                <label for="email">Email:</label>
                <input type="text" name="email" id="email" autocomplete="off">
                <small></small>
            </div>

            <div class="form-field">
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" autocomplete="off">
                <small></small>
            </div>


            <div class="form-field">
                <label for="confirm-password">Confirm Password:</label>
                <input type="password" name="confirm-password" id="confirm-password" autocomplete="off">
                <small></small>
            </div>

            <div class="form-field">
                <input type="submit" value="Sign Up">
            </div>
            <div class="form-field">
               Click here for <a href="<?php echo base_url()?>admin/login" class="" >  Sign In</a>
          </div>
        </form>
    </div>


    <script src="<?php echo base_url()?>front_assets/form_validation/js/admin_signup.js"></script>