#language: ru

  Функционал: Аутентификация админа

  Сценарий: Логин админа
    Допустим я на странице "/admin/login"
    И ввожу в поле "Email" текст "admin@example.com"
    И ввожу в поле "Password" текст "123456"
    И кликаю на кнопку "Login"
    И должен увидеть текст "Signed in successfully"