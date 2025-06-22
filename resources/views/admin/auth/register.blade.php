<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Andev Web | Register</title>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap"
        rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Open Sans', 'sans-serif'],
                    },
                    animation: {
                        'float-in': 'floatIn 0.5s ease-out forwards',
                        'fade-in': 'fadeIn 0.8s ease-out forwards',
                        'slide-up': 'slideUp 0.6s ease-out forwards',
                        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite'
                    },
                    keyframes: {
                        floatIn: {
                            '0%': {
                                transform: 'translateY(20px)',
                                opacity: '0'
                            },
                            '100%': {
                                transform: 'translateY(0)',
                                opacity: '1'
                            }
                        },
                        fadeIn: {
                            '0%': {
                                opacity: '0'
                            },
                            '100%': {
                                opacity: '1'
                            }
                        },
                        slideUp: {
                            '0%': {
                                transform: 'translateY(30px)',
                                opacity: '0'
                            },
                            '100%': {
                                transform: 'translateY(0)',
                                opacity: '1'
                            }
                        }
                    }
                }
            }
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Open Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
            position: relative;
            overflow-x: hidden;
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
            opacity: 0.9;
        }

        .glass-container {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.37);
            transition: all 0.4s ease;
            border-radius: 15px;
            width: 100%;
            max-width: 480px;
            padding: 40px 30px;
        }

        @media (min-width: 640px) {
            .glass-container {
                padding: 50px 40px;
            }
        }

        .glass-container:hover {
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.5);
            transform: translateY(-5px);
        }

        .form-title {
            position: relative;
            display: inline-block;
        }

        .form-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, #ffdde1, #ff9a9e);
            border-radius: 10px;
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.5s ease;
        }

        .glass-container:hover .form-title::after {
            transform: scaleX(1);
        }

        .input-field {
            position: relative;
            border-bottom: 2px solid rgba(255, 255, 255, 0.3);
            margin: 26px 0;
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
        .input-field input:not(:placeholder-shown)~label {
            font-size: 0.9rem;
            top: 10px;
            transform: translateY(-150%);
            color: #ffdde1;
        }

        .input-field i {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
        }

        .auth-btn {
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
            position: relative;
            overflow: hidden;
        }

        .auth-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }

        .auth-btn:hover::before {
            left: 100%;
        }

        .auth-btn:hover {
            color: #000000;
            background: rgba(255, 255, 255, 0.2);
            border-color: #ffffff;
        }

        .link-text {
            color: #ffdde1;
            text-decoration: none;
            position: relative;
        }

        .link-text::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 1px;
            background: #ffdde1;
            transition: width 0.3s ease;
        }

        .link-text:hover::after {
            width: 100%;
        }

        .password-strength {
            height: 4px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 2px;
            margin-top: 8px;
            overflow: hidden;
        }

        .strength-meter {
            height: 100%;
            width: 0;
            transition: width 0.4s ease, background 0.4s ease;
        }

        .bubble {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 15s infinite linear;
            z-index: -1;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }

            100% {
                transform: translateY(-100vh) rotate(360deg);
            }
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .checkbox-container input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
            height: 0;
            width: 0;
        }

        .checkmark {
            position: relative;
            height: 20px;
            width: 20px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 4px;
            margin-right: 10px;
            transition: all 0.3s ease;
        }

        .checkbox-container input:checked~.checkmark {
            background: #ffdde1;
        }

        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
            left: 7px;
            top: 3px;
            width: 5px;
            height: 10px;
            border: solid #271930;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }

        .checkbox-container input:checked~.checkmark:after {
            display: block;
        }
    </style>
</head>

<body>
    <!-- Decorative bubbles -->
    <div class="bubble w-8 h-8 -left-4 top-1/4" style="animation-delay: 0s"></div>
    <div class="bubble w-12 h-12 right-10 top-1/3" style="animation-delay: -2s"></div>
    <div class="bubble w-6 h-6 left-1/4 bottom-1/4" style="animation-delay: -5s"></div>
    <div class="bubble w-10 h-10 right-1/3 bottom-1/3" style="animation-delay: -8s"></div>
    <div class="bubble w-7 h-7 left-1/3 top-1/5" style="animation-delay: -11s"></div>

    <div class="glass-container animate-float-in opacity-0" style="animation-delay: 0.2s">
        <form class="flex flex-col">
            <h2 class="form-title text-3xl md:text-4xl mb-8 text-white text-center tracking-wide animate-fade-in">Create
                Account</h2>

            <div class="input-field animate-slide-up" style="animation-delay: 0.4s">
                <input type="text" id="name" required placeholder=" " class="pr-10">
                <label for="name">Full Name</label>
                <i class="fas fa-user"></i>
            </div>

            <div class="input-field animate-slide-up" style="animation-delay: 0.5s">
                <input type="email" id="email" required placeholder=" " class="pr-10">
                <label for="email">Email Address</label>
                <i class="fas fa-envelope"></i>
            </div>

            <div class="input-field animate-slide-up" style="animation-delay: 0.6s">
                <input type="password" id="password" required placeholder=" " class="pr-10">
                <label for="password">Password</label>
                <i class="fas fa-lock"></i>
                <div class="password-strength">
                    <div id="strength-meter" class="strength-meter"></div>
                </div>
            </div>

            <div class="input-field animate-slide-up" style="animation-delay: 0.7s">
                <input type="password" id="confirm-password" required placeholder=" " class="pr-10">
                <label for="confirm-password">Confirm Password</label>
                <i class="fas fa-lock"></i>
            </div>

            <div class="mt-4 animate-fade-in" style="animation-delay: 0.8s">
                <div class="checkbox-container">
                    <input type="checkbox" id="terms" required>
                    <span class="checkmark"></span>
                    <label for="terms" class="text-white text-sm cursor-pointer">
                        I agree to the <a href="#" class="link-text">Terms & Conditions</a>
                    </label>
                </div>

                <div class="checkbox-container mt-2">
                    <input type="checkbox" id="newsletter">
                    <span class="checkmark"></span>
                    <label for="newsletter" class="text-white text-sm cursor-pointer">
                        Subscribe to newsletter
                    </label>
                </div>
            </div>

            <button type="submit" class="auth-btn mt-6 py-4 animate-slide-up" style="animation-delay: 0.9s">
                Create Account
            </button>

            <div class="text-center mt-8 text-white animate-fade-in" style="animation-delay: 1s">
                <p>Already have an account? <a href="#" class="link-text">Sign In</a></p>
            </div>
        </form>
    </div>

    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <script>
        // Password strength indicator
        const passwordInput = document.getElementById('password');
        const strengthMeter = document.getElementById('strength-meter');

        passwordInput.addEventListener('input', function() {
            const password = this.value;
            let strength = 0;

            // Check password length
            if (password.length >= 8) strength += 25;
            if (password.length >= 12) strength += 15;

            // Check for mixed case
            if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/)) strength += 20;

            // Check for numbers
            if (password.match(/([0-9])/)) strength += 20;

            // Check for special characters
            if (password.match(/([!,@,#,$,%,^,&,*,?,_,~])/)) strength += 20;

            // Update strength meter
            strengthMeter.style.width = strength + '%';

            // Update strength meter color
            if (strength < 40) {
                strengthMeter.style.background = '#ff4757';
            } else if (strength < 70) {
                strengthMeter.style.background = '#ffa502';
            } else {
                strengthMeter.style.background = '#2ed573';
            }
        });

        // Form validation for password match
        const confirmPassword = document.getElementById('confirm-password');

        confirmPassword.addEventListener('input', function() {
            if (this.value !== passwordInput.value) {
                this.setCustomValidity('Passwords do not match');
            } else {
                this.setCustomValidity('');
            }
        });

        // Add floating bubbles
        function createBubbles() {
            const body = document.querySelector('body');
            const bubbleCount = 15;

            for (let i = 0; i < bubbleCount; i++) {
                const bubble = document.createElement('div');
                bubble.classList.add('bubble');

                // Random size
                const size = Math.random() * 30 + 10;
                bubble.style.width = `${size}px`;
                bubble.style.height = `${size}px`;

                // Random position
                bubble.style.left = `${Math.random() * 100}%`;
                bubble.style.top = `${Math.random() * 100}%`;

                // Random animation delay and duration
                const delay = -(Math.random() * 15);
                const duration = Math.random() * 20 + 15;
                bubble.style.animation = `float ${duration}s infinite linear`;
                bubble.style.animationDelay = `${delay}s`;

                body.appendChild(bubble);
            }
        }

        // Initialize when page loads
        document.addEventListener('DOMContentLoaded', function() {
            createBubbles();
        });
    </script>
</body>

</html>
