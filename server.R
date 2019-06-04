library(shiny)
library(dplyr)
library(ggplot2)
library(R.utils)

AP_df <- data.table::fread("Admission_Predict_Ver1.1.csv", stringsAsFactors = FALSE)
univ_level <- c("easy", "relatively easy", "average", "competitive","very competitive")
shinyServer(function(input, output) {
  output$overview_introduction <- renderText({
    paste0("This program shows the admission prediction based on different user status. \n")
  })
  output$attributes <- renderText({
    paste0("Attributes: \n
            The factors that we use to estimate the admission rate are TOEFL score,
            GRE score, CGPA, and research experience. \n
            University Rating: 
            TOEFL score: Satndardized test for English proficiency
            GRE Score: 
            CPGA: GPA
            Research Experience: 
           ")
  })
  output$audience <- renderText({
    paste0("Audience: \n
           ")
  })
  output$question <- renderText({
    paste0("Questions: \n
           ")
  })
  output$citation <- renderText({
    paste0("Citation: \n
           ")
  })
  output$About_us_info <- renderText({
    paste0("About us: \n
            We are students in University of Washington who are taking INFO 201. 
            This project is created by Group 40 of Info 201 B section, 
           and it is for Info 201 Final Project. \n
           Authors: Mingyu Zhong, Sean Yang \n
           Email: mingyuz@uw.edu, ")
  })
  # James's Part 
  get_df <- reactive({
    univ_df <- AP_df %>% filter(University_Rating == input$univ)
    return(univ_df)
  })
  output$instruction <- renderText({
    paste0()
  })
  output$difficulty <- renderText({
    paste0("First, select the appropriate university rating to start.")
  })
  output$Est_Des <- renderText({
    univ_df <- get_df()
    coe <- lm(Chance_of_Admit ~ TOEFL_Score + GRE_Score + CGPA + Research,
            data = univ_df)
    coe <- coe$coefficients
    coe <- as.numeric(coe)
    est_AR <- coe[1] + coe[2] * input$TS+ coe[3] * input$GS + coe[4] * input$GPA + coe[5] * as.numeric(input$research)
    est_AR <- round(est_AR *100, 2)
    #print(input$univ)
    paste0("The estimated admission rate is for the ", univ_level[as.numeric(input$univ)], " university,
           it is based on the given user input data which is shown in the table below. The plot
           below shows the every data point in the dataset and the generated linear regression line.
           The estimation for the current user is ", est_AR, "%.")
  })
  output$Factors_v_AR <- renderPlot({
    univ_df <- get_df()
    current_graph <- ggplot(univ_df,aes(x = TOEFL_Score + GRE_Score + 
                                               CGPA + Research,
                                             y = Chance_of_Admit)) + 
      geom_point() + 
      geom_smooth(method = "lm", se = FALSE) + 
      ggtitle(univ_level[as.numeric(input$univ)])
    print(current_graph)
  })
  output$User_data <- renderTable({
    user_input <- list("TOEFL Score" = input$TS, "GRE Score" = input$GS,
                       "CPGA" = input$GPA, 
                       "Research Experience" = ifelse(1, "Yes", "No"))
  })
  
  # Sean's Part
  
  
})
