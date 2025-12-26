data = student_data
library(mosaic)
data <- data %>% 
  select(G3, famsup, famrel) %>% 
  mutate(
    famsup = factor(famsup, levels = c("yes", "no"), labels = c("Support", "No Support"))
  )

# Exploratory Data Analysis (EDA)
# 1. Summarize G3, famsup, and famrel using descriptive statistics
summary(data)
summary(data$famrel)
favstats(data)
##boxplot for famsup
ggplot(data, aes(x = famsup, y = G3, fill = famsup)) +
  geom_boxplot() +
  labs(title = "Relationship between Family Support and Final Grades (G3)",
       x = "Family Support", y = "Final Grade (G3)") +
  theme_minimal() +
  scale_fill_manual(values = c("skyblue", "salmon"))

# Ensure the famrel variable is treated as a factor
data$famrel <- as.factor(data$famrel)

# Create the boxplot
ggplot(data, aes(x = famrel, y = G3, fill = famrel)) +
  geom_boxplot() +
  labs(
    title = "Relationship Between Family Relationship (famrel) and Final Grade (G3)",
    x = "Family Relationship Quality (famrel)",
    y = "Final Grade (G3)"
  ) +
  theme_minimal()

interaction.plot(
  x.factor = data$famrel, 
  trace.factor = data$famsup, 
  response = data$G3, 
  fun = mean, 
  type = "b", 
  col = 1:4, 
  pch = 19, 
  xlab = "Family Relationship", 
  ylab = "Final Grade (G3)", 
  main = "Interaction Plot: Family Relationship vs Family Support"
)

anova_model <- aov(G3 ~ famsup * famrel, data = data)
summary(anova_model)

anova_model <- lm(G3 ~ famsup + famrel, data = data)
summary(anova_model)



##########part 2
# Filter relevant columns for this analysis
data <- data %>% 
  select(address, romantic, G3) %>% 
  mutate(
    address = factor(address, levels = c("U", "R"), labels = c("Urban", "Rural")),
    romantic = factor(romantic, levels = c("yes", "no"), labels = c("In Relationship", "Single"))
  )


# Distribution of G3 by address and romantic status
ggplot(data, aes(x = address, y = G3, fill = romantic)) +
  geom_boxplot() +
  labs(title = "Distribution of Final Grades (G3)",
       x = "Address Type", y = "Final Grade (G3)") +
  theme_minimal()

# Interaction plot
interaction.plot(x.factor = data$address, trace.factor = data$romantic, 
                 response = data$G3, fun = mean, 
                 type = "b", pch = c(1, 19), col = c("red", "blue"),
                 xlab = "Address Type", ylab = "Mean Final Grade (G3)",
                 trace.label = "Romantic Status")

anova_model <- aov(G3 ~ address * romantic, data = data)
summary(anova_model)

anova_model <- lm(G3 ~ address * romantic, data = data)
summary(anova_model)

TukeyHSD(anova_model)

summary(anova_model)
plot(anova_model)

hist(data$famrel, 
     main = "Distribution of Family Relationship Scores (famrel)", 
     xlab = "famrel", 
     ylab = "Frequency", 
     col = "lightblue", 
     border = "black")


