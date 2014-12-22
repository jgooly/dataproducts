library('shiny')

# define ui for application that plots population and internet usage by country over time.
shinyUI(pageWithSidebar(
    
    # application title
    headerPanel("Global Population and Internet Usage by Country"),
    
    # sidebar with a slider input for time series
    sidebarPanel(
        sliderInput("year", "Select years to display:", min=1965,
                    max=2013, value=c(1965, 2013), format="####"),
        
        # input country code
        textInput("countryCode", label="Enter the 3 letter country code (upper case)", value = "USA"),
        
        # about the app
        h3('About this app'),
        p('This application plots the population and number of people with internet access for a given country. All data was provided by the', a('World Bank.', href = 'http://www.worldbank.org/'), 'You can find a complete list of country codes at ', a('CountryCode.org', href = 'http://countrycode.org/')),
        h3('Development'),
        p('Created by ', a('Julian Ganguli', href = 'https://www.linkedin.com/in/julianganguli'),' using ', a('Shiny', href = 'http://shiny.rstudio.com/'), ' and hosted on ', a('ShinyApps.io', href= 'https://www.shinyapps.io'))
    ),
    
    mainPanel(
        
        plotOutput('countryPlot')
    )
))