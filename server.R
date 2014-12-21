library('shiny')
library('dplyr')
library('ggplot2')
library('reshape2')
load('global_stats.Rda')
global.stats$year <- as.numeric(global.stats$year)
names(global.stats) <- tolower(names(global.stats))
global.stats <- select(global.stats, country.code, country.name, year, population, internet_users)
global.stats <- melt(global.stats, id.vars = c('year', 'country.code', 'country.name'))

# define server logic required to draw a line chart
shinyServer(function(input, output) {
    
    country.code.data <- reactive(
        global.stats[which(global.stats$country.code == input$countryCode),]
        )

    output$countryPlot <- renderPlot({
        ggplot(country.code.data(), aes(x = year, y = value, group = variable, color = variable)) +
            geom_point() +
            geom_line() +
            theme_bw() +
            theme(legend.justification=c(1,0),
                  legend.position=c(1,0),
                  legend.title = element_blank(),
                  axis.title.x = element_text(size = 16),
                  axis.title.y = element_text(size = 16),
                  plot.title = element_text(size = 18)) +
            ggtitle(paste0('Population and internet users for: ', input$countryCode)) +
            ylab('') +
            xlim(input$year[1], input$year[2])
        })
    }
)

