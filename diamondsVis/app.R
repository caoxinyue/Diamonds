## Wk12

library(shiny)
library(ggplot2)

# GUI

ui <- fluidPage(
  titlePanel("Diamonds Data"),
  # h1("I am header 1"), can add header to the webpage
  # h2("I am header 2")
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", label = "Chart title", value = ""),
      # Text框框
      selectInput(inputId = "pos", label = "Position", 
                  choices = list("stack","dodge"), selected = "stack")
      # Drop-down menu.
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)

# Server

server <- function(input, output){
  output$plot = renderPlot({
    ggplot(diamonds, aes(x = cut, fill = clarity)) +
      geom_bar(position = input$pos) +
      ggtitle(input$title)
  })
}

# Run the App
shinyApp(ui, server)










