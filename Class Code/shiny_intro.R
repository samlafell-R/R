

###------------------------------------### 
#
# Class 7 Exercise:
#
###------------------------------------###  

#Starting with the Shiny App code below, conducting the following:

  #1 Change the title to your Name (First and Last)
  #2 Change the default Highway MPG sliderInput to contain all of the data
  #3 Conduct a linear regression that uses the Y axis input as the response variable, and the X axis input as the independent variable. 
    #HINT: formula(paste()) may be useful
  #4 Plot the regression line on the scatter plot. Color it blue. 
  #5 Create an additional chart, a histogram, of the residuals of the linear regression. 
      #5.1 Add the chart beneath the correlation table.
      #5.2 Add a header above the histogram that says "Histogram of Residuals"

  #6 Take a screenshot of your application. Ensure all elements are visible.
  #7 Submit your code and screenshots in the quiz. Your last quiz submission will be graded.

  #Your code and app will be graded for the following elements:
    #1 Your application executes 
    #2 Your name is in the title 
    #3 The Highway MPG slider is defaulted to include all values 
    #4 A linear regression based off the input variables AND filtered data is in the server code
    #5 The fitted values of the regression are plotted on the scatter plot and the line is blue
    #6 The plotted values of the regression line changes based on varying selections of the inputs
    #7 A histogram of the regression residuals is plotted beneath the correlation table 
    #8 There is a header with "Histogram of Residuals" above the histogram 
    #9 The histogram changes based on varying selections of the inputs
    #10 The submitted screenshot of your application has all of the above elements 

##----------------##
## Starter Code
##----------------##

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)

#Cheatsheet: https://shiny.rstudio.com/images/shiny-cheatsheet.pdf
#Gallyer: https://shiny.rstudio.com/gallery/

df_mpg <- mpg
df_mpg <- select_if(df_mpg, is.numeric)

coefficients(lm(displ ~ hwy, data=df_mpg))

lit <- lm(displ~hwy, data=df_mpg)
residuals(lit)
ggplot(df_mpg) +
  geom_histogram(aes(x=residuals(lit)))

# Define UI - what do you want your app to look like / contain?
ui <- fluidPage(

  titlePanel("Sam LaFell"), 
  
  sidebarLayout(
    sidebarPanel(
      "Inputs will go here",
      sliderInput("mpghwyInput", "Highway MPG", min(df_mpg$hwy), max(df_mpg$hwy), c(min(df_mpg$hwy), max(df_mpg$hwy))),
      selectInput("x_axisInput", "X Axis", colnames(df_mpg), selected="hwy"),
      selectInput("y_axisInput", "Y Axis", colnames(df_mpg), selected="displ")
    )
    ,
    mainPanel(
      h4("Scatter plot of selected variables"),
      plotOutput("scatterOutput"),
      br(),
      h4("Correlation for Filtered Data"),
      tableOutput("correlationOutput"),
      br(),
      h4("Histogram of Residuals"),
      plotOutput("Hist")
    )
  )
  
)

# Define server logic - what do you want the R code to do?
server <- function(input, output) {
  
 #Filter the data using the hwy inputs
  filtered_data <- reactive({
    df_mpg %>% filter(hwy >= input$mpghwyInput[1] & hwy <= input$mpghwyInput[2])
  })
  
  #Linear Regression Model
  lin_reg <- reactive({
    coefficients(lm(formula(paste(input$y_axisInput, '~' , input$x_axisInput)), data=filtered_data()))
  })
  
  # Linear Model Residuals
  lin_resid <- reactive({
    residuals(lm(formula(paste(input$y_axisInput, '~' , input$x_axisInput)), data=filtered_data()))
  })
    
  #Create a scatter plot using the x and y axis
  output$scatterOutput <-  renderPlot({
    
    xcol <- input$x_axisInput
    ycol <- input$y_axisInput
    
    ggplot(filtered_data(), aes_string(x=xcol, y=ycol)) +
      geom_abline(intercept = lin_reg()[1], slope = lin_reg()[2], colour = 'blue') +
      geom_point()
      
  })
  
  # Create a Histogram of the values
  output$Hist <- renderPlot({
    ggplot() +
      geom_histogram(aes(x=lin_resid()))
  })
  
  #Create and return a correlation table
  output$correlationOutput <- renderTable({
    cor(filtered_data())
  })
  
}
# Run the app 
shinyApp(ui = ui, server = server)

