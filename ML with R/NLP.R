#step 1: Read the data

df_original = read.delim("/home/sunbeam/Programs/ML with R/mar_21/Restaurant_Reviews.tsv", quote=",")
head(df)

#load the tm library
library(tm)
#load the SnowballC library 
library(SnowballC)

#convert the df$Review into corpus source
#corpus === collection of words/text

corpus  = VCorpus(VectorSource((df_original$Review))) 

#step2: data processing

#convert words to lower case
corpus = tm_map(corpus, content_transformer(tolower))


#corpus = as.character(corpus)

#Remove stopwords
corpus = tm_map(corpus, removeWords,stopwords())

#Remove numbers
corpus = tm_map(corpus, removeNumbers)

#REmove Punctutaions
corpus = tm_map(corpus, removePunctuation)

#Remove whitespaces
corpus = tm_map(corpus, stripWhitespace)

#Remove stem words(loved/living/loves = love)
corpus = tm_map(corpus, stemDocument)

#create sparse matrix
# only zeors and ones 
# all the unique words become columns
dtm = DocumentTermMatrix(corpus)
dtm

#next step is classification

#convert sparse matrix to dataframe
df = as.data.frame(as.matrix(dtm))
df["Liked"] = df_original$Liked


#since there are some reserved keywords like break, next etc are called at model fitting so put them NULL
df["break"] = NULL
df["next"] = NULL

#convert the liked column with 0 and 1
df$Liked = factor(df$Liked, levels= c(0,1))


#split the data
#load the library
library(caTools)
result = sample.split(df$Liked, SplitRatio = 0.8)
train_set = df[result == TRUE,]
test_set = df[result == FALSE,]

#load randomforest classifier algorithm
library(randomForest)

#train the data and create the model
classifier = randomForest(formula = Liked ~ ., data = train_set)

#make the predictions from fitting the model with test set
predictions = predict(classifier, newdata = test_Set) 
