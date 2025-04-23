library(dplyr)
library(here)


# 读取原始数据
nba_data <- read.table(here("data", "nba_2025-03-07"), sep = ",", header = TRUE, quote = "\"", fill = TRUE)

# 随机抽取一半行作为测试数据库
set.seed(123)  # 设置随机种子，确保结果可复现
nba_test <- sample_frac(nba_data, 0.5)

# 查看测试数据集的前几行
head(nba_test)
write.csv(nba_test, here("data", "nba_test.csv"), row.names = FALSE)