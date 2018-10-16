library(shiny)
library(shinyFiles)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel(
    'Selections with shinyFiles',
    'shinyFiles example'
  ),
  sidebarPanel(
    tags$h3('Select your file'),
    
    # Shiny button   
    shinyFilesButton(id = 'file', label = 'File select', title = 'Please select a file', multiple = FALSE),
  
    tags$h3('Select your options for table'),
    
    # Horizontal line ----
    br(),
    
    # Input: Checkbox if file has header ----
    checkboxInput("header", "Header", TRUE),
    
    # Input: Select separator ----
    radioButtons("sep", "Separator",
                 choices = c(Comma = ",",
                             Semicolon = ";",
                             Tab = "\t"),
                 selected = ","),
    
    # Input: Select quotes ----
    radioButtons("quote", "Quote",
                 choices = c(None = "",
                             "Double Quote" = '"',
                             "Single Quote" = "'"),
                 selected = '"'),
    
    # Horizontal line ----
    tags$hr(),
    
    # Input: Select number of rows to display ----
    radioButtons("disp", "Display",
                 choices = c(Head = "head",
                             All = "all"),
                 selected = "head"),
    
    tags$h3('Select your options for plotting'),
    
    br(),
    
    # Input: 
    selectInput("variable", "First variable:",
                list("Sepal length" = "sepal_length",
                     "Sepal width"  = "sepal_width",
                     "Petal length" = "petal_length",
                     "Petal width"  = "petal_width")),
    
    selectInput("variable2", "Second variable:",
                list("Sepal length" = "sepal_length",
                     "Sepal width"  = "sepal_width",
                     "Petal length" = "petal_length",
                     "Petal width"  = "petal_width"))
    ),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Table", dataTableOutput("contents")),
                tabPanel("Summary", verbatimTextOutput("summary")),
                tabPanel("Plot", plotOutput("plt"))
    
  )
  ))
)
