# Load necessary libraries
# install.packages("dplyr")
library(ggplot2)
library(dplyr)

# Load the mtcars dataset
data("mtcars")

# Data manipulation: Add a factor column for cylinders
mtcars <- mtcars %>%
  mutate(cyl_factor = factor(cyl, levels = c(4, 6, 8), labels = c("4 Cyl", "6 Cyl", "8 Cyl")))

# Summarize the dataset: Calculate mean MPG by cylinder category
summary_table <- mtcars %>%
  group_by(cyl_factor) %>%
  summarise(mean_mpg = mean(mpg, na.rm = TRUE))

print(summary_table)

# Plot
ggplot(mtcars, aes(x = cyl_factor, y = mpg, fill = cyl_factor)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "MPG Distribution by Cylinder Count",
       x = "Cylinders",
       y = "Miles Per Gallon (MPG)") +
  theme_minimal()