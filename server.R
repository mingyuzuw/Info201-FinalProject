library(shiny)
library(dplyr)
library(ggplot2)
library(R.utils)

AP_df <- data.table::fread("Admission_Predict_Ver1.1.csv", stringsAsFactors = FALSE)

shinyServer(function(input, output) {
  # James's Part 
  get_df <- reactive({
    
  })
  
  # Sean's Part
  
  
})
