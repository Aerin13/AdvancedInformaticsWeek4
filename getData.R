# Commands I used to install stuff
# install.packages('dbplyr', repos = "http://cran.us.r-project.org")
# install.packages('RSQLite', repos = "http://cran.us.r-project.org")
# Import libraries
library(dbplyr)
# Create a connection ("con") to a database file:
con <- DBI::dbConnect(RSQLite::SQLite(), "mtcars.sqlite3")
# Write our data frame to the database in a table called "mtcars"
DBI::dbWriteTable(con, "mtcars", mtcars, overwrite = TRUE)
# Disconnect from our database
DBI::dbDisconnect(con)