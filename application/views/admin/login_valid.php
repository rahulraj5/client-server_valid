
    <div class="container">
        <form id="signin" class="form">
            <h1>Admin Login</h1>
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
                <input type="submit" value="Sign In">
            </div>
            <div class="form-field">
               Click here for <a href="<?php echo base_url()?>admin/sign_up" class="" >  Sign Up</a>
          </div>
        </form>
    </div>

    <script src="<?php echo base_url()?>front_assets/form_validation/js/admin_singin.js"></script>