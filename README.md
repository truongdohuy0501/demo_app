# Project

[Blog in Heroku](https://guarded-stream-48915.herokuapp.com/)

### Install dependencies

Using [Brew](https://brew.sh/) and [Yarn](https://github.com/yarnpkg/yarn):

```shell
 brew update
 brew install elasticsearch
 brew services start elasticsearch
```

### Deploying to Heroku

Using Bonsai addon:

```shell
heroku addons:create bonsai
```

Build the index:

```shell
heroku run rake searchkick:reindex CLASS=Articles
```

## Resource Path

### Root
  Article#index 

### New Article
  /articles/new

### Show Article
  /articles/:id

### New Post
  /articles/:article_id/post/new

### Search Article (Title or Text)
  /search

...