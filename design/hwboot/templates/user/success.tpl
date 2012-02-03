<div class="container">
    <div class="hero-unit">

        {if $verify_user_email}

            <h2>{"User registered"|i18n("design/ezwebin/user/success")}</h2>


        <div class="alert alert-info">
        <p>
        {'Your account was successfully created. An email will be sent to the specified address. Follow the instructions in that email to activate your account.'|i18n('design/ezwebin/user/success')}
        </p>
        </div>
        {else}

            <h2>{"User registered"|i18n("design/ezwebin/user/success")}</h2>


        <div class="alert alert-info">
            <h2>{"Your account was successfully created."|i18n("design/ezwebin/user/success")}</h2>
        </div>
        {/if}

    </div>

</div>
