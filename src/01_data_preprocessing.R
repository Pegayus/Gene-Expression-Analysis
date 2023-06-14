library(data.table)
library(dplyr)
library(tidyr)
library(stringr)

# Read the file with fread() directly, which automatically handles comment lines and column names
data <- fread("../data/E-MTAB-4840-query-results.tpms.tsv", sep = "\t")

# Rename the first two columns by removing the space
data <- data %>% rename("GeneID"="Gene ID")
data <- data %>% rename("GeneName"="Gene Name")

# Convert columns 3 to ncol(data) to numeric
for(i in 3:ncol(data)) {
  data[[i]] <- as.numeric(data[[i]])
}

# Replace NA values with 0
data[is.na(data)] <- 0

# Calculate the average expression for each gene across all samples
average_expression <- rowMeans(data[, 3:ncol(data), with = FALSE])

# Filter out genes with low average expression across samples
data <- data[average_expression > 1, ]

# Apply log2 transformation to numeric columns only
data[, names(data)[3:ncol(data)] := lapply(.SD, function(x) log2(x + 1)), .SDcols = 3:ncol(data)]
                                           
# Break the columns based on weeks and brain region to make grouping easier 
data_tidy <- data %>% 
  pivot_longer(-c("GeneID", "GeneName"), names_to = c("Weeks", "Region"), names_pattern = "(.*), (.*)", values_to = "Expression")

# Summarize the gene expression
df <- data_tidy %>%
  group_by(Region, GeneName) %>%
  summarise(Expression = mean(Expression, na.rm = TRUE), .groups = "drop")
                                           
# Define genes of interest
genes_of_interest <- c("PAX6", "NOS2", "SYN1", "CDKL5", "CACNA1G", "CACNA2D2", "ARX", "DVL2")

# Subset the data to include only genes of interest
df_subset <- data_tidy[data_tidy$GeneName %in% genes_of_interest, ]

# Give appropriate name to 'Weeks' column for plotting
df_subset <- df_subset %>%
  mutate(
    Type = ifelse(str_detect(Weeks, "post conception weeks"), "p", "c"),
    Numeric = str_extract(Weeks, "\\d+"),
    NumericWeeks = paste0(Type, Numeric)
  )                                        
                        
# Save the processed data frames to a TSV file
write.table(data_tidy, "../data/data_tidy.tsv", sep = "\t", row.names=FALSE)
write.table(df_subset, "../data/data_subset.tsv", sep = "\t", row.names = FALSE)                             
write.table(data, "../data/processed_E-MTAB-4840-query-results.tpms.tsv", sep = "\t", row.names = FALSE) 
write.table(df, "../data/summary_gene_expression.tsv", sep = "\t", row.names=FALSE)