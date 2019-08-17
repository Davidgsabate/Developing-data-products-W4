#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(lubridate)

shinyUI(
    pageWithSidebar( 
        headerPanel("KCal calculator"), 
        sidebarPanel( p('With this calculator you can plan the evolution of your weight loss or gain. 
                        To do this, you must enter your current weight, your target weight, and the date on which you want 
                        to reach the goal. A graph will be shown with the estimated forecast of your evolution, 
                        along with the number of calories you must lose (-), or gain (+) each day to reach the goal.'),
                      numericInput('id1', 'Your actual weight (Kilograms)', 80, min = 40, max = 200, step = 1), 
                      numericInput('id2', 'Your target weight (Kilograms)', 79, min = 40, max = 200, step = 1),
                      dateInput("date", "Date on which you want to reach your goal", today() + days(7)) ), 
        mainPanel( 
            h4('Kcals/day you must gain(+) or lose(-) to achive your goal'), 
            verbatimTextOutput("oid1"),
            plotOutput("myplot",width=600,height=400)
            ) 
        ))
