library(tidyverse)
ggplot(diamonds,aes(carat,price)) +
  geom_hex()
ggsave("diamonds.pdf")
write_csv(diamonds,"diamonds.cvs")

#chapter 10
library(tidyverse)
as_tibble(iris)
tibble(
  x = 1:5,
  y =1 ,
  z = x^2 +y
)

tb <- tibble(
  `:)` = "smile",
  ` `  = "space",
  `2000` = "unmber"
)
tb

tribble(
  ~x,~y,~z,
  "a",2,3.6,
  "b",1,8.5
)

tibble(
  a = lubridate :: now() + runif(1e3) * 86400,
  b = lubridate :: today() + runif(1e3) * 30,
  c = 1: 1e3,
  d = runif(1e3),
  e = sample(letters,1e3,replace = T)
)

nycflights13::flights %>%
  print(n = 10,width = Inf)

nycflights13::flights %>%
  view()

df <- tibble(
  x = runif(5),
  y = runif(5)
)

df$x
df[["x"]]
df[[1]]

df %>% .$x
df %>% .[["x"]]

class(mtcars)
mtcars
mtcars_tb <- as.tibble(mtcars)
class(mtcars_tb)

df <- data.frame(abc = 1,xyz = "a")
class(df$x)
class(df[,"xyz"])
class(df[,c("abc","xyz")])

var <- "mpg"
mtcars_tb[[`var`]]

annoying <- tibble(
  `1` = 1:10,
  `2` = `1`*2 +rnorm(length(`1`))
)

annoying %>%
  .$"1"
ggplot(annoying) +
  geom_point(aes(`1`,`2`))
annoying <- annoying %>%
  mutate(`3` = `2`/`1`)
names(annoying) <- c("one","two","three")
annoying

#chapter 11
library(tidyverse)
heights <- read_csv("data/heights.csv")
read_csv("a,b,c
         1,2,3
         4,5,6")
read_csv("The first line of metadata
         The second line of metadata
         x, y,z
         1,2,3",skip = 2)
read_csv("# A comment I want to skip
         x,y,z
         1,2,3",comment = "#")

read_csv("1,2,3\n4,5,6",col_names = F)

read_csv("1,2,3\n4,5,6",col_names = c("x","y","z"))

read_csv("a,b,c\n1,2,.",na = ".")

read_delim("a|b|c\n4|5|6",delim = "|")

read_fwf("a  b  c\n4  5  6",col_positions = fwf_widths(8))

read_csv("x,y\n1,`a,b`",quote = "`")  

read_csv("a,b,c\n1,2,3\n4,5,6")

read_csv("a,b,c\n1,2\n1,2,3,4")

read_csv("a,b\n\"1")

read_csv("a,b\n1,2\na,b")

read_csv2("a;b\n1;3")

str(parse_logical(c("TRUE","FALSE","NA")))
str(c("TRUE","FALSE","NA"))
str(parse_integer(c("1","2","3")))
str(c("1","2","3"))
str(parse_date(c("2010-01-01","1979-10-14")))
str(c("2010-01-01","1979-10-14"))

parse_integer(c("1","231",".","456"),na = ".")

x <- parse_integer(c("123","345","abc","123.45"))
x
problems(x)

parse_double("1.23")
parse_double("1,23",locale = locale(decimal_mark =  ","))


parse_number("$100")
parse_number("20%")
parse_number("It cost $123.456")

charToRaw("hadley")

x1 <- "El Ni\xf10 was particularly bad this year"
x2 <- "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"

parse_character(x1,locale = locale(encoding = "Latin1"))
parse_character(x2,locale = locale(encoding = "Shift-JIS"))

guess_encoding(charToRaw(x1))
guess_encoding(charToRaw(x2))

fruit <- c("apple","banana")
parse_factor(c("apple","banana","bananana"),levels = fruit)

parse_datetime("2010-10-01T2010")
parse_datetime("20101010")

parse_date("2010-10-01")

library(hms)
parse_time("01:10 am")
parse_time("20:10:01")

parse_date("01/02/15","%m/%d/%y")
parse_date("01/02/15","%d/%m/%y")
parse_date("01/02/05","%y/%m/%d")

parse_date("1 janvier 2015","%d %B %Y",locale = locale("fr"))


d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)","July 1 (2015)")
d5 <- "12/30/14"
t1 <- "1705"
t2 <- "11:15:10.12 PM"

parse_date(d1, "%B %d, %Y")
parse_date(d2,"%Y-%b-%d")
parse_date(d3,"%d-%b-%Y")
parse_date(d4,"%B %d (%Y)")
parse_date(d5,"%m/%d/%y")
parse_time(t1,"%H%M")
parse_time(t2,"%I:%M:%OS %p")

guess_parser("2010-10-10")
guess_parser("15:01")
guess_parser(c("TRUE","FALSE"))
guess_parser(c("1","5","9"))
guess_parser(c("12,352,561"))

challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)
tail(challenge)
challenge <- read_csv(
  readr_example("challenge.csv"),
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)
tail(challenge)

challenge2 <- read_csv(readr_example("challenge.csv"),guess_max = 1001)
tail(challenge2)

challenge3 <- read_csv(readr_example("challenge.csv"),
                       col_types =cols(.default = col_character()) )
tail(challenge3)

df <- tribble(
  ~x , ~y,
  "1","1.21",
  "2","2.32",
  "3","4.56"
)

df
type_convert(df)

write_csv(challenge,"challenge.csv")
challenge
write_csv(challenge,"challenge-2.csv")
read_csv("challenge-2.csv")

write_rds(challenge,"challenge.rds")
read_rds("challenge.rds")

library(feather)
write_feather(challenge,"challenge.feather")
read_feather("challenge.feather")

#haven\readxl\DBI

#chapter 12
library(tidyverse)
table1
table2
table3
table4a
table4b
table5

table1 %>%
  mutate(rate = cases / population * 10000)
table1 %>%
  count(year,wt = cases)

ggplot(table1,aes(year,cases)) +
  geom_line(aes(group = country),color = "grey50") +
  geom_point(aes(colour = country))

table1
table4a
table4b

tidy4a <- table4a %>%
  pivot_longer(c(`1999`,`2000`),names_to = "year",values_to = "cases")
tidy4b <- table4b %>%
  pivot_longer(c(`1999`,`2000`),names_to = "year",values_to = "population")
left_join(tidy4a,tidy4b)

table2
pivot_wider(table2,names_from = type,values_from = count)

stocks <- tibble(
  year = c(2015,2015,2016,2016),
  half = c(1,2,1,2),
  return = c(1.88,0.59,0.92,0.17)
)
stocks
stocks %>%
  pivot_wider(names_from = year,values_from = return) %>%
  pivot_longer(`2015`:`2016`,names_to = "year",values_to = "return"
               ,names_ptype = list(year = double()))
table4a %>%
  pivot_longer(c(`1999`,`2000`),names_to = "year",values_to = "cases")

people <- tribble(
  ~name,~names,~values,
  "Phillip Woods","age",45,
  "Phillip Woods","height",186,
  "Phillip Woods","age",50,
  "Jessica Cordero","age",37,
  "Jessica Cordero","height",156
)
people %>% 
  pivot_wider(names_from = names,values_from = values)


people %>%
  mutate(
    names2 = c("age1","height","age2","age1","height")
  ) %>%
  pivot_wider(names_from = names2,values_from = values)

preg <- tribble(
  ~pregnant,~male,~female,
  "yes",NA,10,
  "no",20,12
)
preg %>%
  pivot_longer(c("male","female"),names_to = "gender",values_to = "count")

table3 %>%
  separate(rate,sep = "/",into = c("cases","population"),convert = T)

table3 %>%
  separate(year,into = c("century","year"),sep = 2)

table5 %>%
  unite(date,century,year,sep = "")

tibble(x = c("a,b,c","d,e,f,g","h,i,j")) %>%
  separate(x,c("one","two","three"),extra = "warn")

tibble(x = c("a,b,c","d,e,f,g","h,i,j")) %>%
  separate(x,c("one","two","three"),extra = "merge")

tibble(x = c("a,b,c","d,e,f,g","h,i,j")) %>%
  separate(x,c("one","two","three"),extra = "drop")

tibble(x = c("a,b,c","d,e,f,g","h,i,j")) %>%
  separate(x,c("one","two","three"),fill = "warn")
tibble(x = c("a,b,c","d,e,f,g","h,i,j")) %>%
  separate(x,c("one","two","three"),fill = "left")
tibble(x = c("a,b,c","d,e,f,g","h,i,j")) %>%
  separate(x,c("one","two","three"),fill = "right")


table5 %>%
  unite(date,century,year,sep = "",remove = T)

stocks <- tibble(
  year = c(2015,2015,2015,2015,2016,2016,2016),
  qtr = c(1,2,3,4,2,3,4),
  return = c(1.88,0.59,0.35,NA,0.92,0.17,2.66)
)
stocks
stocks %>%
  pivot_wider(names_from = year,values_from = return) %>%
  pivot_longer(
    cols = c(`2015`,`2016`),
    names_to = "year",
    values_to = "return",
    values_drop_na = T)

stocks %>%
  complete(year,qtr)

treatment <- tribble(
  ~person,~treatment,~response,
  "Derrick Whitmore",1,7,
  NA,2,10,
  NA,3,9,
  "Katherine Burke",1,4
)
treatment %>%
  fill(person)


fish_encounters %>%
  pivot_wider(names_from = station, values_from = seen, values_fill = 0)

?complete

library(dplyr, warn.conflicts = FALSE)
df <- tibble(
  group = c(1:2, 1),
  item_id = c(1:2, 2),
  item_name = c("a", "b", "b"),
  value1 = 1:3,
  value2 = 4:6
)
df %>% complete(group, nesting(item_id, item_name))
df %>% complete(group, nesting(item_id, item_name), fill = list(value1 = 0))

who

who1 <- who %>%
  pivot_longer(cols = new_sp_m014:newrel_f65,
               names_to = "key",
               values_to = "cases",
               values_drop_na = T)
who1 %>%
  count(key)

who2 <- who1 %>%
  mutate(names_from = stringr :: str_replace(key,"newrel","new_rel"))
who2
who3 <- who2 %>%
  separate(key,into = c("new","type","sexage"),sep = "_")
who3 %>%
  count(new)
who4 <- who3 %>%
  select(-new,-iso2,-iso3)
who4
who5 <- who4 %>%
  separate(col = sexage,into = c("sex","age"),sep = 1)
who5

who5 %>%
  group_by(country) %>%
  summarise(
    n_country = sum(cases)
  ) %>%
  ggplot(aes(country,n_country)) +
  geom_point() +
  coord_flip()

who5 %>%
  group_by(year) %>%
  summarise(
    n_year = sum(cases)
  )  %>%
  ggplot(aes(year,n_year)) +
  geom_point() 

who5 %>%
  group_by(sex) %>%
  summarise(
    n_sex = sum(cases)
  )  %>%
  ggplot(aes(sex,n_sex)) +
  geom_bar(stat = "identity") 

#chapter 13
library(tidyverse)
library(nycflights13)
airlines
airports
planes
weather
flights

planes %>%
  count(tailnum) %>%
  filter(n >1)

weather %>%
  count(year,month,day,hour,origin) %>%
  filter(n > 1)

flights %>%
  count(year,month,day,flight) %>%
  filter(n > 1)
flights %>%
  mutate(
    rownumber = row_number()
  ) %>%
  select("rownumber",everything())

flights2 <- flights %>%
  select(year:day,hour,origin,dest,tailnum,carrier)
flights2

flights2 %>%
  select(-origin,-dest) %>%
  left_join(airlines,by = "carrier")

flights2 %>%
  mutate(name = airlines$name[match(carrier,airlines$carrier)])


x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  3,"x3"
)
y <- tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2",
  4,"y3"
)
x
y

x %>% 
  inner_join(y,by = "key")

x %>% 
  left_join(y,by = "key")
x %>% 
  right_join(y,by = "key")
x %>%
  full_join(y,by = "key")

x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  2,"x3",
  1,"x4"
)
y <- tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2"
)
x
y

left_join(x,y,by = "key")

x <- tribble(
  ~key,~val_x,
  1,"x1",
  2,"x2",
  2,"x3",
  3,"x4"
)
y <- tribble(
  ~key,~val_y,
  1,"y1",
  2,"y2",
  2,"y3",
  3,"y4"
)
left_join(x,y,by = "key")

flights2 %>%
  left_join(weather)

flights2 %>%
  left_join(planes,by = "tailnum")

flights2 %>%
  left_join(airports,by = c("dest" = "faa"))

flights2 %>%
  left_join(airports,by = c("origin" = "faa"))

flights %>%
  left_join(airports,c("dest" = "faa")) %>%
  group_by(dest) %>%
  mutate(
    ave_delay = mean(dep_delay,na.rm = T)
  ) %>%
  ggplot(aes(lon,lat)) +
  borders("state") +
  geom_point(aes(size = ave_delay)) +
  coord_quickmap()

flights %>%
  group_by(tailnum) %>%
  mutate(ave_delay = mean(dep_delay,na.rm = T)) %>%
  left_join(planes,by = "tailnum") %>%
  mutate(age = 2015 - year.y) %>%
  ggplot(aes(age,ave_delay)) +
  geom_point()

flights %>%
  left_join(weather) %>%
  group_by("wind_gust") %>%
  mutate(
    ave_delay = mean(dep_delay,na.rm = T)
  ) %>%
  ggplot(aes(wind_gust,ave_delay)) +
  geom_point()

parse_date("June 13 2013","%B %d %Y")

flights %>%
  left_join(airports,by = c("dest" = "faa")) %>%
  filter(year == 2013,month == 6,day == 13) %>%
  group_by(dest) %>%
  mutate(
    ave_delay = mean(dep_delay,na.rm = T) 
  ) %>%
  ggplot(aes(lat,lon)) +
  borders("state") +
  geom_point(aes(size = ave_delay)) +
  coord_quickmap()

top_dest <- flights %>%
  count(dest,sort = T) %>%
  head(10)
top_dest

flights %>%
  filter(dest %in% top_dest$dest)

flights %>%
  semi_join(top_dest)

flights %>%
  anti_join(planes,by = "tailnum") %>%
  count(tailnum,sort = T)

planes %>%
  left_join(flights,by = "tailnum") %>%
  anti_join(airlines,by = "carrier")

airports %>% count(lat,lon) %>% filter(n >1)


#chapter 14
library(tidyverse)
string1 <- "This is a string"
string2 <- 'If i want to include a "quote"  inside a string , i use the quotes'

double_quote <- "\""
single_quote <- '\''

backslash <- "\\"

x <- c("\"","\\")
x
writeLines(x)
x <- "\u00b5"
x
c("one","two","three")

str_length(c("a"," R for data science",NA))
str_c("X","y")
str_c("x","y",sep = ",")

x <- c("abc",NA)
str_c("|-",x,"-|")
str_c("|-",str_replace_na(x),"-|")

str_c("prefix-", c("a","b","c"),"-suffix")

name <- "Hadley"
time_of_day <- "morning"
birthday <- FALSE

str_c(
  "good ", time_of_day ," ", name,
  if (birthday) " and happy birthday",
  "."
)

str_c(c("x","y","z"),collapse = ",")  

x <- c("Apple","Banana","Pear")
str_sub(x,1,3)
str_sub(x,-3,-1)

str_sub(x,1,1) <- str_to_lower(str_sub(x,1,1))
x

str_to_upper(c("i","l"))
str_to_upper(c("i","l"),locale = "tr")

x <- c("apple","eggplant","banana")
str_sort(x,locale = "en")
str_sort(x,locale = "hwa")

str_c(c("a","b","c"),collapse = "|")

middle <- function(string = x) {
  ifelse((str_length(x) %% 2 == 0), 
         str_sub(x,str_length(x)/2,str_length(x)/2),
         str_sub(x,floor((str_length(x)+1)/2),ceiling((str_length(x)+1)/2)))
}
middle(x)

paste1 <- function(string = string) {
  if (is.character(string))
  { 
    if(all.equal(str_length(string)[1],str_length(string)[2],str_length(string)[3],1))
      step1 <- str_c(str_sub(string,1,1,collapse = ""))
    str_c(str_sub(step1,1,1," , "),str_sub(step1,1,1,)," and ",str_sub(step1,1,1)) 
    else
      step1 <- str_c(str_sub(string,1,str_length(string)),collapse = "")
    str_c(str_sub(step1,1,str_length(string)[1])," , ",
          str_sub(step1,str_length(string)[1],str_length(string)[2]),
          " and ",str_sub(step1,str_length(string)[2],str_length(string)[3])) 
  }
}
else print("wrong,the argument musy be a character vector!")
paste1(string = c("d","e","f"))
paste1(string = c(1,2,3))
paste1(string = c("","a","bc"))
str_length("")
str_sub("as",1,0)

x <- c("apple","banana","pear")
str_view(x,"na")
str_view(x,"\\.")

dot <- "\\."
writeLines(dot)
str_view(c("abc","a.b","cde"),dot)

x <- "a\\b"
str_view(x,"\\\\")

x <- c("apple","banana","pear")
str_view(x,"^a")
str_view(x,"a$")

x <- c("apple pie","apple","apple cake")
str_view(x,"apple")
str_view(x,"^apple$")

x <- c("$$^^$","$^$","^^%$#")
x
str_view(x,"\\$\\^\\$")

str_view(words,"^y",match = T)
str_view(words,"x$",match = T)
str_view(words,"^...$",match = T)
str_view(words,".......",match = T)

str_view(c("abc","a.c","a*c","a c"),pattern = "a[.]c")
str_view(c("abc","a.c","a*c","a c"),pattern = ".[*]c")
str_view(c("abc","a.c","a*c","a c"),pattern = "a[ ]")
str_view(c("grey","gray"),"gr(e|a)y")

str_view(words,"^[aeiou]",match = T)
str_view(words,"^[^aeiou][^aeiou][^aeiou]$",match = T)
str_view(words,"[^e]ed$",match = T)
str_view(words,"i(ng|se)",match = T)

str_view(words,".ei",match = T)
str_view(words,"q.",match = T)

x <- "1888 is the longest year in Roman numerals : MDCCCLXXXVIII"
str_view(x,"CC?")
str_view(x,"CC+")
str_view(x,"CC*")
str_view(x,'C[LX]+')

str_view(x,"C{2}")
str_view(x,"C{2,}")
str_view(x,"C{2,3}")

str_view(x,"C{2,3}?")
str_view(x,"C[LX]+?")

writeLines("\\{.+\\}")

str_view(words,"^[^aeiou]{3}",match = T)
str_view(words,"[aeiou]{3,}",match = T)
str_view(words,"([aeiou][^aeiou]){2,}",match = T)

str_view(fruit,"(..)\\1",match = T)
str_view(fruit,"(.)\\1\\1",match = T)
str_view(fruit,"(.)(.)\\2\\1",match = T)

str_view(c("abba","aaaabbb","abccba"),"(.)\\1\\1\\1")

str_view(c("abafa"),"(.).\\1.\\1")

str_view(c("abccba","abcdfecba","ascsadasf"),"(.)(.)(.).*\\3\\2\\1")

str_view(words,"^(.).*\\1$",match = T)
str_view(words,"(..).*\\1",match = T)
str_view(words,"(.).*\\1.*\\1",match = T)

x <- c("apple","banana","pear") 
str_detect(x,"e")

sum(str_detect(words,"^t"))
mean(str_detect(words,"[aeiou]$"))
no_vowels_1 <- !str_detect(words,"[aeiou]")
no_vowels_2 <- str_detect(words,"^[^aeiou]+$")
identical(no_vowels_1,no_vowels_2)
words[no_vowels_1]
str_view(words,"^[^aeiou]+$",match = T)

str_subset(words,"^[^aeiou]+$")

df <- tibble(
  word = words,
  i = seq_along(word)
)
df %>%
  filter(str_detect(word,"x$"))

str_count(x,"a")
words[parse_logical(as.character(str_count(words,"^[^aeiou]+$")))]

mean(str_count(words,"[aeiou]"))

df %>%
  mutate(
    vowels = str_count(word,"[aeiou]"),
    consonants = str_count(word,"[^aeiou]")
  )

str_count("abababa","aba")
str_view_all("abababa","aba")

words1 <- words[str_detect(words,"^x")]
words2 <- words[str_detect(words,"x$")]
union(words1,words2)
words

words1 <- words[str_detect(words,"^[aeiou]")]
words2 <- words[str_detect(words,"[^aeiou]$")]
unique(union(words1,words2))

words[str_detect(words,"a+e+i+o+u+")]

words[str_count(words,"[aeiou]") == max(str_count(words,"[aeiou]"))]

words[str_count(words,"[aeiou]")/str_length(words) ==
        max(str_count(words,"[aeiou]")/str_length(words))]
length(sentences)
sentences
head(sentences)
colours <- c("[^.]red","orange","yellow","green","blue","purple")
colour_match <- str_c(colours,collapse = "|")
colour_match
has_colour <- str_subset(sentences,colour_match)
matches <- str_extract(has_colour,colour_match)
matches

more <- sentences[str_count(sentences,colour_match) >1]
more
str_view_all(more,colour_match)

str_extract(more,colour_match)
str_extract_all(more,colour_match) 

str_extract_all(more,colour_match,simplify = T)

x <- c("a","a b","a b c")
str_extract_all(x,"[a-z]",simplify = T)


str_view(sentences,"[A-Z][a-z]+[\\']?[a-z]\\s*?",match = T)

str_extract(sentences,"[a-z]+ing")

str_extract(sentences,"[a-z]+s[^a-z]")

str_view(sentences,"(number) ([a-z]+)",match = T)

str_match(sentences,"([A-Z]?[a-z]+)(\\')([a-z]+)")

test <- "////////////asd///asd"
str_replace_all(test,"/","\\\\")

str_to_lower2 <- function(string = string) {
  str_replace_all(string,"[A-Z]+",tolower(str_extract(string,"[A-Z]+")))
}
str_to_lower2(string = test2)

change <- function(input = input) {
  first <- str_extract(input,"^[a-z]")
  last  <- str_extract(input,"[a-z]$")
  input1<- str_replace(input,"^[a-z]",last)
  str_replace(input1,"[a-z]$",first)
}
change(input = words)

x <- "apples, pears, and bananas"
str_split(x,boundary("word"))
str_split(x,"")

#chapter 16
library(tidyverse)
library(lubridate)
library(nycflights13)

today()
now()
ymd("2017-01-31")
mdy("02-01-2010")
dmy("02-02-0202")

ymd(20170908)
ymd_hms("2017-01-03 20:11:59")
mdy_hm("01/31/2017 08:01")

ymd(20190201,tz = "UTC")

flights %>%
  select(year,month,day,hour,minute) %>%
  mutate(
    departure = make_datetime(year,month,day,hour,minute))

make_datetime_100 <- function(year,month,day,time) {
  make_datetime(year,month,day,time %/% 100,time %% 100)
}

flights_dt <- flights %>%
  filter(!is.na(dep_time),!is.na(arr_time)) %>%
  mutate(
    dep_time = make_datetime_100(year,month,day,dep_time),
    arr_time = make_datetime_100(year,month,day,arr_time),
    sched_dep_time = make_datetime_100(year,month,day,sched_dep_time),
    sched_arr_time = make_datetime_100(year,month,day,sched_arr_time)
  ) %>%
  select(origin,dest,ends_with("delay"),ends_with("time"))
flights_dt

flights_dt %>%
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 86400)

flights_dt %>%
  filter(dep_time < ymd(20130102)) %>%
  ggplot(aes(dep_time)) +
  geom_freqpoly(binwidth = 600)

as_datetime(today())
as_datetime(now())
ymd(c("2010-10-10","banana"))

d1 <- "January 1,2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)","July 1 (2015)")
d5 <- "12/30/14"

parse_date(d1,"%B %d,%Y")
mdy(d1)
ymd(d2)
dmy(d3)
mdy(d4)
mdy(d5)

datetime <- ymd_hms("2016-07-08 12:34:56")
year(datetime)
month(datetime)
mday(datetime)
yday(datetime)
wday(datetime)

month(datetime,label = T)
wday(datetime,label = T,abbr = F)

flights_dt %>%
  mutate(
    wday = wday(dep_time,label = T)
  ) %>%
  ggplot(aes(wday)) +
  geom_bar()

flights_dt %>%
  mutate(minute = minute(dep_time)) %>%
  group_by(minute) %>%
  summarise(
    avg_delay = mean(dep_delay,na.rm = T),
    n = n()
  ) %>%
  ggplot(aes(minute,avg_delay)) +
  geom_line()

sched_dep <- flights_dt %>%
  mutate(minute = minute(sched_dep_time)) %>%
  group_by(minute) %>%
  summarise(
    avg_delay = mean(arr_delay,na.rm = T),
    n = n()
  )

ggplot(data = sched_dep,aes(minute,avg_delay)) +
  geom_line()

ggplot(sched_dep,aes(minute,n)) +
  geom_line()

flights_dt %>%
  count(week = floor_date(dep_time,unit = "week")) %>%
  ggplot(aes(week,n)) +
  geom_line()

datetime <- ymd_hms("2016-07-08 12:34:56")
datetime
year(datetime) <- 2020
month(datetime) <- 08
mday(datetime) <- 03
hour(datetime) <- 16
minute(datetime) <- 29
second(datetime) <- 30

update(datetime,year = 2020,month = 2,mday = 2,hour = 2)
ymd("2015-02-01") %>%
  update(mday = 30) %>%
  update(year = 2111)

flights_dt %>%
  mutate(dep_hour = update(dep_time,yday = 1)) %>%
  ggplot(aes(dep_hour)) +
  geom_freqpoly(binwidth = 300)

q1 <- flights_dt %>%
  mutate(
    day = yday(dep_time),
    minute = minute(dep_time),
  ) %>%
  group_by(minute) %>%
  summarise(
    day = day,
    n_minute = n()
  ) 

q1
ggplot(q1,aes(minute,n_minute,group = day)) +
  geom_line()

flights %>%
  select(dep_time,sched_dep_time,dep_delay) %>%
  mutate(equal = dep_time - sched_dep_time - dep_delay)

flights %>%
  select(dep_time,air_time,arr_time)

flights_dt %>%
  mutate(minute = minute(dep_time)) %>%
  group_by(minute) %>%
  summarise(
    avg_delay = mean(dep_delay,na.rm = T)
  ) %>%
  ggplot(aes(minute,avg_delay)) +
  geom_line()

flights_dt %>%
  mutate(day = day(dep_time)) %>%
  group_by(day) %>%
  summarise(
    avg_delay = mean(dep_delay,na.rm = T)
  ) %>%
  ggplot(aes(day,avg_delay)) +
  geom_line()

flights_dt %>%
  mutate(
    early = ifelse(dep_delay < 0,1,0),
    delay  = ifelse(dep_delay >= 0 ,1,0),
    minute = minute(dep_time)
  ) %>%
  group_by(minute) %>%
  summarise(
    n_early = sum(early),
    n_delay = sum(delay)
  ) %>%
  ggplot(aes(minute,n_delay)) +
  geom_line() + 
  geom_area(data = test3,fill = "yellow",alpha = 0.3) +
  ylim(0,8000)

test3 <- tibble(
  minute = c(20:30),
  n_delay = 8000
)

h_age <- today() - ymd(19960224)
h_age

as.duration(h_age)
dseconds(15)
dminutes(15)
dhours(c(12,24))
dweeks(1)
dyears(1)

2 * dyears(1)
dyears(1) + dweeks(12) +dhours(15)

tomorrow <- today() +ddays(1)
tomorrow
lastyear <- today() - dyears(1)
lastyear

one_pm <- ymd_hms("2016-03-12 13:00:00", tz = "America/New_York")
one_pm + ddays(1)

ymd(20160101) + dyears(1)
ymd(20160101) + years(1)

flights_dt %>%
  filter(arr_time < dep_time)

flights_dt <- flights_dt %>%
  mutate(
    overnight = arr_time < dep_time,
    arr_time = arr_time + days(overnight * 1),
    sched_arr_time = sched_arr_time + days(overnight * 1)
  )

flights_dt %>%
  filter(overnight,arr_time < dep_time)

next_year <- today() + years(1)
(today() %--% next_year) / ddays(1)

dmonths(1)
months(1)

date_2015 = ymd(20150101)
time = 0:11
year = -10:10
q3 <- date_2015 + months(time) 

ages <- function(birthday) {
  birthday <- parse_date(birthday,"%Y-%m-%d")
  age = year(today()) - year(birthday)
  print(age)
}
ages("1996-02-24")

(today() %--% (today() + years(1)))/months(1)

Sys.timezone()

length(OlsonNames())
head(OlsonNames())


#chapter 19
df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale01 <- function(x) {
  x <- ifelse(x == -Inf,0,x)
  x <- ifelse(x == Inf,1,x)
  rng <- range(x,na.rm = T)
  (x - rng[1]) / (rng[2] - rng[1])
}
x <-  c(1:10,Inf,-Inf)
rescale01(x)

summarise1 <- function(x) {
  na_prop <-  mean(is.na(x))
  x_prop  <-  x / sum(x,na.rm = T)
  x_scales <-  sd(x,na.rm = T) / mean(x,na.rm = T)
  tibble::tibble(
    na_prop = na_prop,
    x_prop = x_prop,
    x_scale = x_scales
  )
}
summarise1(c(1:10))

varskew <- function(x){
  xbar  <- mean(x,na.rm = T)
  debar <- x-xbar
  var   <- sum(debar^2,na.rm = T)/(sum(!is.na(x))-1)
  skewstep1 <-sum(debar^3,na.rm = T)/(sum(!is.na(x))-2)
  skew  <- skewstep1/var^(3/2)
  tibble::tibble(
    var = var,
    skew = skew
  )
}
varskew(x)
var(x,na.rm = T)

both_na <- function(x1,x2) {
  x1 <- which(is.na(x1))
  x2 <- which(is.na(x2))
  which <- intersect(x1,x2)
  tibble::tibble(
    where = which
  )
}
x = c(1,NA,NA,2,3,4,5,6,7,NA,NA)
y = c(2,3,NA,4,5,6,7,8,NA,10,NA)
both_na(x,y)


test_prefix <- function(string,prefix) {
  substr(string,1,nchar(prefix)) == prefix
}
add_prefix(string = "aaaaaajdlkasd",prefix = "aaaaa")

de_last <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
} 

repeat_1 <- function(x,y) {
  rep(y,length.out = length(x))
}
x <- c(1:5)
y <- c(1:6)
repeat_1(x,y)
rep(y,length.out =length(x))

library(lubridate)
greeting <- function(time = now()) {
  hour <- hour(time)
  if (hour <= 12 && time >= 0) {
    return("good morning!")
  } else if (hour > 12 && time <= 18) {
    return("good afternoon!") 
  } else {
    return("good evening!")
  }
}

fizzbuzz <- function(x) {
  if (x %% 15 == 0) {
    return("fizzbuzz")
  } else if (x %% 3 == 0) {
    return("fizz")
  }  else if (x %% 5 == 0) {
    return("buzz")
  } else {
    x
  }
}
fizzbuzz(18)
fizzbuzz(15)
fizzbuzz(20)

test <- function(x,y) {
  switch (y,
          a = ,
          b = "ab",
          c = ,
          d = "cd"
  )
}
test(x,y = "a")

wt_mean <- function(x, w, na.rm = F) {
  stopifnot(is.logical(na.rm),length(na.rm) == 1)
  stopifnot(length(x) == length(w))
  
  if(na.rm) {
    miss <- is.na(x)|is.na(w)
    x <- x[!miss]
    w <- w[!miss]
  }
  sum(w * x) / sum(w)
}

commas <- function(...)  stringr::str_c(...,collapse = "|")
commas(letters[1:10])

rule <- function(..., pad = "-+") {
  title <- paste0(...)
  width <- getOption("width") - nchar(title) -5
  cat(title," ",stringr::str_dup(pad,width/2),"\n",sep = "")
}
rule("Inmprotant output")
x <- rnorm(10)
mean(x)
mean(x,trim = 1)

show_missing <- function(df) {
  n <- sum(is.na(df))
  cat("Missing values: ", n, "\n", sep = "")
  
  invisible(df)
}
x <- show_missing(mtcars)
class(x)
dim(x)

`+` <- function(x,y) {
  if (runif(1) < 0.1) {
    sum(x,y)
  } else {
    sum(x,y) * 1.1
  }
}
table(replicate(1000,1 +2))

#chapter 20
library(tidyverse)
typeof(letters)
length(letters)
typeof(1:10)

x <- list("a","b",1:10)
x
length(x)
typeof(x)

1:10 %% 3 == 0
typeof(c(T,T,F,F))

typeof(1)
typeof(1L)

c(-1,0,1) / 0
is.infinite(1/0)
is.na(0/0)
is.nan(0/0)

x <- "This is a reasonably long string."
pryr::object_size(x)

y <- rep(x,100)
pryr::object_size(y)

(dplyr::near)
typeof(as.integer(c(1,2,3,4)))
typeof(parse_integer(c("1","2","3","4","5")))

x <- sample(20,100,replace = T)
y <- x > 10
y
sum(y)
mean(y)

last_value <- function(x) {
  x[length(x)]
}
last_value(c(1:10))

x <- c(rnorm(100),NA)
x[-which(x > 0)]
x[x <= 0]

x <- 1:10
names(x)
set_names(x,nm = letters[1:10])
x["m"]

x1 <- list(c(1,2),c(3,4))
x1
x2 <- list(list(1,2),list(3,4))
x2
x3 <- list(1,list(2,list(3)))
x3

a <- list(a = 1:3,b = "a string",c = pi,d = list(-1,-5))
a
str(a[c(1,2)])
str(a[[1]])
a
a[4]
a[[4]]
a[[4]][1]
a[[4]][[1]]

x <- 1:10
x
attr(x,"greeting") <- "Hi!"
attr(x,"farewell") <- "Bye!"
attributes(x)
attr(x,"names") <- letters[1:10] 
x
attr(x,"dimensions") <- c(2,5)
x

getS3method("as.Date","default")
getS3method("as.Date","numeric")

q2 <- tibble(
  x = 1:5,
  y = 1:10
)

q3 <- tibble(
  x = 1:5,
  y = list("A","b",1:10,T,F)
)
str(q3)
q3

#chapter 21
library(tidyverse)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

output <- vector("double",ncol(df))
for (i in seq_along(df)) {
  output[i] <- median(df[[i]])
}
output

output <- vector("double",ncol(mtcars))
for (i in seq_along(mtcars)) {
  output[i] <- mean(mtcars[[i]])
}
output

library(nycflights13)
type <- vector(mode = "character",length = ncol(flights))
for (i in seq_along(flights)) {
  type[i] <- typeof(flights[[i]]) 
}
type

number <- vector(mode = "integer",length = ncol(iris))
for ( i in seq_along(iris)) {
  number[i] <- length(unique(iris[[i]]))
}
number
iris
unique(iris[[5]])

output <- list("mean_-10" = c(1:10), "mean_0" = c(1:10), "mean_10" = c(1:10),
               "mean_100" = c(1:10))
mean_numb <- c(-10,0,10,100)
output
for ( i in seq_along(mean_numb)) {
  output[[i]] <- rnorm(10,mean = mean_numb[i])
}
output

out <- ""
for (x in letters) {
  out <- str_c(out,x)
}
out

str_c(letters,collapse = "")

x <- sample(100)
sd <- 0
for (i in seq_along(x)) {
  sd <- sd + (x[i] - mean(x)) ^ 2
}
sd <- sqrt(sd/length(x)-1)
sd

x <- runif(100)
out <- vector("numeric",length(x))
out[1] <- x[1]
for (i in 2:length(x)) {
  out[i] <- out[i-1] + x[i]
}
out
cumsum(x)

output <- vector("integer",length(x))
for (i in seq(x)) {
  output[i] <- length(x[[i]])
}
output
x <- list("a","abc",c("a","b","c"),1:10)

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
df
for (i in seq_along(df)) {
  df[[i]] <- rescale01(df[[i]])
}
df

x <- c(1:10)
names(x) <- c(letters[1:9],NULL)
x
for (nm in names(x)) {
  x[[nm]] <- x[[nm]] + 1
}
x

show_mean <- function(df) {
  output <- vector("numeric",0)
  for (nm in names(df)) {
    if (is.numeric(df[[nm]])) {
      mean <- mean(df[[nm]])
      output[[nm]] <- paste(nm,":",mean,collapse = " ")
    }
  }
  bind_cols(output)
}
show_mean(iris)

col_summary <- function(df,fun) {
  out <- vector("double",length(df))
  for (i in seq_along(df)) {
    out[i] <- fun(df[[i]])
  }
  out
}
col_summary(df,mean)
col_summary(df,fun = median)
col_summary(df,fun = sd)

map_dbl(df,mean)
map_dbl(df,median)
map_dbl(df,sd)
map_dbl(df,mean,trim = 0.5)

z <- list(x = 1:3, y = 4:5)
map_int(z,length)

models <- mtcars %>%
  split(.$cyl) %>%
  map(function(df) lm(mpg~wt,data = df))

models <- mtcars %>%
  split(.$cyl) %>%
  map(~lm(mpg ~ wt,data = .))

models %>%
  map(summary) %>%
  map_dbl(~.$r.squared)

models %>%
  map(summary) %>%
  map_dbl("r.squared")

x <- list(list(1,2,3),list(4,5,6),list(7,8,9))
x %>% map_dbl(2)

x1 <- list(
  c(0.27,0.37,0.57,0.91,0.20),
  c(0.90,0.94,0.66,0.63,0.06),
  c(0.21,0.18,0.69,0.38,0.77)
)
x2 <- list(
  c(0.50,0.72,0.99,0.38,0.78),
  c(0.93,0.21,0.65,0.13,0.27),
  c(0.39,0.01,0.38,0.87,0.34)
)

threshold <- function(x,cutoff = 0.8) x[ x > cutoff]
x1 %>% sapply(threshold) %>% str()
x2 %>% sapply(threshold) %>% str()

mtcars %>% map_dbl(mean)
flights %>% map_chr(typeof)
iris %>% map_dbl(function(df) length(unique(df)))

options(digits = 20)
mean_num <- list(`mean_-10` = -10,mean_0 = 0,mean_10 = 10,mean_100 = 100)
map_df(.x = mean_num, .f = rnorm, n = 10)


iris %>% map_lgl(is.factor)
map(1:5, runif)
map(c(-10,0,10,100),rnorm,n=10)
map(-2:2, rnorm, n = 5)
map_dbl(-2:2, rnorm, n = 5)
str(mtcars)

safe_log <- safely(log)
str(safe_log(10))
str(safe_log("a"))

x <- list(1,10,"a")
y <- x %>% map(safe_log)
str(y)

y <- y %>% transpose()
str(y)

is_ok <- y$error %>% map_lgl(is.null)
x[!is_ok]
y$result[is_ok] %>% flatten_dbl()

mu <- list(5,10,-3)
sigma <- list(1,5,10)
map2(mu,sigma,rnorm,n=5) %>% str()
n <- list(1,3,5)
args1 <- list(n, mu, sigma)
args1 %>%
  pmap(rnorm) %>%
  str()

args2 <- list(mean = mu, n = n, sd = sigma)
args2 %>% pmap(rnorm) %>% str()

params <- tribble(
  ~mean, ~sd, ~n,
  5,1,1,
  10,5,3,
  -3,10,5
)
params %>% pmap(rnorm)

f <- c("runif","rnorm","rpois")
param <- list(
  list(min = -1, max = 1),
  list(sd = 5),
  list(lambda = 10)
)

invoke_map(f,param,n = 5) %>% str()
sim <- tribble(
  ~f, ~params,
  "runif",list(min = -1, max =1),
  "rnorm",list(sd = 5),
  "rpois",list(lambda = 10)
)
sim %>% 
  mutate(sim = invoke_map(f,params,n = 10)) %>% str

x <- list(1,"a",3)

x %>% 
  walk(print)

plots <- mtcars %>%
  split(.$cyl) %>%
  map(~ggplot(.,aes(mpg,wt)) + geom_point())
paths <- str_c(names(plots),".pdf")
pwalk(list(paths,plots),ggsave,path = tempdir())


col_summary <- function(df,type) {
  df <- df[map_lgl(df,is.numeric)]
  switch(type,
         mean    = map_dbl(df,mean),
         sd      = map_dbl(df,sd),
         median  = map_dbl(df,median),
         summary = map(df,summary)
  )
}
col_summary(iris,type  = "sd")

col_sum3 <- function(df,f) {
  is_num <- sapply(df,is.numeric)
  df_num <- df[,is_num]
  
  sapply(df_num,f)
}
df <- tibble(
  x = 1:3,
  y = 3:1,
  z = c("a","b","C")
)
df
col_sum3(df,mean)
col_sum3(df,sd)
col_sum3(df,summary)
col_sum3(df,median)


#chapter 23
library(tidyverse)
library(modelr)
options(na.action = na.warn)

ggplot(sim1,aes(x,y)) +
  geom_point()

models <- tibble(
  a1 = runif(250,-20,40),
  a2 = runif(250,-5,5)
)
ggplot(sim1,aes(x,y)) +
  geom_point() +
  geom_abline(aes(intercept = a1, slope = a2),data = models,alpha = 0.4)

model1 <- function(a,data) {
  a[1] + data$x * a[2]
}

ggplot(sim1,aes(xjitter,y)) +
  geom_point(aes(xjitter,y)) +
  geom_abline(aes(intercept = 7, slope = 1.5)) +
  geom_segment(aes(x =xjitter, y = y,xend = xjitter, yend = ypred),
               color = "blue")

prediction <- sim1$x * 1.5 + 7
sim1$ypred <- prediction
sim1
sim1 <- sim1 %>%
  mutate(xjitter = jitter(x))

measure_distance <- function(mod,data) {
  diff <- data$y - model1(mod,data)
  sqrt(mean(diff^2))
}
measure_distance(c(7,1.5),sim1)

sim1_dist <- function(a1,a2) {
  measure_distance(c(a1,a2),sim1)
}

models <- models %>%
  mutate(dist = map2_dbl(a1,a2,sim1_dist))
models <- models %>%
  arrange(dist) %>%
  head(n =10)
ggplot(sim1,aes(x,y)) +
  geom_jitter() +
  geom_abline(aes(intercept = a1, slope = a2,
                  color = -dist),
              data = models,alpha = 0.4, size = 1)
ggplot(models,aes(a1,a2)) +
  geom_point(data = filter(models,rank(dist) <= 10),size = 4,color = "red") +
  geom_point(aes(color = -dist)) 

grid <- expand.grid(
  a1 = seq(-5,20,length = 25),
  a2 = seq(1,3, length = 25 )
) %>%
  mutate(dist = map2_dbl(a1,a2,sim1_dist))

ggplot(grid,aes(a1,a2)) +
  geom_point(data = filter(grid,rank(dist) <= 10),size = 4, color = "red") +
  geom_point(aes(color = -dist))

best <- optim(c(0,0),measure_distance,data = sim1)
best$par
ggplot(sim1,aes(x,y)) +
  geom_point(size = 2, color = "grey30") +
  geom_abline(intercept = best$par[1], slope = best$par[2])

sim1_mod <- lm(y ~ x,data = sim1) 
coef(sim1_mod)

sim1a <- tibble(
  x = rep(1:10,each = 3),
  y = x * 1.5 + 6 + rt(length(x),df = 2)
)
model1a <- lm(y ~ x,data = sim1a) 
ggplot(sim1a,aes(x,y)) +
  geom_point() +
  geom_abline(intercept = coef(model1a)[[1]],slope = coef(model1a)[[2]])

measure_distance <- function(mod,data) {
  diff <- data$y - model1(mod,data)
  mean(abs(diff))
}
best_2 <- optim(c(0,0),measure_distance,data = sim1)      
best_2$par
lm(data = sim1a,y ~ x )

grid <- sim1 %>% 
  data_grid(x)
grid <- grid %>% 
  add_predictions(sim1_mod)
grid

ggplot(sim1,aes(x,y)) +
  geom_point() +
  geom_line(data = grid,aes(y = pred),size = 1, color = "red" )

sim1 <-  sim1%>%
  add_residuals(sim1_mod)

ggplot(sim1,aes(resid)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(sim1,aes(x,resid)) +
  geom_ref_line(h = 0) +
  geom_point()

model_loess <- loess(y ~ x , data = sim1)
grid <- sim1 %>%
  data_grid(x) %>%
  add_predictions(model_loess)
grid
sim1 <- sim1 %>%
  add_residuals(model_loess)
ggplot(sim1,aes(x,y)) +
  geom_point() +
  geom_line(data = grid,aes(y = pred),col = "red",size = 4) +
  geom_smooth(se = F,color = "yellow")

ggplot(sim1,aes(x,resid)) +
  geom_point(shape = 18) +
  geom_ref_line(h = 0,colour = "green")


df <- tribble(
  ~sex,~response,
  "male",1,
  "female",2,
  "male",1
)
model_matrix(df, response ~ sex)

ggplot(sim2,aes(x,y)) +
  geom_point()

model2 <- lm(y ~ x, data = sim2)
grid <- sim2 %>%
  data_grid(x) %>%
  add_predictions(model2)

ggplot(sim2,aes(x)) +
  geom_point(aes(y = y)) +
  geom_point(data = grid,aes(y = pred),color = "red",size = 3)

ggplot(sim3,aes(x1,y)) +
  geom_point(aes(color = x2))

mod1 <- lm(y ~ x1 + x2, data = sim3)
mod2 <- lm(y ~ x1 * x2, data = sim3)

grid <- sim3 %>%
  data_grid(x1,x2) %>%
  gather_predictions(mod1,mod2)
grid

ggplot(sim3,aes(x1,y,color = x2)) +
  geom_point() +
  geom_line(data = grid,aes(y = pred)) +
  facet_wrap(~model)

sim3 <- sim3 %>%
  gather_residuals(mod1,mod2)

ggplot(sim3,aes(x1,resid,color = x2)) +
  geom_point() +
  facet_grid(model ~ x2)

mod1 <- lm(y ~ x1 + x2,data = sim4)
mod2 <- lm(y ~ x1 * x2,data = sim4)

grid <- sim4 %>%
  data_grid(
    x1 = seq_range(x1,5),
    x2 = seq_range(x2,5)
  ) %>%
  gather_predictions(mod1,mod2)
grid

ggplot(grid,aes(x1,x2)) +
  geom_tile(aes(fill = pred)) +
  facet_wrap( ~ model)

ggplot(grid,aes(x1,pred,color = x2, group = x2)) +
  geom_line() +
  facet_wrap(~model)

ggplot(grid,aes(x2,pred,color = x1, group = x1)) +
  geom_line() +
  facet_wrap( ~model)

df <-  tribble(
  ~y, ~x,
  1,1,
  2,2,
  3,3
)
model_matrix(df,y ~ I(x^2) + x)

sim5 <-  tibble(
  x = seq(0, 3.5 * pi, length = 50),
  y = 4 * sin(x) + rnorm(length(x))
)

ggplot(sim5,aes(x,y)) +
  geom_point() 

library(splines)

mod1 <- lm(y ~ ns(x,1), data = sim5)
mod2 <- lm(y ~ ns(x,2), data = sim5)
mod3 <- lm(y ~ ns(x,3), data = sim5)
mod4 <- lm(y ~ ns(x,4), data = sim5)
mod5 <- lm(y ~ ns(x,5), data = sim5)

grid <- sim5 %>%
  data_grid(x = seq_range(x,n = 50,expand = 0.1)) %>%
  gather_predictions(mod1,mod2,mod3,mod4,mod5,.pred = "y")

ggplot(sim5,aes(x,y)) +
  geom_point() +
  geom_line(data = grid,color = "red") +
  facet_wrap(~model)

model_matrix(data = sim3, y ~ x1 + x2)
model_matrix(data = sim3, y ~ x1 * x2)

df <- tribble(
  ~x,~y,
  1,2.2,
  2,NA,
  3,3.5,
  4,8.3,
  NA,10
)

mod <- lm(y ~ x,data = df,na.action = "na.exclude")
nobs(mod)

#chapter 24
library(tidyverse)
library(ggplot2)
library(lubridate)
library(nycflights13)

ggplot(diamonds,aes(cut,price)) + geom_boxplot()
ggplot(diamonds,aes(color,price)) + geom_boxplot()
ggplot(diamonds,aes(clarity,price)) + geom_boxplot()

ggplot(diamonds,aes(carat,price)) +
  geom_hex()

diamonds2 <-  diamonds %>%
  filter(carat <= 2.5) %>%
  mutate(lprice = log2(price), lcarat = log2(carat))

ggplot(diamonds2,aes(lcarat,lprice)) +
  geom_hex(bins = 50)

mod_diamond <- lm(lprice ~ lcarat, data = diamonds2 )

grid <- diamonds2 %>%
  data_grid(carat = seq_range(carat,20)) %>%
  mutate(lcarat = log2(carat)) %>%
  add_predictions(mod_diamond,"lprice") %>%
  mutate(price = 2 ^ lprice)

ggplot(diamonds2,aes(carat,price)) +
  geom_hex(bins = 50) +
  geom_line(data = grid,colour = "red", size = 1 )

diamonds2 <- diamonds2 %>%
  add_residuals(mod_diamond,"lresid")

ggplot(diamonds2,aes(lcarat,lresid)) +
  geom_hex(bins = 50)

ggplot(diamonds2,aes(cut,lresid)) + geom_boxplot()
ggplot(diamonds2,aes(color,lresid)) + geom_boxplot()
ggplot(diamonds2,aes(clarity,lresid)) + geom_boxplot()

mod_diamond2 <- lm(lprice ~ lcarat + cut + color + clarity,data = diamonds2)

grid <- diamonds2 %>%
  data_grid(cut, .model = mod_diamond2) %>%
  add_predictions(mod_diamond2)
grid

ggplot(grid,aes(cut,pred)) +
  geom_point()

diamonds2 <- diamonds2 %>%
  add_residuals(mod_diamond2,"lresid2")

ggplot(diamonds2,aes(lcarat,lresid2)) +
  geom_hex(bins = 50)

diamonds2 %>%
  filter(abs(lresid2) > 1) %>%
  add_predictions(mod_diamond2) %>%
  mutate(pred = round(2 ^ pred)) %>%
  select(price,pred,carat:table, x:z) %>%
  arrange(price)

ggplot(diamonds2,aes(lcarat,lprice)) +
  geom_hex(bins = 50)

daily <- flights %>%
  mutate(date = make_date(year,month,day)) %>%
  group_by(date) %>%
  summarise(n = n())

ggplot(daily, aes(date,n)) +
  geom_line()

daily <- daily %>%
  mutate(wday = wday(date,label = T))
daily
ggplot(daily,aes(wday,n)) +
  geom_boxplot()

mod <- lm(n ~ wday, data = daily)

grid <-  daily %>%
  data_grid(wday) %>%
  add_predictions(mod,"n")

ggplot(daily,aes(wday,n)) +
  geom_boxplot() +
  geom_point(data = grid,color = "red",size = 4)

daily <- daily %>%
  add_residuals(mod)

daily %>%
  ggplot(aes(date,resid)) +
  geom_ref_line(h = 0) +
  geom_line()

ggplot(daily,aes(date,resid,color = wday)) +
  geom_ref_line(h = 0) +
  geom_line(size = 1.3)

daily %>%
  filter(resid < -100)

daily %>%
  ggplot(aes(date,resid)) +
  geom_ref_line(h = 0) +
  geom_line(colour = "grey50") +
  geom_smooth(se = F, span = 0.2)

daily %>%
  filter(wday == "周六") %>%
  ggplot(aes(date,n)) +
  geom_point() +
  geom_line() +
  scale_x_date(NULL, date_breaks = "1 month", date_labels = "%b")

term <- function(date) {
  cut(date,
      breaks = ymd(20130101, 20130605, 20130825, 20140101),
      labels = c("spring","summer","fall"))
}

daily <- daily %>%
  mutate(term = term(date))

daily %>%
  filter(wday == "周六") %>%
  ggplot(aes(date,n,color = term)) +
  geom_point() +
  geom_line() +
  scale_x_date(NULL,date_breaks = "1 month",date_labels = "%b")

daily %>% 
  ggplot(aes(wday,n,color = term)) +
  geom_boxplot()

mod1 <- lm(n ~ wday, data = daily)
mod2 <- lm(n ~ wday * term, data = daily)

daily %>%
  gather_residuals(whithout_term = mod1,with_term = mod2) %>%
  ggplot(aes(date,resid,colour = model)) +
  geom_line() +
  geom_ref_line(h = 0)

grid <- daily %>%
  data_grid(wday,term) %>%
  add_predictions(mod2,"n")

ggplot(daily,aes(wday,n)) +
  geom_boxplot() +
  geom_point(data = grid, colour = "red") +
  facet_wrap(~ term)

mod3 <- MASS::rlm(n ~ wday * term, data = daily)

daily %>%
  add_residuals(mod3, "resid") %>%
  ggplot(aes(date, resid)) +
  geom_hline(yintercept = 0, size = 2, color = "white") +
  geom_line()

mod <- MASS::rlm( n ~ wday * ns(date,5), data = daily)

daily %>% 
  data_grid(wday, date = seq_range(date,n = 13)) %>%
  add_predictions(mod) %>%
  ggplot(aes(date, pred, color = wday)) +
  geom_line() +
  geom_point()


#chapter 25
library(modelr)
library(tidyverse)
library(gapminder)

gapminder
ggplot(gapminder,aes(year,lifeExp, group = country)) +
  geom_line(alpha = 0.4)

nz <- filter(gapminder,country == "New Zealand")
nz %>%
  ggplot(aes(year,lifeExp)) +
  geom_line() +
  ggtitle("Full Data = ")

nz_mod <- lm(lifeExp ~ year, data = nz)
nz %>%
  add_predictions(nz_mod) %>%
  ggplot(aes(year,pred)) +
  geom_line() +
  ggtitle("Linear trend =") 

nz %>% 
  add_residuals(nz_mod) %>%
  ggplot(aes(year,resid)) +
  geom_hline(yintercept = 0 , colour = "white" , size =3) +
  geom_line() +
  ggtitle("Remaining Pattern = ")


by_country <- gapminder %>%
  group_by(country, continent) %>%
  nest()
by_country$data[[1]]

country_model <- function(df) {
  lm(lifeExp ~ year, data = df)
}
models <- map(by_country$data,country_model)

by_country <- by_country %>%
  mutate(model = map(data, country_model))

by_country %>% 
  filter(continent == "Europe")

by_country %>%
  arrange(continent,country)

by_country <- by_country %>%
  mutate(
    resid = map2(data,model,add_residuals)
  )

resids <- unnest(by_country,cols = resid)

resids %>% 
  ggplot(aes(year,resid)) +
  geom_line(aes(group = country), alpha = 1/3) +
  geom_smooth(se = F) +
  facet_wrap(~ continent)

library(broom)
glance(nz_mod)

by_country %>%
  mutate(
    glance = map(model,glance) 
  ) %>%
  unnest(glance)

glance <- by_country %>%
  mutate(glance = map(model, glance)) %>%
  unnest(glance, .drop = T)

glance %>%
  arrange(r.squared)

glance %>%
  ggplot(aes(continent,r.squared)) +
  geom_jitter()

bad_fit <- filter(glance, r.squared < 0.25)

gapminder %>%
  semi_join(bad_fit, by = "country")  %>%
  ggplot(aes(year,lifeExp, colour = country)) +
  geom_line()

data.frame(
  x = I(list(1:3, 3:5)),
  y = c("1,2","3,4,5")
)

tibble(
  x = I(list(1:3, 3:5)),
  y = c("1,2","3,4,5")
)

tribble(
  ~x , ~y,
  1:3, "1,2",
  3:5, "3,4,5"
)

gapminder %>%
  group_by(continent,country) %>%
  nest()

gapminder %>%
  nest(year:gdpPercap)

df <- tribble(
  ~x1,
  "a,b,c",
  "d,e,f,g"
)
df %>%
  mutate(x2 = str_split(x1,pattern = ","))

df %>%
  mutate(x2 = str_split(x1,pattern = ",")) %>%
  unnest(x2)

sim <- tribble(
  ~f, ~params,
  "runif", list(min = -1, max = 1),
  "rnorm", list(sd = 5),
  "rpois", list(lambda = 10)
)
sim %>%
  mutate( sim = invoke_map(f,params, n =10))

q1<- mtcars %>% 
  group_by(cyl) %>%
  summarise(q = list(quantile(mpg)))

probs <- c(0.01, 0.25, 0.5, 0.75, 0.99)
mtcars %>%
  group_by(cyl) %>%
  summarise(p = list(probs),q = list(quantile(mpg,probs))) %>%
  unnest()

x <- list(
  a = 1:5,
  b = 3:4,
  c = 5:6
)

df <- enframe(x)
df

df %>%
  mutate(
    smry = map2_chr(name, value, ~ str_c(.x,": ",.y[1]))
  )

mtcars %>%
  group_by(cyl) %>%
  summarise_each(funs(list))

df <- tribble(
  ~x,
  letters[1:5],
  1:3,
  runif(5)
)

df %>%
  mutate(
    type = map_chr(x,typeof),
    length = map_int(x,length)
  )

df <- tribble(
  ~x,
  list(a = 1, b = 2),
  list(a = 2, c = 4)
)
df %>%
  mutate(
    a = map_dbl(x,"a"),
    b = map_dbl(x, "b", .null = NA_real_)
  )

tibble(x = 1:2, y = list(1:4, 1)) %>% unnest(y)

df1 <- tribble(
  ~x, ~y, ~z,
  1, c("a","b"), 1:2,
  2, "C", 3
)
df1 %>% unnest(y,z)

df2 <- tribble(
  ~x, ~y, ~z,
  1, "a", 1:2,
  2, c("a","b"), 3
)

df2 %>% unnest(y,z)

#chapter 27
knitr:: kable(
  mtcars[1:5,],
  caption = "A Knitr Kable"
)


#chapter 28
library(tidyverse)
ggplot(mpg,aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = F) +
  labs(title = "Fuel Efficiency generally decreases with engine size")

ggplot(mpg,aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = F) +
  labs(title = "Fuel Efficiency generally decreases with engine size",
       subtitle = "Two seaters (sports cars) are an exception because of their light weight",
       caption = "Data from fueleconomy.gov")

ggplot(mpg,aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = F) +
  labs(
    x = "Engine Displacement",
    y = "Highway fuel economy(mpg",
    colour = "Car Type"
  )

best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg,aes(displ,hwy)) +
  geom_point(aes(color = class)) +
  geom_text(aes(label = model), data = best_in_class)

ggplot(mpg,aes(displ,hwy)) +
  geom_point(aes(color = class)) +
  geom_label(aes(label = model), data = best_in_class, nudge_y = 2,alpha = 0.5)

ggplot(mpg,aes(displ,hwy)) +
  geom_point(aes(color = class)) +
  geom_point(size = 3, shape = 1, data = best_in_class) +
  ggrepel::geom_label_repel(aes(label = model), data = best_in_class)

class_avg <- mpg %>%
  group_by(class) %>%
  summarise(
    displ = median(displ),
    hwy = median(hwy)
  )

ggplot(mpg, aes(displ, hwy, color = class)) +
  ggrepel::geom_label_repel(aes(label = class),
                            data = class_avg,
                            size = 6,
                            label.size = 0,
                            segment.colour = NA) +
  geom_point() +
  theme(legend.position = "none")

presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id)) +
  geom_point() +
  geom_segment(aes(xend = end, yend = id)) +
  scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y")

base <- ggplot(mpg,aes(displ,hwy)) +
  geom_point(aes(colour = class))
base + theme(legend.position = "left")
base + theme(legend.position = "right")
base + theme(legend.position = "top")
base + theme(legend.position = "bottom")

ggplot(mpg,aes(displ,hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = F) +
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 1, override.aes = list(size = 4)))


df <- tibble(
  x = rnorm(10000),
  y = rnorm(10000)
)
ggplot(df,aes(x,y)) +
  geom_hex() +
  coord_fixed()

ggplot(df,aes(x,y)) +
  geom_hex() +
  viridis::scale_fill_viridis() +
  coord_fixed()

ggplot(mpg,aes(displ,hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = F) +
  theme_void()

#chapter 29

library(leaflet)
leaflet() %>%
  setView(174.764, -36.877, zoom = 16) %>%
  addTiles() %>%
  addMarkers(174.764, -36.877, popup = "Maungawhau")

install.packages("prettydoc")
