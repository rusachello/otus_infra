#### HW

1. Рассмотрел вариант использования тегов в playbook, сделал playbook "все в одном" с разделением тегами. По пути посмотрел как работать с шаблонами Jinja2, понял как работают handlers
2. Заменил теги в сценарии на группы хостов, к которым разные части сценария применяются. Дописал сценарий для деплоя самостоятельно.
3. Поделил наш playbook на несколько более мелких, чтобы на каждую роль был свой playbook + общий деплой, переименовал старые playbook'и. Сделал playbook site.yml который делает import_playbook для всех playbook'ов, учавствующих в развертывани.
4. Переписал provision для packer. Для этого создали два playbook packer_app.yml и packer_db.yml и изменили соответствующим образом db.json и app.json, после чего запаковал новые образы.
5. Проверил работоспособность приложения - все в порядке.


