library(shiny)

shinyUI(fluidPage(
  tabsetPanel(
    # Overview/Introduction Page
    tabPanel("Overivew", fluid = TRUE,
             sidebarLayout(
               
             )
    ),
    # James's Part
    tabPanel("Estimation", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 textOutput("difficulty"),
                 radioButtons("univ", label = h3("University Rating"),
                              choices = list("Very Competitive" = 1, 
                                             "competitive" = 2,
                                             "Normal/Average" = 3,
                                             "Easy" = 4, 
                                             "Very Easy" = 5), 
                              selected = 3),
                 sliderInput("T_Score",
                             "TOEFL Score",
                             min = 0,
                             max = 120,
                             value = 100),
                 sliderInput("G_Score",
                             "GRE Score",
                             min = 0,
                             max = 340,
                             value = 300),
                 radioButtons("research", label = h3("Research Experience"),
                              choices = list("Yes" = 1, "No" = 2), 
                              selected = 2)
               ),
               
               mainPanel(
                 plotOutput(""),
                 textOutput("")
               )
               )
             )
    ),
  
    # Sean's Part
    tabPanel("Report", fluid = TRUE,
             sidebarLayout(
               sidebarPanel(
                 
               ),
               mainPanel(fluidRow(
                 
               )
               )
             )
    )
  )
)
