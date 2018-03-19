# step 1:
df = read.csv('/Volumes/Data/Sunbeam/2018/feb/DBDA/dataset/Mall_Customers.csv')

# step 2:
df = df[c(3, 5)]

# step 3:

wcss1 = sum(kmeans(df, centers = 1)$withinss)
wcss2 = sum(kmeans(df, centers = 2)$withinss)
wcss3 = sum(kmeans(df, centers = 3)$withinss)
wcss4 = sum(kmeans(df, centers = 4)$withinss)
wcss5 = sum(kmeans(df, centers = 5)$withinss)
wcss6 = sum(kmeans(df, centers = 6)$withinss)
wcss7 = sum(kmeans(df, centers = 7)$withinss)
wcss8 = sum(kmeans(df, centers = 8)$withinss)
wcss9 = sum(kmeans(df, centers = 9)$withinss)
wcss10 = sum(kmeans(df, centers = 10)$withinss)

wcss_values = c(wcss1, wcss2, wcss3, wcss4, wcss5, wcss6, wcss7, wcss8, wcss9, wcss10)
plot(wcss_values, type = 'b')


kmeans_result = kmeans(df, centers = 7)

# step 4: visualization
library(cluster)
clusplot(x = df, 
         kmeans_result$cluster,
         color = TRUE, 
         shade = TRUE,
         lines = FALSE,
         main = 'Age vs Spendings',
         xlab = 'Age',
         ylab = 'Spendings')





