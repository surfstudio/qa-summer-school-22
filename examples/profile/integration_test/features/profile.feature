#language: ru

  Функциональность: Профиль
    Сценарий: Успешное заполнение профиля данными
      Когда Я перехожу к редактированию профиля
      И Я указываю фамилию
      И Я указываю имя
      И Я указываю отчество
      И Я указываю дату рождения
      И Я перехожу далее для выбора города
      И Я выбираю город
      И Я перехожу далее на список интересов
      И Я указываю интересы
      И Я перехожу далее на экран информации о себе
      И Я указываю информацию о себе и сохраняю данные
      И Я снова перехожу к редактированию профиля
      Тогда Я вижу указанные ФИО
      И Я вижу указанную дату рождения
      Когда Я перехожу далее для проверки города
      Тогда Я вижу указанный город
      Когда Я перехожу далее для проверки интересов
      Тогда Я вижу указанные интересы
      Когда Я перехожу далее для проверки информации о себе
      Тогда Я вижу указанную информацию о себе