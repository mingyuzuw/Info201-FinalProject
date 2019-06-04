library(shiny)

shinyUI(fluidPage(
  tabsetPanel(
    # Overview/Introduction Page
    tabPanel("Overivew", fluid = TRUE,
             fluidRow(
               textOutput("introduction")
             )
    ),
    # James's Part
    tabPanel("Estimation", fluid = TRUE,
             fluidRow(
               textOutput("instruction")
             ),
             sidebarLayout(
               sidebarPanel(
                 textOutput("difficulty"),
                 radioButtons("univ", 
                              label = h3("University Rating(Level of difficulty)"),
                              choices = list("Very Competitive" = 1, 
                                             "Competitive" = 2,
                                             "Average" = 3,
                                             "Easy" = 4, 
                                             "Very Easy" = 5), 
                              selected = 3),
                 numericInput("TS", label = h3("TOEFL Score"), value = 100),
                 numericInput("GS", label = h3("GRE Score"), value = 300),
                 numericInput("GPA", label = h3("CGPA"), value = 8),
                 radioButtons("research", label = h3("Research Experience"),
                              choices = list("Yes" = 1, "No" = 0), 
                              selected = 1)
               ),
               
               mainPanel(
                 textOutput("Est_Des"),
                 tableOutput("User_data"),
                 plotOutput("Factors_v_AR")
               )
               )
             )
    )
    ,

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
