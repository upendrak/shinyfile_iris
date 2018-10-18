library(shiny)
library(shinyFiles)
library(ggplot2)

shinyServer(function(input, output, session) {
  shinyFileChoose(input, 'file', roots=c(wd='/srv/shiny-server'), filetypes=c('', 'csv'))
  output$contents <- renderDataTable({
    inFile <- parseFilePaths(roots=c(wd='/srv/shiny-server'), input$file)
    if( NROW(inFile)) {
      df <- read.csv(as.character(inFile$datapath),
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)
      if(input$disp == "head") {
        return(head(df))
      }
      else {
        return(df)
      }
    }
  })


  output$summary <- renderPrint({
    inFile <- parseFilePaths(roots=c(wd='/srv/shiny-server'), input$file)
    if( NROW(inFile)) {
      df <- read.csv(as.character(inFile$datapath),
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)

      summary(df)
    }
  })

  output$plt <- renderPlot({
    inFile <- parseFilePaths(roots=c(wd='/srv/shiny-server'), input$file)
    if( NROW(inFile)) {
      df <- read.csv(as.character(inFile$datapath),
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)
      ggplot(df, aes_string(x = input$variable, y = input$variable2, color = "species")) + geom_point()
    }
  })

})
