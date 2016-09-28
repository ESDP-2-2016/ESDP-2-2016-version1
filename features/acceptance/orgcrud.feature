#language: ru

Функционал: Регистрация Организации
  @login
  Сценарий: Регистрация новой организации
    Допустим я на странице юзера "/organizations/new"
    Когда введу "Organization1" в поле "Name"
    И введу "chuy" в поле "Location"
    Когда выбираю "Детский дом" в поле "Organization category"
    И выбираю "Баткенская область" в поле "Oblast"
    И кликаю на  "Зарегистрировать"
    Тогда должен на главную страницу

  @logadmin
  Сценарий: Активация Организации
    Допустим я на странице админ "/admin/organizations"
    И I follow "Edit" for "Organization1"
    И radio "Yes" в поле "Active"