library(shiny)
library(shinyFiles)
library(ggplot2)

<<<<<<< HEAD
shinyServer(function(input, output) {
  # shinyFileChoose(input, 'file', roots=c(wd='.'), filetypes=c('', 'csv'))
  # shinySaveButton("save", "Save file", "Save file as ...", filetype=c('', "csv"))
=======
shinyServer(function(input, output, session) {
  shinyFileChoose(input, 'file', roots=c(wd='/srv/shiny-server'), filetypes=c('', 'csv'))
>>>>>>> 92d7e02d72517af4b25ae4ea389c890d53d8afab
  output$contents <- renderDataTable({
    # inFile <- parseFilePaths(roots=c(wd='.'), input$file)
    inFile <- input$file
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
    # inFile <- parseFilePaths(roots=c(wd='.'), input$file)
    inFile <- input$file
    if( NROW(inFile)) {
      df <- read.csv(as.character(inFile$datapath),
                     header = input$header,
                     sep = input$sep,
                     quote = input$quote)

      summary(df)
    }
  })

  # output$plt <- renderPlot({
  #   # inFile <- parseFilePaths(roots=c(wd='.'), input$file)
  #   inFile <- input$file
  #   if( NROW(inFile)) {
  #     df <- read.csv(as.character(inFile$datapath),
  #                    header = input$header,
  #                    sep = input$sep,
  #                    quote = input$quote)
  #     ggplot(df, aes_string(x = input$variable, y = input$variable2, color = "species")) + geom_point()
  #   }
  # })

})
