# load R mysql library 
# this library needs to be installed via below command
#   install.packages("RMySQL")
library(RMySQL)


# Create mysql database connection and return it, Im running mysql with docker 
# here, please refere README.md for more information
#   db username = root
#   db password = root
#   db name = senz
#   db host = localhost/127.0.0.1
getConn = function() {
    conn = dbConnect(
        MySQL(), 
        user='root', 
        password='root', 
        dbname='senz', 
        host='127.0.0.1'
    )

    return(conn)
}


# Read data from owls table and print them, I have used two ways to querying the 
# data
get = function() {
    # get database connection first
    conn = getConn()

    # select statement via frames
    rs = dbReadTable(conn, 'owls')
    print(rs)

    # select statement via raw sql query
    sql = "select * from owls"
    rs = dbSendQuery(conn, sql)
    data = fetch(rs)
    print(data)
    dbClearResult(rs)
}


# Inset data into owls table, simpley create insert query and exeucute it 
#   name = given name of owl
#   phone = given phone no of owl
put = function(name, phone) {
    # get database connection first
    conn = getConn()

    # insert statement
    sql <- sprintf("insert into owls(name, phone) values('%s', '%s')", name, phone)
    rs = dbSendQuery(conn, sql)
    dbClearResult(rs)
}

# insert some data
put("python", "067723232")
put("java", "07782323")

# read data
get()
