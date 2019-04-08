#! /usr/bin/perl -w 

use strict; 
use DBI;  

my $driver = "mysql"; 

my $database = "ConTo"; 

my $dsn = "DBI:$driver:database=$database"; 

my $userid = "root"; 

my $password = ""; 


my $dbh = DBI->connect($dsn, $userid, $password) or die $DBI::errstr; 


my $sql = <<'END_SQL';
CREATE TABLE people (
  id       INTEGER PRIMARY KEY,
  name    VARCHAR(100),
  email    VARCHAR(100),
  password VARCHAR(20)
)
END_SQL
 
 $dbh->do($sql);


# INSERT SQL QUERY 

 my $name = 'Ada'; 
 my $mail = 'ada@gmail.com'; 
 my $pwd = '1234'; 

 
# $dbh->do($insert);

$dbh->do('INSERT INTO people (id, name, email, password) VALUES (?, ?, ?, ?)', undef, 1, $name, $mail, $pwd);

if ( $dbh ) 
{
    print "query - ok"; 
}
 else
{ 
    print "query - not ok"; 
} 

