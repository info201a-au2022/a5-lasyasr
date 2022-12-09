library(plotly)
color_button <- radioButtons(
  inputId = "color",
  label = "Change Color",
  choices = list(
    "Default" = "black",
    "Orange" = "orange",
    "Red"= "red",
    "Blue" = "blue")
)

continent_choice <- selectInput(
  inputId = "continent",
  label = "continent",
  choices = c("Africa","Asia","Australia", "Europe","North America",
              "South America")
)


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  titlePanel("Carbon Dioxide Emission"),
  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Introduction", verbatimTextOutput("introduction"),
                         h4("Since the year 1970, Carbon Dioxide 
                                  emissions have increased 90%.(epa.gov)"),
                         p("Carbon dioxide is measured by a sensor. Usually by
                           an NDIR CO2 sensor. This sensor takes a sample of 
                           infared light in an air sample and calculates the
                           amount of CO2 molecules."),
                         p("In the most recently calculated year, 2021, the 
                           cumulative CO2 rate for the world was 1736930.125 kt. 
                           It is also important to understand each continents 
                           contribution towards CO2 emissions. Seeing each
                           the CO2 values for each country can help give us 
                           insight and enables us to dig deeper into the cause
                           for these values. We can analyze the top continents
                           that produce the most CO2 and to bring awareness to
                           the situation."),
                         p("Being exposed to high levels of carbon dioxide can
                           affect the health of humans, as well as the earth
                           (climate change)."),
                         p("Africa: 49,133.684 kt"),
                         p("Antarctica: Insufficent Data"),
                         p("Asia: 557,596.562 kt"),
                         p("Australia: 18,968.83 kt"),
                         p("Europe: 537,244.188 kt "),
                         p("North America: 484,214.688 kt"),
                         p("South America: 44,267.539 kt")
                         ),
                         
                tabPanel("Visualizations",plotlyOutput("visualization"), 
                         sidebarPanel(
                           continent_choice,
                           color_button
                           ),
                         p("This graph shows us the growth of Carbon Dioxide
                             emissions over the years. This is important
                             because it helps us understand where most emissions
                             are coming from, and if there are ways we can 
                             reduce them in each continent (depending on the
                             population and lifestyle.)"),
                         p("For example we can see Europe and North America have
                           the most dramatic line growth meaning it had the most
                           CO2 emission increase compared to the rest of the 
                           world.")
                         )
    )
  )
)

