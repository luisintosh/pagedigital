# Project

[page.digital](https://page.digital)

![Home screen](https://i.imgur.com/1sumxUL.png)
![Dashboard](https://i.imgur.com/UKiR5ib.png)
![Create link](https://i.imgur.com/vhGBr0G.png)

## Install

### Clone the repository

```shell
git clone git@github.com:/luisintosh/pagedigital.git
cd pagedigital
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.1.0`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 3.1.0
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
bundle && yarn
```

### Set environment variables

TODO

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

### Add heroku remotes

Using [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli):

```shell
heroku git:remote -a project
heroku git:remote --remote heroku-staging -a project-staging
```

## Serve

```shell
rails s
```

## Deploy

### With Heroku pipeline (recommended)

Push to Heroku staging remote:

```shell
git push heroku-staging
```

Go to the Heroku Dashboard and [promote the app to production](https://devcenter.heroku.com/articles/pipelines) or use Heroku CLI:

```shell
heroku pipelines:promote -a project-staging
```

### Directly to production (not recommended)

Push to Heroku production remote:

```shell
git push heroku
```
