library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme = shinytheme('superhero'),
  # Having three tab pages which are Overview, Estimation, and Report
  tabsetPanel(
    # Overview Page
    tabPanel("Overview", fluid = TRUE,
             # A paragraph for Introduction
             tags$div(
               tags$h3("Introduction:"),
               tags$p("We want to find the admission prediction of a user given his/her user status.
                      The factors that we use to estimate the admission rate are TOEFL score,
                      GRE score, CGPA, and research experience. Also, we want to obtaina a summary about
                      the dataset such as finding the general trend of admission for differnet rating of University.")
             ),
             # A paragraph that explains the factors/variables in the dataset
             tags$div(
               tags$h3("Attributes:"),
               tags$p("The factors that we use to estimate the admission rate are TOEFL score,
                      GRE score, CGPA, and research experience."),
               tags$li("University Rating: The quality of the university."),
               tags$li("TOEFL score: Standardized test for English proficiency out of 120."),
               tags$li("GRE Score: Standardized test for graduate admission out of 340."),
               tags$li("CPGA: Undergraduate GPA score scale out of 10."),
               tags$li("Research: Having research experience or not.")
             ),
             # A paragraph that introduces the group of people who might interest in out program
             tags$div(
               tags$h3("Audience:"),
               tags$p("Graduated undergraduate student: Knowing which university has the best
                      chance of admit with their current status."),
               
               tags$p("Undergraduate student: Knowing the weighting of each factor and 
                      adjusting the devoting of time and effort.")
             ),
             # a list of questions that can be answer by our program
             tags$div(
               tags$h3("Questions:"),
               tags$li("What are the chances of admission for users based on their academic records?"),
               tags$li("What factors affect ones chances of admission into graduate school?"), 
               tags$li("Is research or GPA more important for Graduate school, and should one do research during the school year?")),
             
             # A paragraph explain the origin of the dataset
             tags$div(
               tags$h3("Citation:"),
               tags$p("This dataset is obtained from Kaggle."),
               tags$a(href = "https://www.kaggle.com/mohansacharya/graduate-admissions#Admission_Predict_Ver1.1.csv", "Click here to view our dataset!")    
               ),
             # information and contact of the authors
             tags$div(
               tags$h3("About Us:"),
               tags$p("We are students in University of Washington who are taking INFO 201.
                      This project is created by Group 40 of Info 201 B section, 
                                                                            and it is for Info 201 Final Project."),
               tags$p("Authors: Mingyu Zhong, Sean Yang"),
               tags$p("Email: mingyuz@uw.edu, seanhy@uw.edu")
             )
    ),
    # Estimation Page which allows the user to predict their admission rate given their input data
    tabPanel("Estimation", fluid = TRUE,
             sidebarLayout(
               # input widgets that allows the user to input values
               sidebarPanel(
                 # instruction about how to begin
                 tags$div(
                   tags$p("First, select the appropriate university rating to start.")
                 ),
                 # Chosing the appropriate university to generate prediction
                 radioButtons("univ", 
                              label = h3("University Rating (Level of difficulty)"),
                              choices = list("Very Competitive" = 5, 
                                             "Competitive" = 4,
                                             "Average" = 3,
                                             "Relatively Easy" = 2, 
                                             "Easy" = 1), 
                              selected = 3),
                 # input user status for each category to estimate
                 numericInput("TS", label = h3("TOEFL Score (0 - 120)"), value = 100),
                 numericInput("GS", label = h3("GRE Score (0 - 340)"), value = 300),
                 numericInput("GPA", label = h3("CGPA (0 - 10)"), value = 8),
                 radioButtons("research", label = h3("Research Experience"),
                              choices = list("Yes" = 1, "No" = 0), 
                              selected = 1)
               ),
               mainPanel(
                 # show the text description of the summary about the admission prediction of the user
                 textOutput("Est_Des"),
                 # allows the user to double check their input with a table  
                 tableOutput("User_data"),
                 # plot all the pointsof the given dataset and generate an estimated line
                 plotOutput("Factors_v_AR")
               )
               )
    ),
    
    # Adding the third and final tabPanel for our user interface. 
    tabPanel("Report", fluid = TRUE,
             # Dividing up the 'Report' page into two columns (widths 5 and 7). The first column contains a reintroduced widget from the 'Estimation' page that controls
             # the difficulty of all Graduate schools. The first column also contains all of the four plots that feature each factor set up on their own as the x-axis variables
             # (TOEFL, GRE, CGPA, and Research Experience). The second column contains the report itself that includes detailed insight and data analysis for users to grasp a
             # better understanding of our shiny app. 
               fluidRow(column(5, radioButtons("reportUniv", 
                                  label = h3("University Rating (Level of difficulty)"),
                                  choices = list("Very Competitive" = 5, 
                                                 "Competitive" = 4,
                                                  "Average" = 3,
                                                  "Relatively Easy" = 2, 
                                                  "Easy" = 1), 
                                  selected = 3),
                               
                               plotOutput("report_toefl"), 
                               plotOutput("report_gre"),
                               plotOutput("report_cgpa"),
                               plotOutput("report_research")), 
                        # Start of second column, right side of our 'Report' layout. 
                          column(7, 
                            tags$div(
                              # Multiple paragraphs that discusses our observations in a Q/A format.
                              tags$h3("What Factors Affect Ones Chances of Admission Into Graduate School?"),
                              
                              tags$p("Simply through our Estimation tab, four different features are filtered within to determine whether an applicant is a qualified candidate for the school
                                     of their desires. The following features are implemented in our formula for the user's admission chances for grad. school: TOEFL score (0-120), GRE score (0-340),
                                     CGPA (0-10), and Research Experience (Yes/No). Such factors are further calculated depending on the prestige of the user's selection (University Rating). Furthermore
                                     it is clear that the higher the user's TOEFL and GRE scores, as well as their CGPA, the higher their chances are of getting into their targeted Graduate school."),
                              
                              tags$em("For more information regarding the filtered factors, please re-read the introduction paragraph in which can be found in the 'Overview' tab on the NAV bar."), 
                  
                              tags$h3("How Much Significance Does Each Factor Carry Within the Algorithim of Our Program?"),
                              
                              tags$p("Among the given factors of our application, CGPA is the most significant as it +/- ~13-14% of an indivudal's chances of admission for every grade point. The second most impactful
                                     factor within the admission's algorithm is Research as it +/- 3% of an applicant's chances of admission based on their selection (Yes/No). Following these two factors are the
                                     GRE score (+/- 0.20% for every point) and TOEFL score (+/- 0.03% for every point)."),
                              
                              tags$h3("Is Research or GPA More Important for Graduate School, and Should One do Research During the School Year?"),
                              
                              tags$p("It depends on what you want to major in for Graduate school as such question can be subjective. Overall, admissions offices want to see a mix of both 
                                     research experience and strong GPA's on your application/transcript because it reveals that you are a qualified student who is prepared to take on any rigorous academic schedules 
                                     as a graduate student. With that being said, it is highly advised that you maintain an appealing GPA while also doing research on the side 
                                     because to many fields, an impressive grade point average is meaningless without having any prior experience with research. However, if we were to answer this question from
                                     a general standpoint, GPA would be considered more essential with your major and desired school being pushed aside. As mentioned earlier, if the user's
                                     GPA decreases by one grade point, the admission rate decreases by aprox. 13-14% whereas if the user were to not have any prior research experience, the 
                                     admission rate would only drop roughly 3%.")),
                            tags$div(
                              tags$h3("Conclusion"),
                              tags$p("After examining our plots, our team was able to discern an evident positive association between the applicant's academic performance and 
                                     their estimated admission rate. However, users of this application must be aware that correlation does not always result in causation, for it is very possible that 
                                     there are other factors that may influence the relation, such as the subjectiveness of a graduate school's preferences (i.e. the University of Washington prefers 
                                     applicants who have not attended the University during their years of undergraduate school). To properly verify the causation of the correlation, additional data 
                                     will have to be implemented into our program in order to truly determine the accuracy of every derived percentage of acceptance.")
                              )
                              ))

               )
               )
    )
  )
