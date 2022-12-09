#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source("app_server.R")
source("app_ui.R")
co2_data <- read.csv("owid-co2-data.csv")
# Run the application
shinyApp(ui, server)
