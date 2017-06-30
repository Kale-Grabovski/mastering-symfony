Mastering Symfony by Sohail Saheli
=============

```
bin/console doctrine:migrations:diff
bin/console doctrine:migrations:migrate
```

```
bin/console doctrine:mapping:import --force AppBundle annotation
```

```
bin/console doctrine:generate:entities AppBundle:Users
bin/console doctrine:generate:entities AppBundle:Task
bin/console doctrine:generate:entities AppBundle:Workspace
bin/console doctrine:generate:entities AppBundle:Project
```

```
bin/console doctrine:fixtures:load
```

```
bin/console doctrine:database:create --env=test
bin/console doctrine:schema:update --env=test --force
bin/console doctrine:fixtures:load --env=test
```
