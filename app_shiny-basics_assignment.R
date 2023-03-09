#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#### PACKAGES:
#### TODO: You may need to install some of these first
# To do so, uncomment and run the following line:
# install.packages(c("shinythemes", "plotly", "DT", "shiny", "ggplot2"))
# Now, comment it back up 
# DO NOT RUN THE APP WHILE THIS LINE IS COMMENTED
library(shiny)
library(ggplot2)
library(shinythemes)
library(plotly)
library(DT)

###########################################################################################################
###########################################################################################################
###########################################################################################################
#### INSTRUCTIONS: Integrated Assignment Outline ####
####
#### Complete the following app development checklist by adding
#### and customizing the appropriate Code Block in every part of this 
#### file containing the comment: [INSERT CODE HERE]
####
#### 1. Load genes_zbmi.rds into the app, as a dataframe
#### 2. Show data table on interface raw output, add DT formatting in server and ui
#### 3. Add dropdown selectors in ui for response and predictor
#### 4. Show exploratory and diagnostic plots of the model
#### 5. Put dropdowns in the sidebarPanel beside each other (2 columns in 1 fluidRow)
#### 6. Explore, then select a theme for your interface
####
#### Bonus material: 
#### 1. HTML headers: h1(), line breaks: hr(), and spaces: br()
#### 2. Fit regression model based on user-selected response and predictor variables
#### 3. Show the verbatim text output of the model equation and training summary
############################################################################################################
############################################################################################################
############################################################################################################


#### 1. Load genes_zbmi, as a dataframe ####
# NOTE: the app runs in its own working directory,
# not in the one you've set in RStudio previously
# so the genes_zbmi data object must be in the data/ directory you've created
genes_zbmi <- readRDS("data/genes_zbmi.rds")


# Define the user interface object
ui <- fluidPage( 
  
  #### 6. Explore, then select a theme for your interface ####
  # See Code Block 3 in the tagalong file for help
  # [INSERT CODE HERE]
  
  
  # Sidebar with information on the currently displayed model 
  sidebarLayout(
    sidebarPanel(
      
      #### Bonus material 1: insert a title for this panel using ####
      # the h4() HTML tag for type 4 header. 
      # There are 5 avaiilable,  varying in size.
      # Learn how to use it by typing: ?h4() 
      # Next, add hr() and br() to various parts of the layout 
      # to explore what they do
      # [INSERT CODE HERE]

      
      #### 3. Add dropdown selectors in ui for response and predictor ####
      # See ?selectizeInput() for help
      # [AUGMENT CODE BELOW]
      
      # selectizeInput("user_input1", 
      #                label = "Select a predictor variable", 
      #                choices = colnames(your_dataframe), 
      #                selected = colnames(your_dataframe)[1], 
      #                multiple = FALSE,
      #                width = '100%'),
      #
      # selectizeInput("user_input1", 
      #                label = "Select a response variable", 
      #                choices = colnames(your_dataframe), 
      #                selected = colnames(your_dataframe)[1], 
      #                multiple = FALSE,
      #                width = '100%'),
      
      
      #### 5. Put dropdowns above in the sidebarPanel ####
      # beside each other (2 columns in 1 fluidRow)
      # Make it look nice using the "width" and "offset" keywords (play with the values!)
      # See Code Block 3 in the tagalong file for help
      
      
      #### Bonus material 3. Show the verbatim text output of the model equation ####
      # and training summary using:
      # verbatimTextOutput(input$lm_formula),
      # verbatimTextOutput("lm_summary")
     
    ),
    
    mainPanel(
      
      # Page title (titlePanel gives it nice formatting)
      titlePanel("Explorations with regression!"),
      
      #### 4. Show exploratory and diagnostic plots of the model ####
      # plotly::ggplot client-side
      # See Code Block 1 in the tagalong file for help
      # plotlyOutput([INSERT CODE HERE]),
      
      #### 4. Show exploratory and diagnostic plots of the model ####
      # base R plot output
      # See Code Block 1 in the tagalong file for help
      # plotOutput([INSERT CODE HERE]),
      
      
      #### 2. Show data table on interface raw output, add DT ####
      # formatting in server and ui
      # See Code Block 2 in the tagalong file for help
      fluidRow (
        # [INSERT CODE HERE]
      )
    )
  )
)

# Define server logic 
server <- function(input, output) {
  
  #### 2. Show data table on interface raw output, add DT ####
  # formatting in server and ui
  # See Code Block 2 in the tagalong file for help
  output$lm_df <- renderDT(
    # this is example code (delete after completing this step):
    table(c(2,3,4), c(1,2,3))
    
    # [INSERT CODE HERE]
  )
  

  #### 4. Show exploratory and diagnostic plots of the model ####
  # See Code Block 1 in the tagalong file for help
  output$lm_plot <- renderPlotly({
    # this is example code (delete after completing this step):
    ggplot()
    
    # [INSERT CODE HERE]
    
    # NOTE 1: because our input$predictor and input$response are strings,
    # we use the double square bracket syntax to access the data
    # that our user is requesting
    # NOTE 2: .data refers to the data object you are passing to
    # ggplot in the function 
    
  })
  
  #### 4. Show exploratory and diagnostic plots of the model ####
  # See Code Block 1 in the tagalong file for help 
  # (but note that Code Block 1 deals with ggplot, not base R objects)
  # so some additional guidance can be given from the material on 
  # base R plots and lm()
  output$diagnostics <- renderPlot({
    # this is example code (delete after completing this step):
    plot()
    
    # par([INSERT CODE HERE])
    # plot(lm([INSERT CODE HERE]))
    
  })
  
  #### Bonus material 3. Show the verbatim text output of the model equation ####
  # and training summary using:
  # output$lm_formula <- renderText({
  #  
  #   # c([INSERT CODE HERE])
  # })
  
  # output$lm_summary <- renderPrint(
  #   # [INSERT CODE HERE]
  # )
}

# Run the application 
shinyApp(ui = ui, server = server)

