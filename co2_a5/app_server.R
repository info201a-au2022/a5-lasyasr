# Define server logic required to draw a histogram
library(dplyr)
library(ggplot2)
library(plotly)
server <- function(input, output) {
########################Introduction###########################
#Each of these variable stores the cumulative co2 values for their respective 
#continent. 
  #Asia 
fun_asia <- function(){
  asia_co2 <- co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "Asia") %>% 
    pull(cumulative_co2)
  return(asia_co2)
}
  
  #Europe
fun_eur <- function(){
  europe_co2 <- co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "Europe") %>% 
    pull(cumulative_co2)
  return(europe_co2)
}
  
  #North America
fun_north_amer <- function(){
  north_amer_co2 <-co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "North America") %>% 
    pull(cumulative_co2)
  return(north_amer_co2)
}
  
  #Africa
fun_africa <- function(){
  africa_co2 <- co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "Africa") %>% 
    pull(cumulative_co2)
  return(africa_co2)
}
  
  #Antarctica
fun_antartica <- function(){
  antartica_co2 <- co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "Antartica") %>% 
    pull(cumulative_co2)
  return(antartica_co2)
}
  
  #Australia
fun_australia <- function(){
  australia_co2 <- co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "Australia") %>% 
    pull(cumulative_co2)
  return(australia_co2)
}
  
  #South America 
fun_south_amer <- function(){
  south_amer_co2 <-co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "South America") %>% 
    pull(cumulative_co2)
  return(south_amer_co2)
}
  #World
fun_world <- function(){
  world_co2 <-co2_data %>% 
    group_by(country) %>% 
    filter(year == max(year)) %>% 
    select(country, cumulative_co2) %>% 
    filter(country == "World") %>% 
    pull(cumulative_co2)
  return(world_co2)
}
year_range <- co2_data %>% 
  group_by(year) %>% 
  pull(year)
min_year <- min(year_range)
max_year <- max(year_range)
########################Visualization###########################
  output$visualization <- renderPlotly({
    co2_continent <- co2_data %>% 
      filter(country == input$continent) %>% 
      select(year, cumulative_co2)
    continent_graph <- co2_continent %>% 
      ggplot(aes(x=year, y=cumulative_co2)) +
      geom_point(size= 0.7, color= input$color)+
      ylab("Cumulative CO2 (kt)")+
      ggtitle("Carbon Dioxide Throughout the Years")
    

    continent_graph
  })
}
