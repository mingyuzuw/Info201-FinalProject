library(shiny)
library(dplyr)
library(ggplot2)
library(R.utils)

AP_df <- data.table::fread("Admission_Predict_Ver1.1.csv", stringsAsFactors = FALSE)
univ_level <- c("Very Competitive", "Competitive", "Average", "Easy", "Very Easy")
shinyServer(function(input, output) {
  output$introduction <- renderText({
    paste0("This ...")
  })
  # James's Part 
  get_df <- reactive({
    univ_df <- AP_df[AP_df$University_Rating == input$univ, ]
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
    ts <- coe[2] * input$TS
    gs <- coe[3] * input$GS
    gpa <- coe[4] * input$GPA
    re <- coe[5] * input$research
    # est_AR <- coe[1]
    print(typeof(coe[1]))
    # paste0("The estimated admission rate is for the ", univ_level[input$univ], "university,
    #        it is based on the given user input data which is shown in the table below. The plot
    #        below shows the every data point in the dataset and the generated linear regression line. 
    #        The estimation for the current user is ", est_AR, "%.")
    paste0(re)
  })
  output$Factors_v_AR <- renderPlot({
    univ_df <- get_df()
    current_graph <- ggplot(univ_df,aes(x = TOEFL_Score + GRE_Score + 
                                               CGPA + Research,
                                             y = Chance_of_Admit)) + 
      geom_point() + 
      geom_smooth(method = "lm", se = FALSE) + ggtitle(univ_level[input$univ])
    print(current_graph)
  })
  output$User_data <- renderTable({
    user_input <- list("TOEFL Score" = input$TS, "GRE Score" = input$GS,
                       "CPGA" = input$GPA, 
                       "Research Experience" = ifelse(1, "Yes", "No"))
  })
  
  # Sean's Part
  
  
})
