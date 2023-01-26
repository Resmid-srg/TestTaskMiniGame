# TestTaskMiniGame

- Приложение реализовано на архитектуре MVVM.
В данной ситуации уместно было бы применить и MVC, так как приложение с легкой логикой, не требует написания тестов и это бы не повлияло на качество исполнения. MVP архитектура лучше разгружает контроллер, также как и MVVM, происходит полное раздеоение ответсвенностей, но имеет более императивную философию исполнения. Я решил применить архитектуру MVVM для реализации реактивного реагирования валидатора на вводимое значение при загадывании числа и реализации обработки отгадывания чисел компьютером и игроком. Помимо этого, остается возможность легкой реализации юнит тестов.

- Для биндинга View и ViewModel реализован класс Dynamic

- Компьютер отгадывает число радомными числами в урезающемся диапазоне, а не бинарным поиском (так было бы не интересно играть)

- Реализована анимация в валидаторе при загадывании числа и при отгадывании числа компьютера 

- Реализована поддержка темной темы

- Для удобства верстки повторяющийхся элементов созданы Extensions, добавлены основные цвета в Ассеты, а так же применен кусочек SwiftUI для работы режима Canvas
