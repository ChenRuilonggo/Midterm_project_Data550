
library(dplyr)
library(ggplot2)
library(here)
library(config)

config_name <- Sys.getenv("WHICH_CONFIG")
if (config_name == "") {
  config_name <- "default"  
}
config_list <- config::get(config = config_name)

# Read the dataset (assuming it's a comma-separated file without an extension)
nba_data <- read.table(here("data", config_list$dataset), sep = ",", header = TRUE, quote = "\"", fill = TRUE)


analysis <- nba_data %>%
  select(Player, AST, TOV)
ggplot(analysis, aes(x = AST, y = TOV)) +
  geom_point(alpha = 0.6) +  
  geom_smooth(method = "lm", se = FALSE, color = "red") + 
  labs(
    title = "Relationship Between Assists and Turnovers (per 36 Minutes)",
    x = "Assists per 36 Minutes",
    y = "Turnovers per 36 Minutes",
    caption = "Data: NBA 2025 Season"
  ) +
  theme_minimal()
ggsave(
  here::here("output", "assists_vs_turnovers.png"), 
  device = "png",
  width = 8,
  height = 6  
)
correlation <- cor(analysis$AST, analysis$TOV, use = "complete.obs")
print(paste("Correlation coefficient:", round(correlation, 3)))