# Longitudinal Analysis and Modeling of Gene Expression Data across Different Brain Regions

## Project Description:
This project encompasses a comprehensive analysis and modeling of gene expression data across various brain regions and developmental stages. A suite of R scripts was developed to handle data preprocessing, preliminary and exploratory data analysis, and sophisticated statistical modeling using both Bayesian and linear methodologies. 

A key motivation for this project was to gain a deeper understanding of how gene expression varies across different brain regions and developmental stages and develop robust statistical models to capture these variations.

## Repository Map and Content Description:
This repository consists of several folders, each serving a unique purpose in the project. Here is a brief explanation of each:

1. **Data:** This folder contains both the original and processed versions of the gene expression data. The data are stored in TSV (Tab-Separated Values) format. Note that due to the size limitations, the tidy version of the data (`data_tidy.tsv`) is compressed and uploaded as a ZIP file.

2. **Docs:** In this directory, you'll find the `sessionInfo()` for the R scripts, providing information about the R version and packages used in the analyses. Also, a brief explanation about the subset of genes (`genes_of_interest`) is included. This subset was selected to make the statistical features and analyses more feasible and meaningful.

3. **Figures:** This folder hosts all the figures generated during the data analysis process. These visual representations aid in understanding the patterns and trends in gene expression across different brain regions and developmental stages.

4. **Results:** All non-figure results obtained from the analyses are stored here. These include statistical summaries and modeling results.

5. **Src:** Here, you will find the source code used in this project. The code is organized into four main scripts, all written in R:
   - `01_data_preprocessing.R`: Responsible for reading and transforming data into proper formats for downstream analysis.
   - `02_preliminary_data_analysis.ipynb`: Contains preliminary data analysis and visualization tasks. 
   - `03_data_analysis_for_statistical_modeling.ipynb`: Conducts detailed data analysis to prepare for statistical modeling.
   - `04_statistical_modeling_and_evaluation.ipynb`: Focused on building and evaluating Bayesian and linear models. 
   The `.ipynb` files are Jupyter notebooks, chosen for their interactivity and ease of data analysis.

6. **README.md:** This file provides an overview of the project and the content of the repository.

## Future Directions:
Continued investigation of the problematic observations noted during the modeling process is suggested for future research. This investigation can lead to a deeper understanding of their implications on the model's performance. Exploring other machine learning models or statistical methods to increase prediction accuracy and robustness is another area of interest. Furthermore, a comparison of models built on transformed vs. untransformed data might provide insightful conclusions.

## Final Note:
This repository serves as a comprehensive record of a substantial exploration into the complex field of gene expression across different brain regions and developmental stages. By carefully tracing through the scripts, data, figures, and results contained here, one can recreate the analysis and models, gaining a deeper understanding of the project's conclusions and implications.
