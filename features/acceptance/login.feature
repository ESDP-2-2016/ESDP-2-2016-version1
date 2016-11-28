#language: ru

Функционал: Авторизация пользователя

  Сценарий: Вход с систему с правильным паролем
    Допустим я на странице "/users/sign_in"
    Когда ввожу в поле "Email" текст "user2@example.com"
    И ввожу в поле "Password" текст "123456"
    И кликаю на кнопку "Log in"
    И должен увидеть текст "Signed in successfully."

  Сценарий: Регистрация нового пользователя
    Допустим я на странице "/users/sign_up"
    И ввожу в поле "Name" текст "Olga"
    И ввожу в поле "Phone" текст "558126394"
    И ввожу в поле "Email" текст "olga@example.com"
    И ввожу в поле "Password" текст "123456"
    И ввожу в поле "Password confirmation" текст "123456"
    И кликаю на кнопку "Sign up"
    И должен увидеть текст "Welcome! You have signed up successfully."