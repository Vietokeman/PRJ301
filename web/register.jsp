<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./style.css"/>
    <style>
        body {
            background: url("https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            min-height: 100vh;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        .register-content {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 400px;
            max-width: 80%;
        }

        .registerform {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
        }

        .form {
            max-width: 100%;
            padding: 15px;
        }

        .login-form-title {
            font-family: Montserrat-ExtraBold;
            font-weight: 800;
            font-size: 30px;
            color: black;
            line-height: 1.2;
            text-align: center;
            width: 100%;
            display: block;
            padding-bottom: 25px;
        }

        .login-form-input {
            position: relative;
            width: 100%;
            margin-bottom: 15px;
        }

        .input {
            font-family: Poppins-Medium;
            font-size: 18px;
            line-height: 1.5;
            color: #666;
            display: block;
            width: 100%;
            background-color: #e6e6e6;
            height: 50px;
            border-radius: 20px;
            padding: 0 20px;
            outline: none;
            border: none;
        }

        .login-form-btn .button {
            font-size: 18px;
            width: 100%;
            height: 40px;
            border-radius: 25px;
            background: linear-gradient(to right, #00dbde, #fc00ff);
            border: none;
            color: white;
            margin-top: 20px;
            cursor: pointer;
            transition: all 0.5s;
        }

        .login-form-btn .button:hover {
            background: linear-gradient(to right, #fc00ff, #00dbde);
            border: none;
        }

        .login-form-out {
            padding-top: 20px;
            text-align: center;
        }

        .login-form-out a {
            font-size: 16px;
            width: 120px;
            height: 40px;
            border-radius: 25px;
            background: linear-gradient(to right, #00dbde, #fc00ff);
            border: none;
            color: white;
            margin-top: 20px;
            cursor: pointer;
            transition: all 0.5s;
            display: inline-block;
            line-height: 40px;
            text-decoration: none;
        }

        .login-form-out a:hover {
            background: linear-gradient(to right, #fc00ff, #00dbde);
            border: none;
        }
    </style>
</head>
<body>
    <div class="register-content">
        <div class="registerform">
            <div class="form">
                <div class="login-form-title">
                    Register
                </div>
                <form action="MainController" method="post">
                    <div class="login-form-input">
                        <input type="text" class="input" id="inp-username" name="username" placeholder="Username" required>
                    </div>
                    <div class="login-form-input">
                        <input type="password" class="input" id="inp-password" name="password" placeholder="Password" required>
                    </div>
                    <div class="login-form-input">
                        <input type="email" class="input" id="inp-email" name="email" placeholder="Email" required>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                        <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div>
                    <div class="login-form-btn">
                        <button type="submit" class="button" name="action" value="Register">Register</button>
                    </div>
                </form>
                <div class="login-form-out">
                    <a href="login.jsp">Login here</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
