# R language
R is a free software environment/programming language for statistical computing 
and graphics. 

## Install R 

You can install R in unix or windows, I have installed R on mac via 

```
brew install R
```

Just google and find how to install R on windows. 

## R shell

After install you can go to a R shell via terminal. Open terminal and enter
`R`. You will be on R shell. You can run R commands and examples from this shell. 


# HappyR 

This project contains some examples on integrating R programming lanageuage 
with mysql

## Set up mysql 

Before running this example you have to install mysql on your computer and set up the 
database 

### Install 

I'm running mysql with docker. Simply install docker on your computer and run 
following command on terminal. Docker will setup mysql for you

```
docker run -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d mysql
```

If you manually install mysql on the computer, make sure to set the root
password as `root`

### Setup database 

I'm creating database `senz` and table `owls` on that database

```
create database senz;
use senz;
create table owls (
    id int not null auto_increment primary key, 
    name varchar(64), 
    phone varchar(64)
);
```

## Run project

### Install RMySQL

Before run the example you have to install R mysql package, type `R` on command
prompt(it will take you to R shell). Then execute 

```
install.packages("RMySQL")
```

### Run program

R programs can run with `Rscript` command.

```
Rscript db.R
```
