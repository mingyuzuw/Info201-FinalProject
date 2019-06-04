library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme('superhero'),
  tabsetPanel(
    # Overview/Introduction Page
    tabPanel("Overview", fluid = TRUE,
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
                 numericInput("TS", label = h3("TOEFL Score (0 - 120)"), value = 100),
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
               mainPanel(fluidRow(
                 tabPanel("Report", fluid = TRUE,
                          mainPanel(
                            tags$div(
                              tags$h3("What Factors Affect Ones Chances of Admission Into Graduate School?"),
                              
                              tags$p("Simply through our Estimation tab, four different features are filtered within to determine whether an applicant is a qualified candidate for the school
                                     of their desires.
                                     
                                     As we look at each feature, it is apparent that lower instances of these factors, (raising hands, viewing annoucements, joining discussion groups) 
                                     lead to a higher density of students plotted along the lower tiered performance. 
                                     For example, selecting the default option of raised hands on the x-axis you can see a clear relationship: students 
                                     who raised their hands less are populating the performance rating of 1. It is less clear that higher frequencies of these 
                                     tasks directly translate to higher tiered performance level, but applying extra filters may show more prominent evidence."),
                              
                              tags$h3("Does a specific gender tend to be more influenced by the academic behaviors?"),
                              
                              tags$p("For females, there is a more direct trend for the visted resource factor. 
                                     We see that lower frequencies of doing this task shows more students in the lower performance scoring and higher frequecies of 
                                     visiting resources shows a higher chance of scoring a performance level of 3. For males, this trend is more prominent while 
                                     showing the data results from raised hands. We also can see that in both female and males that lower participation in these factors 
                                     can lead to a higher chance of placement within the lower tiered performance level of 1."),
                              
                              tags$h3("Students from which nation tend to achieve highest average academic performance?"),
                              
                              tags$p("As mentioned before, the lowest average performance data we found was from Saudi Arabia (participated 141 time),
                                     and the highest average academic performance was from the USA (participated 224 times)"),
                              
                              tags$h3("How does having higher participation affect on achieveing better academic performance in each nation?"),
                              
                              tags$p("To recieve a low performance grading (scoring of 1) participation levels range from 29-141 times participated.
                                     To recieve a mid-tier perfomance grading (scoring of 2) participation levels range from 126-266 times participated.
                                     To recieve a high-tier performance grading (scoring of 3) participation levels range from 223-330
                                     It it possible that there is a higher frequency of participation required to recieve the highest performance grading level, and the reverse is possible as well 
                                     where lower amounts of participation leads to a higher chance of recieving a lower grade.")
                              ),
                            tags$div(
                              tags$h3("Conclusion"),
                              tags$p("By analyzing the plots , we were able to identify that there exists clear positive relationship between students' academic performance and 
                                     their participation. However, correlation does not necessarily mean causation, it is possible that there are some other factors that may
                                     be affecting the relationship. In order to prove the causation of the correlationi, more research will have to be done in future.")
                              )
                              ))

               )
               )
    )
  )
)
)
