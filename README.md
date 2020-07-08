# Git flow for DE/DS
> Этот проект содержит шаблон git flow для Data Engineers / Data Scientists 
> Шаблоны проектов можно сделать отдельными репозиториями в [git](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-template-repository)

### Содержание

* [Info](#info)
* [Инспользование](#using)

### Info

* Шаблон [AdHoc](https://github.com/NameArtem/gitFlowDE/tree/master/template/adHoc)
* Шаблон [базового проекта DS/DE](https://github.com/NameArtem/gitFlowDE/tree/master/template/project)

`описать, как разворачивать`

### Использование

**Создание проекта (по шаблону) **

Загрузка шаблона проекта выполняется скриптом `createTemplate.sh`. 

```bash
bash createTemplate.sh ТИП_ПРОЕКТА -ACTION БАЗОВАЯ_ВЕТКА

# доступные -ACTION (определение способа действия)
# -bb - включить базовые ветки
# -n - шаблон без веток
```

------------------------

**Загрузка проекта**

Загрузка проекта с git осуществлена в `pull.sh`. 

```bash
bash pull.sh -r ИМЯ_ВЕТКИ ИМЯ_REMOTE

# доступные -ACTION (определение способа действия)
# -r - rebase (с интеграцией изменений в текущую ветку)
# -nr - no rebase (просто получить проект с remote)
```

**Загрузка проекта на гит**

Автоматизация загрузки проекта на git `push.sh`. 

```bash
bash push.sh -ACTION ИМЯ_REMOTE В_ВЕТКУ

# доступные -ACTION (определение способа действия)
# -с - загрузить по обычному (имя remote и название ветки не требуется). Быстрый и простой способ
# -s - указать имя remote и название ветки куда будет делаться коммит

```


**Мердж**

Для быстрого мерджа проекта используйте  `mergeTo.sh`. В текущую ветку, которой вы нахолитесь, будет добавлены изменения из другой ветки

```bash
bash mergeTo.sh ИЗ_ВЕТКИ
```


**Создание/Изменение origin**

Для добавления или изменения GIT репозитория проекта, можно воспользоваться файлом `changeAddOrigin.sh`. 

```bash
bash changeAddOrigin.sh -ACTYION REMOTE_ИМЯ GIT_ПУТЬ

# доступные -ACTION (определение способа действия)
# -a - add  (добавить)
# -c - change (изменит)
# -r - rename (перименовать)
```

**Создание ветки**

Для добавления новой ветки, которая не входит в базовый шаблон (так как они уже добавлены), можно воспользоваться файлом `addBranch.sh`. 

```bash
bash addBranch.sh ИМЯ_РОДИТЕЛЬСКОЙ_ВЕТКИ ЗАДАЧА_В_TASK_MANAGER
```


**Создание SSH ключа**

Д `bash createSSHKey.sh`. 

```bash
bash createSSHKey.sh
```






### To-Do

- [ ] - сделать слияние двух проектов


