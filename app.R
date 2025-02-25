library(shiny)
library(tidyverse)
library(countrycode)
library(plotly)

# Load data
artwork <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-01-12/artwork.csv')
artists <- readr::read_csv("https://github.com/tategallery/collection/raw/master/artist_data.csv")

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      body {
        background-image: url('imagedisplay1.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
      }
      .centered-title {
        text-align: center;
        color: #b9415e;
        font-size: 45px;
        font-family: 'Chalkduster', sans-serif;
      }
      .section-title {
        color: #b9415e;
        font-family: 'cursive', sans-serif;
      }
      .uppercase-text {
        text-transform: uppercase;
      }
    "))
  ),
  div(class = "centered-title uppercase-text", "ArtUnveil: Global Artistry & Gender Insights"),
  tabsetPanel(
    id = "main-tabs",

    # About tab
    tabPanel("About",
             fluidRow(
               column(10,
                      div(class = "about",
                          uiOutput('about'))
               )
             ),
             includeCSS("styles.css")
    ),

    tabPanel("Exploring Artists And Artwork",
             fluidRow(
               sidebarLayout(
                 sidebarPanel(
                   selectInput("artist", "Select Artist:", choices = c("", unique(artists$name)))
                 ),
                 mainPanel(
                   fluidRow(
                     column(width = 12,
                            div(id = "artist-info",
                                uiOutput("artist_details")
                            )
                     ),
                     column(width = 12,
                            div(id = "artwork-section",
                                h3("Trends in Artwork", style = "color: #b9415e;", class = "section-title"),

                                div(
                                  p("Embark on an artistic journey through mediums, dimensions, and the hidden stories they hold, unveiled with a simple dropdown. Watch as acquisition years intertwine with creation, painting a vivid tale of evolving trends and the passage of creative time.",style = "color: black;font-size: 16px; background-color: #f3f4f5; padding: 10px; margin-bottom: 20px;font-family: Helvetica;"),
                                ),

                                div(style = "border: 2px solid #afb6b9; background-color: #afb6b9; padding: 10px; margin-top: 20px;",
                                    plotlyOutput("artwork_plot")),

                                uiOutput("artwork_selector"),
                                uiOutput("selected_artwork_details")
                            )
                     ),
                     column(width = 12,
                            div(id = "user-interaction-section",
                                h3("Engage with the Artwork",style = "color: #b9415e;", class = "section-title"),
                                p("Why did you choose the specific rating for this artwork? What elements influenced your decision?", style = "color: black;font-size: 16px;font-family: Helvetica;"),
                                div(
                                  sliderInput("user_rating", "Rating:", min = 1, max = 5, value = 3),
                                  textInput("user_comment", "Comment:", value = ""),
                                  actionButton("submit_button", "Submit")
                                )
                            )
                     )
                   )
                 )
               )
             )
    ),


    # Gender Distribution tab
    tabPanel("Gender Distribution",
             fluidRow(
               sidebarLayout(
                 sidebarPanel(
                   checkboxGroupInput("selected_continents", "Select Continents:", choices = NULL)
                 ),
                 mainPanel(
                   fluidRow(
                     column(width = 12,
                            div(id = "distribution-section",
                                h3("Unraveling Gender Distribution Across Continents ", style = "color: #b9415e;", class = "section-title"),

                                p("Ever wondered about the interplay of gender and art across continents??This exploration seeks to unravel how diverse societies have historically influenced artistic expression, and how contemporary artists challenge, embrace, or transcend traditional gender boundaries in their pursuit of creative storytelling.",
                                  style = "color: black;font-size: 16px;background-color: #f3f4f5;  padding: 10px; margin-bottom: 20px;font-family: Helvetica;"),

                                checkboxGroupInput("selected_continents", "Select Continents:", choices = NULL),

                                div(style = "border: 2px solid #afb6b9; background-color: #afb6b9; padding: 10px; margin-top: 20px;",
                                    plotlyOutput("combined_distribution_plot")),
                            )
                     )
                   )
                 )
               )
             )
    ),

    # General Acquisition Trends tab
    tabPanel("General Acquisition Trends",
             fluidRow(
               sidebarLayout(
                 sidebarPanel(
                   radioButtons("geom_choice", "Choose plot:",
                                choices = c("geom_step", "geom_col", "geom_smooth"),
                                selected = "geom_smooth")
                 ),
                 mainPanel(
                   fluidRow(
                     column(width = 12,
                            div(id = "acquisition-gender-overview-section",
                                h3("General Acquisition Trends by Gender", style = "color: #b9415e;", class = "section-title"),

                                p("In this section, we shift our focus to the broader landscape of acquisitions and explore how gender plays a role in shaping these trends. Acquisitions are not only indicative of economic activities but can also reflect social dynamics and power structures. By analyzing acquisition trends through a gender lens, we aim to uncover potential variations and disparities that exist within different gender groups.",
                                  style = "color: black;font-size: 16px; background-color: #f3f4f5; padding: 10px; margin-bottom: 20px; font-family: Helvetica;"),


                                div(style = "border: 2px solid #afb6b9; background-color: #afb6b9; padding: 10px; margin-top: 20px;",
                                    plotlyOutput("acquisition_gender_overview_plot")),
                            )
                     )
                   )

                 )
               )
             )
    )
  )
)


server <- function(input, output, session) {

  selected_artists <- reactive({
    filter(artists, name %in% input$artist)
  })

  selected_artist_ids <- reactive({
    selected_artists()$id
  })

  selected_artwork <- reactive({
    artwork_data <- filter(artwork, artistId %in% selected_artist_ids())
  })

  user_interactions <- reactiveVal(data.frame(comment = character(0), rating = numeric(0)))



  output$artist_details <- renderUI({
    artist <- selected_artists()

    artist_info <- div(
      style = "font-size: 16px; line-height: 1.5;",
      h4(HTML("<strong>Artist Overview</strong>"), style = "color: #b9415e;font-family: Helvetica;"),
      p(HTML(paste("<strong>Name:</strong> ", artist$name))),
      p(HTML(paste("<strong>Gender:</strong> ", artist$gender))),
      p(HTML(paste("<strong>Birth Year:</strong> ", artist$yearOfBirth))),
      p(HTML(paste("<strong>Death Year:</strong> ", artist$yearOfDeath))),
      p(HTML(paste("<strong>Place of Birth:</strong> ", artist$placeOfBirth))),
      p(HTML(paste("<strong>Place of Death:</strong> ", artist$placeOfDeath)))
    )

    return(artist_info)
  })

  output$artwork_plot <- renderPlotly({
    artwork_data <- selected_artwork()

    # Calculating the difference between Year and Acquisition Year
    artwork_data$year_difference <- artwork_data$acquisitionYear - artwork_data$year

    p <- ggplot(artwork_data, aes(year, acquisitionYear)) +
      geom_point(color = "#b9415e",
                 aes(text = paste("Title:", title, "<br>Year Difference:", year_difference)),
                 size = 4, alpha = 0.7) +
      labs(x = "Year of Creation", y = "Year of Acquisition") +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5, color = "#b9415e", size = 16))

    ggplotly(p, tooltip = c("text", "size")) %>%
      layout(
        title = "Exploring Artistic Evolution: Creation vs. Acquisition Years",
        xaxis = list(title = "Year of Creation"),
        yaxis = list(title = "Year of Acquisition"),
        margin = list(l = 50, r = 50, b = 50, t = 80),
        plot_bgcolor = "#f5dae1",
        paper_bgcolor = "#f0c8d2"
      )
  })


  # Artwork selection
  output$artwork_selector <- renderUI({
    artwork_data <- selected_artwork()
    artwork_titles <- artwork_data$title
    selectInput("selected_artwork", "Select Artwork:", choices = artwork_titles)
  })


  output$selected_artwork_details <- renderUI({
    artwork_title <- input$selected_artwork
    artwork_info <- selected_artwork() %>%
      filter(title == artwork_title) %>%
      slice(1)
    div(
      h4("Selected Artwork Details", style = "color: black; font-family: Helvetica;"),
      p(HTML(paste("<strong>Title:</strong> ", artwork_info$title))),
      p(HTML(paste("<strong>Artist Role:</strong> ", artwork_info$artistRole))),
      p(HTML(paste("<strong>Medium:</strong> ", artwork_info$medium))),
      p(HTML(paste("<strong>Dimensions:</strong> ", artwork_info$dimensions))),
      p(HTML(paste("<strong>URL:</strong> ", tags$a(href = artwork_info$url, "View Artwork"))))
    )
  })

  # User Interaction
  output$user_interaction <- renderUI({
    div(
      HTML('<p>Leave a comment or rating:</p>'),
      sliderInput("user_rating", "Rating:", min = 1, max = 5, value = 3),
      textInput("user_comment", "Comment:", value = ""),
      actionButton("submit_button", "Submit")
    )
  })


  observeEvent(input$submit_button, {
    comment <- input$user_comment
    rating <- input$user_rating
    interaction_data <- data.frame(comment = comment, rating = rating)
    current_data <- user_interactions()
    updated_data <- rbind(current_data, interaction_data)
    user_interactions(updated_data)
  })

  output$user_interaction_display <- renderUI({
    interactions <- user_interactions()
    if (nrow(interactions) > 0) {
      interactions_div <- tableOutput("interaction_table")
      return(interactions_div)
    } else {
      return(NULL)
    }
  })

  # Calculating gender distribution across different continents

  artists_geography <- reactiveVal(NULL)
  continent_choices <- reactive({
    artists %>%
      mutate(continent = countrycode(placeOfBirth, origin = "country.name", destination = "continent")) %>%
      drop_na(continent) %>%
      pull(continent) %>%
      unique()
  })

  observe({
    updateCheckboxGroupInput(session, "selected_continents", choices = continent_choices())
  })

  output$combined_distribution_plot <- renderPlotly({
    selected_continents <- input$selected_continents

    artists_geography_data <- artists %>%
      mutate(continent = countrycode(placeOfBirth, origin = "country.name", destination = "continent")) %>%
      drop_na(continent) %>%
      filter(continent %in% selected_continents) %>%
      group_by(continent, gender) %>%
      summarise(count = n())

    p <- ggplot(artists_geography_data, aes(x = reorder(continent, count), y = count, fill = gender)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(x = "Continent", y = "Number of Artists") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      scale_fill_brewer(palette = "Set1")

    ggplotly(p) %>%
      layout(
        title = "Gender Distribution of Artists Across Continents",
        margin = list(l = 50, r = 50, b = 50, t = 50),
        plot_bgcolor = "#f5dae1",
        paper_bgcolor = "#f0c8d2"
      )
  })

  # Calculating acquisition_gender on a decade basis

  output$acquisition_gender_overview_plot <- renderPlotly({
    artwork_data <- artwork %>%
      filter(!is.na(acquisitionYear))

    aggregation_interval <- "decade"
    if (aggregation_interval == "year") {
      aggregation_unit <- "year(acquisitionYear)"
    } else if (aggregation_interval == "decade") {
      aggregation_unit <- "floor(acquisitionYear / 10) * 10"
    }

    acquisition_gender_overview <- artwork_data %>%
      left_join(artists, by = c("artistId" = "id")) %>%
      filter(!is.na(gender)) %>%
      mutate(acquisition_interval = eval(parse(text = aggregation_unit))) %>%
      group_by(gender, acquisition_interval) %>%
      summarise(count = n())

    geom_choice <- input$geom_choice

    p <- ggplot(acquisition_gender_overview, aes(x = acquisition_interval, y = count, color = gender)) +
      switch(geom_choice,
             "geom_step" = geom_step(se = FALSE, alpha = 0.5),
             "geom_col" = geom_col(se = FALSE, alpha = 0.5),
             "geom_smooth" = geom_smooth(se = FALSE, alpha = 0.5)
      ) +
      scale_color_manual(values = c("Male" = "blue", "Female" = "red", "Non-binary" = "purple")) +
      labs(x = "Acquisition Decade", y = "Number of Artworks Acquired", color = "Gender") +
      theme_gray() +
      theme(plot.title = element_text(hjust = 0.5, color = "#b9415e", size = 16))


    ggplotly(p) %>%
      layout(
        title = "Visualizing Gender-Based Artwork Acquisition Trends",
        margin = list(l = 50, r = 50, b = 50, t = 50),
        plot_bgcolor = "#f5dae1",
        paper_bgcolor = "#f0c8d2"
      )
  })



  output$about <- renderUI({
    knitr::knit("about.Rmd", quiet = TRUE) %>%
      markdown::markdownToHTML(fragment.only = TRUE) %>%
      HTML()
  })

}

shinyApp(ui = ui, server = server)
