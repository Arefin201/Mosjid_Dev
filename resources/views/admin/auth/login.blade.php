<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Andev Web</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Open Sans", sans-serif;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            width: 100%;
            padding: 0 10px;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
        }

        body::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 100%;
            background: url("https://i.postimg.cc/0jv27Qvw/20008380-645221846.jpg"), #000;
            background-position: center;
            background-size: cover;
            z-index: -1;
        }

        .wrapper {
            width: 400px;
            border-radius: 15px;
            padding: 40px;
            text-align: center;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
            transition: all 0.3s ease;
        }

        .wrapper:hover {
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.5);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        h2 {
            font-size: 2.2rem;
            margin-bottom: 25px;
            color: #ffffff;
            letter-spacing: 1px;
        }

        .input-field {
            position: relative;
            border-bottom: 2px solid rgba(255, 255, 255, 0.3);
            margin: 20px 0;
        }

        .input-field label {
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
            color: #ffffff;
            font-size: 16px;
            pointer-events: none;
            transition: 0.3s ease;
        }

        .input-field input {
            width: 100%;
            height: 40px;
            background: transparent;
            border: none;
            outline: none;
            font-size: 16px;
            color: #ffffff;
            padding: 0 10px;
        }

        .input-field input:focus~label,
        .input-field input:valid~label {
            font-size: 0.9rem;
            top: 10px;
            transform: translateY(-150%);
            color: #ffdde1;
        }

        .forget {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 25px 0 35px 0;
            color: #ffffff;
        }

        #remember {
            accent-color: #ffdde1;
        }

        .forget label {
            display: flex;
            align-items: center;
        }

        .forget label p {
            margin-left: 8px;
        }

        .wrapper a {
            color: #ffdde1;
            text-decoration: none;
        }

        .wrapper a:hover {
            text-decoration: underline;
        }

        button {
            background-color: #271930;
            color: #ffffff;
            font-weight: 600;
            border: none;
            padding: 15px 20px;
            cursor: pointer;
            border-radius: 25px;
            font-size: 16px;
            border: 2px solid transparent;
            transition: all 0.3s ease;
        }

        button:hover {
            color: #000000;
            background: rgba(255, 255, 255, 0.2);
            border-color: #ffffff;
        }

        .register {
            text-align: center;
            margin-top: 30px;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <form method="POST" action="{{ route('login') }}" class="flex flex-col">
            @csrf

            <h2 class="form-title text-3xl md:text-4xl mb-8 text-white text-center tracking-wide animate-fade-in">Login
                Form</h2>

            <!-- Email Field -->
            <div class="input-field animate-slide-up" style="animation-delay: 0.4s">
                <input id="email" type="email" name="email" required autofocus autocomplete="username"
                    placeholder=" " class="pr-10" value="{{ old('email') }}">
                <label for="email">Enter your email</label>
                <i class="fas fa-envelope"></i>
            </div>
            <!-- Email Error -->
            <div class="input-error animate-fade-in bg-sky-700" style="animation-delay: 0.5s">
                @if ($errors->has('email'))
                    {{ $errors->first('email') }}
                @endif
            </div>

            <!-- Password Field -->
            <div class="input-field animate-slide-up" style="animation-delay: 0.6s">
                <input id="password" type="password" name="password" required autocomplete="current-password"
                    placeholder=" " class="pr-10">
                <label for="password">Enter your password</label>
                <i class="fas fa-lock"></i>
            </div>
            <!-- Password Error -->
            <div class="input-error animate-fade-in bg-sky-700" style="animation-delay: 0.7s">
                @if ($errors->has('password'))
                    {{ $errors->first('password') }}
                @endif
            </div>

            <!-- Remember Me & Forgot Password -->
            <div class="flex items-center justify-between my-6 text-white animate-fade-in"
                style="animation-delay: 0.8s">
                <label class="checkbox-container cursor-pointer">
                    <input type="checkbox" id="remember_me" name="remember">
                    <span class="checkmark"></span>
                    <span class="ms-2 text-sm">Remember me</span>
                </label>
                @if (Route::has('password.request'))
                    <a href="{{ route('password.request') }}" class="link-text text-sm">Forgot password?</a>
                @endif
            </div>

            <button type="submit" class="auth-btn py-4 rounded-[25px] text-base mt-2 animate-slide-up"
                style="animation-delay: 0.9s">
                Log In
            </button>

            {{-- <div class="text-center mt-8 text-white animate-fade-in" style="animation-delay: 1s">
                <p>Don't have an account? <a href="{{ route('register') }}" class="link-text">Register</a></p>
            </div> --}}
        </form>
    </div>
</body>

</html>
