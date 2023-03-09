###########################################################################################################
# R Shiny Tutorial: CBW EDA June 11-12 2020
# Starter code for app_shiny-basics_assignment.R
###########################################################################################################

###########################################################################################################
#### Code Block 0: T plots vs. ggplot ####
###########################################################################################################

ggplot(faithful, aes(x = waiting)) +
  geom_histogram( bins = input$bins, color = "mediumseagreen", fill="darkseagreen")

###########################################################################################################
####  Code Block 1: plotly::ggplotly #### 
###########################################################################################################

# Server-side code
output$lm_plot <- renderPlotly({
  
  plotly::ggplotly(
    ggplot(your_dataframe, aes(x=.data[[input$user_input1]], 
                               y=.data[[input$user_input2]])) +
      geom_point(shape=1, color ="darkblue") +
      geom_smooth(method=lm) + # Add linear regression line
      ylab(input$user_input3) +
      xlab(input$user_input4)
  )
}) 

# Client-side code 
ui <- fluidPage(
 # whatever other front-end code you’re including
  
  plotlyOutput("lm_plot"),
  
  selectizeInput("user_input1", 
                 label = "Select a response variable", 
                 choices = colnames(your_dataframe), 
                 selected = colnames(your_dataframe)[1], 
                 multiple = FALSE,
                 width = '100%')
)

###########################################################################################################
####  Code Block 2: DT::datatable #### 
###########################################################################################################

# Server-side code
server <- function(input, output) {
  output$lm_df <- DT::renderDT(your_dataframe)
  
  # whatever other back-end code you’re including
  
}

# Client-side code 
ui <- fluidPage(
  # whatever other front-end code you’re including
  
  DT::dataTableOutput("lm_df")
  
  # whatever other front-end code you’re including
  
)

###########################################################################################################
#### Code Block 3: Sidebar Layout and shinythemes::themeSelector #### 
###########################################################################################################

# Client-side code
ui <- fluidPage (
  shinythemes::themeSelector(),
  
  sidebarPanel(
    # some xOutput() call, or other front-end elements
  ),
  
  mainPanel(
    fluidRow( 
      column(width = 5, offset = 1
             # some xOutput call, or other front-end 
             # elements)
      )
    )
    
  )
  
)  

# Server-side code
# None.
# 