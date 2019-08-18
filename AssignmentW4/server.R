library(ggplot2)
library(tidyverse)
library(lubridate)

shinyServer(
    function(input, output) {
        output$myplot <- renderPlot({
          # Caculate the number of days the plan is going to take
            actual_w <- input$id1
            target_w <- input$id2
            today <- today()
            target_date <- ymd(input$date)
            period <- unclass(difftime(target_date, today, units="days"))
          
          # Number of calories per day 
            numCalDay <- ((target_w- actual_w) * 7000) / period[1]
            output$oid1 = renderPrint({as.character(round(numCalDay), 0)})
            
          # Generation of the dataset with a linear model  
            date <- seq(today, target_date, by = "1 days")
           
            tib <- tibble(date) %>%
                mutate(kilograms = actual_w + (numCalDay / 7000) * (row_number() - 1))
          
          # Plot  
            p <- ggplot(tib, aes(date, kilograms)) +
                geom_line()
            print(p)
        })
    }
)


