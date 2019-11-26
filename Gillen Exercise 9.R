## Question 1

data.NFL <- read.spss("Moral_values_NFL_protests.sav", to.data.frame = TRUE, header = TRUE)
write.table(data.NFL, "NFL_protest.txt")
data.NFL <- read.table("NFL_protest.txt", sep = " ", header = TRUE)

library(dplyr)
data.NFL.subset <- select(data.NFL, protest_support, character)
plot(data.NFL.subset$character, data.NFL.subset$protest_support, xlab = "Character of Protestors", ylab = "Support of NFL Protests")
abline(lm(data.NFL.subset$protest_support ~ data.NFL.subset$character))


## Question 2

data <- read.table("data.txt", header = TRUE, sep = ",")

a <- ggplot(data = data, aes(x = region, y = observations))
pop_bar <- a + xlab("Region") + ylab("Population") + stat_summary(geom = "bar", fun.y = "mean")
pop_scatter <- a + xlab("Region") + ylab("Population") + geom_jitter()

## Although the regions have very similar average populations (as shown by the bar plot), 
## the scatterplot shows that variability of the data points varies between region
## for example, the points in the North region are concentrated around the mean
## while in the West, the data is spread out much more