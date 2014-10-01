
1. Write down 3 questions that you might want to answer based on this data.

What is the entire number of scotish prefer taking Cullen Skink over Partan Bree ? 
What is the entire number of scotish prefer Not taking Cullen Skink over Partan Bree ? 
Which Scotish group prefer more taking Cullen Skink ?

2. Create an R data frame with 2 observations to store this data in its current "messy" state. 
Use whatever method you want to re-create and/or load the data.

city = c('Edinburgh', 'Edinburgh', 'Edinburgh','Edinburgh','Glasgow','Glasgow','Glasgow','Glasgow')
age = c('16-24', '16-24', '25+','25+','16-24','16-24','25+','25+')
vote_type = c('Yes', 'No', 'Yes', 'No','Yes', 'No','Yes', 'No')
vote_value = c(80100, 35900, 143000, 214800,99400, 43000,150400, 207000)
df = data.frame(city, age, vote_type, vote_value)


3. Use the functionality in the tidyr package to convert the data frame to be "tidy data."





4. Use the functionality in the plyr package to answer the questions that you asked in step 1.

# What is the entire number of scotish prefer taking Cullen Skink over Partan Bree ? 

filter ( 
summarise( 
            select (
                group_by(df,vote_type), 
                     vote_type,  sum(vote_value) 
            ) 
           , voteType = vote_type,  voteVal = vote_value )
,
voteType = "Yes"
)


#What is the entire number of scotish prefer Not taking Cullen Skink over Partan Bree ? 

filter ( 
  summarise( 
    select (
      group_by(df,city, vote_type), 
      vote_type,  sum(vote_value) 
    ) 
    , voteType = vote_type,  voteVal = vote_value )
  ,
  voteType = "No"
)

# Which Scotish group prefer more taking Cullen Skink ?

summarise( 
  select (
    group_by(df,city, vote_type), 
    vote_type,  sum(vote_value) 
  ) 
  , city = city,  voteVal = vote_value )

5. Having gone through the process, would you ask different questions and/or change 
the way that you structured your data frame?
 
 I would have flatten the data in a way wherein the each value has a commited column in the table. 
This method seems to be easier to pull and manipulate. There are some drawbacks though since there might 
be redundancy on the data and it will be a space issue if the data is large.

