# Shuup deployment test

To try and containerise and run Shuup.

```shell script
docker build -t shuup .
docker run -p 8008:8000 shuup
```


## Running the template project
```shell script
docker-compose up
# run the following command when you want to create an admin account 
docker-compose run shuup python manage.py createsuperuser
```
### Access
- Shop page: http://localhost
- Admin page (need an admin account): http://localhost/sa/
### What changes?
- Change sqlite3 databasete to postgresql database, because there is an issue with sqlite3 when start the project.
- Implement the Nginx to solve the issue with static files.
