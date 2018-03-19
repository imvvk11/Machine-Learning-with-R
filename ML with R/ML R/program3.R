
# step 1:
df = read.csv('Mall_Customers.csv')

# step 2:
df = df[4:5]
head(df)
# step 3: create the required clusters

# step 3.1: find the optimum number of clusters
set.seed(15)

# Elbow algorithm is used to decide the ortimum number of clusters
# within-cluster sum of squares
wcss_values = vector()
# for (i in 1:10) {
#   wcss_values[i] = sum(kmeans(df, centers = i)$withinss)
# }
# plot(wcss_values, type = 'b')

# step 3.2:
clusters = kmeans(x = df, centers = 5)

# step 4: visualization of result
library(cluster)
clusplot(x = df, 
         clusters$cluster, 
         shade = TRUE, 
         color = TRUE, 
         lines = TRUE,
         main = 'Anual Income Vs Spending',
         xlab = "Anual Income",
         ylab = 'Spending')

