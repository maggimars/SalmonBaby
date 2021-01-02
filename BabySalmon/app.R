#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

library(png)


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel(h1("The Baby Salmon App", h3("What is the salmon equivalent to your baby? "))),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            ("This app scales the salmon life-cycle to match the 40-week human gestation period so that you can track how your baby's development compares to a baby salmon. "),
            hr(),
            selectInput("weeks", "How many weeks into your pregnancy are you?:", c("0-2 weeks" = "egg", "3-4 weeks"="alevin", "5-8 weeks"= "fry",
                                                      "9-19 weeks"= "parr", "20-40 weeks"= "smolt", "> 40 weeks"="adult" )),
 
            hr(),
            helpText("Images from WikiCommons")
        ),
            
        # Show a plot of the generated distribution
        mainPanel(
            (h4("Your baby is:")),
            textOutput("text"),
            imageOutput("image")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    output$image <- renderImage({
        if (is.null(input$weeks))
            return(NULL)
        
        if (input$weeks == "egg") {
            return(list(
                src = "www/egg.png",
                contentType = "image/png",
                alt = "egg"
            ))
        }    
        
        if (input$weeks == "alevin") {
                return(list(
                    src = "www/alevin.png",
                    contentType = "image/png",
                    alt = "alevin"
                ))
        }
        
        if (input$weeks == "fry") {
            return(list(
                src = "www/fry.png",
                contentType = "image/png",
                alt = "fry"
            ))
        }
        
        if (input$weeks == "parr") {
            return(list(
                src = "www/parr.png",
                contentType = "image/png",
                alt = "parr"
            ))
        }
        
        if (input$weeks == "smolt") {
            return(list(
                src = "www/smolt.png",
                contentType = "image/png",
                alt = "smolt"
            ))
        
            
        } else if (input$weeks == "adult") {
            return(list(
                src = "www/adult.png",
                filetype = "image/png",
                alt = "adult"
            ))
        
        }
        
    }, deleteFile = FALSE)
    
    output$text <- renderText({
        if (is.null(input$weeks))
            return(NULL)
        
        if (input$weeks == "egg") {
            return("A salmon egg")
        }    
        
        if (input$weeks == "alevin") {
            return("An alevin")
        }
        
        if (input$weeks == "fry") {
            return("A fry")
        }
        
        if (input$weeks == "parr") {
            return("A parr")
        }
        
        if (input$weeks == "smolt") {
            return("A smolt")
            
            
        } else if (input$weeks == "adult") {
            return("An adult salmon")
            
        }
        
    })
    
}
    


# Run the application 
shinyApp(ui = ui, server = server)
