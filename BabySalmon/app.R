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

library(shinythemes)


# Define UI for application that draws a histogram
ui <- fluidPage(
    theme = shinytheme("cerulean"),
    # Application title
    titlePanel(h1("The Baby Salmon App", h3("What is the salmon delevelopmental stage equivalent to your baby's? "))),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            ("This app scales the salmon life-cycle to match the 40-week human gestation period so that you can track how your baby's development compares to a baby salmon. "),
            hr(),
            # Input: Simple integer interval ----
            sliderInput("weeks", "How many weeks into your pregnancy are you?",
                        min = 0, max = 41,
                        value = 0),
            #selectInput("weeks", "How many weeks into your pregnancy are you?:", c("0-2 weeks" = "egg", "3-4 weeks"="alevin", "5-8 weeks"= "fry", "9-19 weeks"= "parr", "20-40 weeks"= "smolt", "> 40 weeks"="adult" )),

            hr(),
            helpText("References: U.S. Fish and Wildlife & Wikipedia"),
            helpText("Images from Wikimedia Commons")
        ),
            
        # Show a plot of the generated distribution
        mainPanel(
            (h4("If your baby was a salmon, it would be:")),
            textOutput("text"),
            imageOutput("image"), 
            div(style = "margin-top: -275px"),
            hr(),
            textOutput("text2")
        )
    )
)

# Define server logic 
server <- function(input, output, session) {
    output$image <- renderImage({
        if (is.null(input$weeks))
            return(NULL)
        
        if (input$weeks  >=0 & input$weeks <=2) {
            return(list(
                src = "www/egg.png",
                contentType = "image/png",
                alt = "egg"
            ))
        }    
        
        if (input$weeks >=3 & input$weeks <=4) {
                return(list(
                    src = "www/alevin.png",
                    contentType = "image/png",
                    alt = "alevin"
                ))
        }
        
        if (input$weeks >=5 & input$weeks <=8) {
            return(list(
                src = "www/fry.png",
                contentType = "image/png",
                alt = "fry"
            ))
        }
        
        if (input$weeks >=9 & input$weeks <=19) {
            return(list(
                src = "www/parr.png",
                contentType = "image/png",
                alt = "parr"
            ))
        }
        
        if (input$weeks >=20 & input$weeks <=40) {
            return(list(
                src = "www/smolt.png",
                contentType = "image/png",
                alt = "smolt"
            ))
        
            
        } else if (input$weeks > 40) {
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
        
        if (input$weeks >=0 & input$weeks <=2) {
            return("a salmon egg")
        }    
        
        if (input$weeks >=3 & input$weeks <=4) {
            return("an alevin")
        }
        
        if (input$weeks >=5 & input$weeks <=8) {
            return("a fry")
        }
        
        if (input$weeks >=9 & input$weeks <=19) {
            return("a parr")
        }
        
        if (input$weeks>=20 & input$weeks <=40) {
            return("a smolt")
            
            
        } else if (input$weeks >40) {
            return("an adult salmon")
            
        }
        
    })
    
    output$text2 <- renderText({
        if (is.null(input$weeks))
            return(NULL)
        
        if (input$weeks >=0 & input$weeks <=2) {
            return("A salmon mother can typically lay up to several thousand eggs in her nest, which is called a redd. The redds are situated in gravel at the bottom of streams. The salmon eggs are about a half centimeter in diameter and transparent red in color, with the developing baby salmon observable from outside (especially the dark eye-spots). Eggs will hatch within eight to twenty-weeks depending on the salmon species and environmental conditions, such as the temperature and oxygen content of the stream water.")
        }    
        
        if (input$weeks >=3 & input$weeks <=4) {
            return("After a baby salmon hatches from its egg, it is called an alevin, or a sac-fry. Alevin still have large, visible yolk sacs attached to their bellies, which is where their alternative name comes from. These very young salmon babies stay in their redd (nest) and rely on their yolk sac for nutrition. Baby salmon remain in the nest as alevin for just three to six weeks.")
        }
        
        if (input$weeks >=5 & input$weeks <=8) {
            return("As baby salmon mature and use up their yolk-sacs, they will begin to swim up through the gravel making up the redd (nest) and start darting out into the overlying water to catch prey. At this point, they transition to being fry. Fry remain in their natal stream and feed primarily on insects but will also eat other invertebrates and plankton.")
        }
        
        if (input$weeks >=9 & input$weeks <=19) {
            return("Baby salmon fry quickly develop parr marks, or dark bars and spots along their sides that help keep them camouflaged in the stream environment. As fry develop these new markings, they become parr. Parr will usually remain in their home stream for one to three years.")
        }
        
        if (input$weeks >=20 & input$weeks <=40) {
            return("Baby salmon parr experience many morphological and physiological changes as they become smolt - a process known as smoltification. During smoltification, baby salmon lose their parr marks and become darker on their backs, lighter on their bellies, and silvery on their sides. This coloration pattern, known as counter-shading, will help the salmon stay camouflaged in the open ocean and it is a common coloration pattern for marine fish. In addition to the salmon's colors changing to prepare them for the ocean, the kidneys and gills also change to allow the smolt to survive in salt water. The smolt move away from their natal streams, but they do not head straight out to sea just yet. Smolt reside in the brackish waters of estuaries and tidal creeks for two to three years where they eat small fish, insects, crustaceans, and mollusks.")
            
            
        } else if (input$weeks >40) {
            return("When smolt are mature, they become adult (or post-smolt) salmon and migrate out to sea. Young adult salmon may live together in schools and inhabit deep waters where they hunt fish and crustaceans. Adult salmon do most of their feeding and growing at sea. After four to six years, salmon undergo another transition - to reproductive maturity - and will then travel back to their home stream to make their own nests and start the next generation of salmon.")
            
        }
        
    })
    
}
    


# Run the application 
shinyApp(ui = ui, server = server)
