library(shiny)

shinyUI(fluidPage(
  tabsetPanel(
    # Overview/Introduction Page
    tabPanel("Overivew", fluid = TRUE,
             fluidRow(
               textOutput("overview_introduction")
             ),
             fluidRow(
                textOutput("attributes")
             ),
             fluidRow(
               textOutput("audience")
             ),
             fluidRow(
               textOutput("question")
             ),
             fluidRow(
               textOutput("citation")
             ),
             fluidRow(
               textOutput("About_us_info")
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
                              label = h3("University Rating (Level of difficulty)"),
                              choices = list("Very Competitive" = 5, 
                                             "Competitive" = 4,
                                             "Average" = 3,
                                             "Relatively Easy" = 2, 
                                             "Easy" = 1), 
                              selected = 3),
                 numericInput("TS", label = h3("TOEFL Score   (0 - 120)"), value = 100),
                 numericInput("GS", label = h3("GRE Score (0 - 340)"), value = 300),
                 numericInput("GPA", label = h3("CGPA (0 - 10)"), value = 8),
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
)
