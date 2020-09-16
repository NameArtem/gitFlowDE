# Data Engineer templates :rocket:

> Здесь вы найдете набор шаблонов для проектов data engineer'a. Каждый проект содержит набор шаблонов:
* `project` - шаблон базового проекта инженера
* `ad-hoc` - расширяемый шаблон для срочных / временных задач
* `queryLib` - шаблон (с pl\sql скриптами) для инженера sql

> На основе данных шаблнов можно создать git template ([git doc](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-template-repository))

--------------
> Проект содержит  набор файлов для упрощения использования git (смотри [Usage](#usage))

> Ознакомиться со [статьей]() о DE git flow

<br>

### Содержание :pencil:
* [Использование](#usage)
* [Полезности](#usage_h)
* [Contributing & Collaborating & CodeReviewing](#contributing-collaborating-codeReviewing)
* [Изменения](#changelog)
* [To-Do](#to-do)
* [Релизы](#releases)

<br>

### Использование :construction_worker:

> **[!]** Проект используется в рамках git flow DE. Для упрощения работы со схемой git flow DE можно использовать следующие скрипты (на их основе разработать / доработать свой процесс)

<a name="usage"></a>

#### createTemplate.sh
```bash
# создание / разворачивание проекта


bash createTemplate.sh PROJECT_TYPE -bb branchName

# PROJECT_TYPE - project type
# -bb - ключ для добавления базовых веток (git flow). Без веток -n
# branchName - имя ветки с который вы начнете данный проект (базовая ветка: master, dev & etc)

# доступные ветки "dev, feature, fix, adhoc, integration, release, held, controlTest"
```

-------------

#### changeAddOrigin.sh

```bash
# изменение или добавлене удаленного репозитория

bash changeAddOrigin.sh -a remote_name path

# -a - ключ действия (доступны -a - добавить / -c - изменить / -r - переименовать)
# remote_name - имя ориджина которое будет использоваться
# paht - путь до удаленного репозитория (пример ssh/https://some_path)

```

-------------

#### addBranch.sh

```bash
# добавить новую ветку и начать в ней работу

bash addBranch.sh branch task

# branch - имя ветки, которую вы хотите добавить
# task - наименование задачи для которой создается ветка
```

-------------

#### push.sh

```bash
# загрузка проекта на удаленный репозиторий

bash push.sh -type remote branch

# -type - указать тип загрузки изменени на удаленный репозиторий (доступные типы: -c - обычный тип загрузки в текущий ориджин и ветку / -s - установка ориджина и ветки куда будет совершена загрузка)
# remote - имя ориджина (если тип -s)
# branch - имя ветки (если тип -s)
```


-------------

#### pull.sh

```bash
# загрузка проекта из удаленного репозитория

bash pull.sh -r branch remote

# -r - тип пулл процесса (доступные: -r = rebase | -nr - без rebase)
# branch - установить ветку из которой будет загрузка
# remote - установка ориджин ( если ветка установлена, то обязательно установить ориджин)
```


-------------

#### mergeTo.sh

```bash
# мердж процесс ветки в основную ветку

bash mergeTo.sh branch

# branch - имя ветки куда будет слияние
```


### Полезности :sparkles:

> **[!]** Полезные скрипты, которые делают git flow проще

<a name="usage_h"></a>

#### createSSHKey.sh

```bash
# добавление ключа ssh для git (работаем с git без логина/пароля)

bash createSSHKey.sh
```




### Contributing & Collaborating & CodeReviewing :label:

<a name="contributing-collaborating-codeReviewing"></a>

> **[!]** Ссыли на правила взаимодействия по проекту.

Для крос-командного проекта необходимо вести следующие документы:

* [CONTRIBUTING.md](templates/project/CONTRIBUTING.md)

* [COLLABORATING.md](templates/project/COLLABORATING.md)

Для всех проектов код ревью:

* [CODEREVIEW.md](templates/project/CODEREVIEW.md)



### Изменения :white_check_mark:

<a name="changelog"></a>

 - [x] Добавлены (но не тестированы) скрипты - автоматизаторы github
 - [x] Добавлены шаблоны


### To-Do :construction:

<a name="to-do"></a>

- [ ] Тестирование и доработка скриптов
- [x] Внедрить шаблон spark - project
- [ ] Внедрить шаблон отчетов (профилирование данных, тестирование кода, профилирование модели (машинного обучения))



### Релизы :bookmark:

<a name="releases"></a>

* v.0.1 - релиз для статьи о DE git flow (сделан MVP процесса, готов к публикации)
* v.0.1.1 - релиз с pyspark template (шаблоне переносится, не добавляется кодом)
