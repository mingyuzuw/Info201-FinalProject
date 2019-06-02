library(shiny)
library(dplyr)
library(ggplot2)
library(R.utils)

AP_df <- data.table::fread("Admission_Predict_Ver1.1.csv", stringsAsFactors = FALSE)
univ_rate <- c(1:5)

shinyServer(function(input, output) {
   
  
  
})
