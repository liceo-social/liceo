<!doctype html>
<html>
<head>
    <title>Login</title>
    <asset:stylesheet src="all.css"/>
    <asset:stylesheet src="adminlte.css"/>
    <asset:stylesheet src="main.css"/>
</head>
<body class="login-page" style="min-height: 512.391px;">
    <div class="login-box">
        <div class="login-logo">
            <!-- MASIAVENTURA -->
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Introduce tu email y contraseña</p>
                <form class="form-signin" action="${postUrl ?: '/login/authenticate'}"
                    method="POST" id="loginForm" autocomplete="off">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control"
                            placeholder="Email" name="${usernameParameter ?: 'username'}" id="username" autocapitalize="none"/>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Contraseña" name="${passwordParameter ?: 'password'}" id="password"/>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="remember">
                                 <input type="checkbox"
                                     name="${rememberMeParameter ?: 'remember-me'}"
                                     id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                                <label for="remember-me">
                                    Recuérdame
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block">Logarme</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <!-- /.social-auth-links -->

                <p class="mb-1">
                    <a href="forgot-password.html">Olvidé mi contraseña</a>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <asset:javascript src="jquery.js"/>
        <asset:javascript src="bootstrap.js"/>
        <asset:javascript src="adminlte.js"/>

</body>
</html>
