library(RMySQL)

"
Create mysql database connection and return it, Im running mysql with docker 
here, please refere README.md for more information
"
getConn = function() {
    conn = dbConnect(
        MySQL(), 
        user='root', 
        password='root', 
        dbname='senz', 
        host='dev.localhost'
    )

    return(conn)
}

"
Read data from owls table and print them, I have used two ways to querying the 
data
"
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

"
Inset data into owls table, simpley create insert query and exeucute it 
"
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
