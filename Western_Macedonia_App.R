library(leaflet)
library(sf)
library(shiny)
library(rgdal)
library(rsconnect)
library(dplyr)
library(shinydashboardPlus)
library(shinydashboard)

# Define UI
##################################################################################################################################################

#Main Tab
maintab <- fluidPage(fluidRow( HTML(
  paste("<h1>Western Macedonia</h1><br/><br/><h3>This project visualizes the PUBLIC SQUARES, HOSPITALS and TOWN HALLS of some cities in Greece (Western Macedonia region) in 3 different languages.<br>
                                                    More specifically, it displays their position on the map, followed by a photo and a short text.<br/>
                                                    Initially I created the project for its publication in the &#34International Conference on the History and Memory of National Socialist Concentration Camps&#34<br>
                                                    (Berlin, Germany) entitled &#34Engraving The Memory&#34, visualization of historical data on the map.<br/>
                                                    It depicted various prose stories of Greek prose writers in occupied Thessaloniki by the Nazis.</h3><br/>
          &#8227;Παρακαλώ επιλέξτε γλώσσα  προεπισκόπησης από το menu.<br/>
          &#8227;Please select your language from the menu.<br/>
          &#8227;Bitte wählen Sie Ihre Sprache aus dem Menü aus.")),align="center", width = '100%'), # Add a line bottom of the page
       fluidRow( tags$hr(style=" border-color: lightblue; margin-top: 52vh;"),
         img(src='https://i.postimg.cc/T1FnPvBK/55a997a1-974a-416e-bfdb-a297a0b54971-200x200.png'),  # Add some images as sponsors if you have!
         img(src='https://i.postimg.cc/FsvcsvWJ/decad.png'),
         img(src='https://i.postimg.cc/Yq84rWLJ/promo-bikechain-logo.png'),
         img(src='https://i.postimg.cc/B663Cjn1/53011569-ad72-4e76-8c5a-e326bcc4221a-200x200.png'),
         align="center", width = '100%'), 
  )

# English Tab
OutEnglish <- leafletOutput("EnglishMap")
OutEnglishText <- wellPanel(htmlOutput("EnglishText"))
SideEnglish <- sidebarPanel(HTML(
  paste("<h3>Introduction</h3><br/>&#8226;Each marker on the map represents a building in its actual location.<br/>
&#8226;Zoom in/zoom out at the map to find the markers.<br/>
&#8226;Click on a marker to learn more about the building and view the photo.<br/>
&#8226;The short text will appear below the map.<br/>
&#8226;The color of each different marker represents each category of building.<br/>
&#8226;You can see which color represents which type of building from the panel at the bottom right of the map.")))
MainEnglish <- mainPanel(OutEnglish,OutEnglishText)

##################################################################################################################################################
#Greek Tab
OutGreek <- leafletOutput("GreekMap")
OutGreekText <- wellPanel(htmlOutput("GreekText"))
SideGreek <- sidebarPanel(HTML(
  paste("<h3>Οδηγίες</h3><br/>&#8226;Κάθε δείκτης στον χάρτη αντιπροσωπεύει ένα κτίριο στη πραγματική του τοποθεσία.<br/>
&#8226;Μεγεθύνεται/σμικρύνεται στο χάρτη για να βρείτε τους δείκτες.<br/>
&#8226;Κάντε κλικ σε έναν δείκτη για να μάθετε περισσότερες πληροφορίες σχετικά με το κτίριο και να δείτε την φωτογραφία.<br/>
&#8226;Το σύντομο κείμενο θα εμφανιστεί κάτω από τον χάρτη.<br/>
&#8226;Το χρώμα κάθε διαφορετικού δείκτη αντιπροσωπεύει κάθε κατηγορία κτιρίου.<br/>
&#8226;Μπορείτε να δείτε ποιο χρώμα αντιπροσωπεύει ποιον τύπο κτιρίου από το πινακάκι κάτω και δεξιά του χάρτη.")))
MainGreek <- mainPanel(OutGreek,OutGreekText)

##################################################################################################################################################
#German Tab
OutGerman <- leafletOutput("GermanMap")
OutGermanText <- wellPanel(htmlOutput("GermanText"))
SideGerman <- sidebarPanel(HTML(
  paste("<h3>Gebrauchsanleitung</h3><br/>&#8226;Jeder marker auf der Karte repräsentiert ein Gebäude an seinem tatsächlichen Standort.<br/>
&#8226;Vergrößert/verkleinert die Karte, um die marker zu finden.<br/>
&#8226;Klicken Sie auf eine marker, um mehr über das Gebäude zu erfahren und das Foto anzusehen.<br/>
&#8226;Der Kurztext erscheint unterhalb der Karte.<br/>
&#8226;Die Farbe jedes unterschiedlichen markers steht für jede Gebäudekategorie.<br/>
&#8226;Welche Farbe für welchen Gebäudetyp steht, können Sie dem Feld unten rechts auf der Karte entnehmen.")))
MainGerman <- mainPanel(OutGerman,OutGermanText)

#################################################################################################################################################
#Contact Tab Stelios
textStelios <- HTML(
  paste(" Graduated from the Department of Application Engineering at the University of Thessaly with a degree in Computer Engineering.
        In March 2020, he received a scholarship from the University of Nicosia, Cyprus, and participates in the postgraduate program
        MSc in Digital Currency and Blockchain and graduated in 2022. Now, he is a postgraduate student in the Department of Artificial
        Intelligence and Data Analysis at the University of Macedonia. He is the data analyst who created the database and visualized
        the data on the map. He also created the website.<br/><br/>"))


contactStelios <- box(title = "Stylianos Eleftheriadis",
    status = "primary",
    solidHeader = T,
    collapsible = T,
    width = 12,
    fluidRow(column(width = 10, span(textStelios, style="font-size: 16px")),
             column(width = 2, align = "center",
                    img(src="https://i.postimg.cc/yxLhJG34/received-421014038446753-Copy.jpg", width=200,height=200)),
             column(width = 10,HTML(paste("email:")),tags$a(href="mailto:eleftheriadis.stylianos@outlook.com","eleftheriadis.stylianos@outlook.com")),
             column(width = 10,HTML(paste("LinkedIn:")),tags$a(href="https://www.linkedin.com/in/stylianos-eleftheriadisdis","Eleftheriadis Stylianos"))))
             


#################################################################################################################################################
ui <- dashboardPage(
  dashboardHeader(title = "W.Macedonia"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Main", tabName = "Main", icon = icon("home")),
      menuItem("English", tabName = "English", icon = icon("globe-europe")),
      menuItem("Greek", tabName = "Greek", icon = icon("globe-europe")), 
      menuItem("German", tabName = "German", icon = icon("globe-europe")),
      menuItem("Contact Me", tabName = "Contact", icon = icon("address-card"))
    )
  ),
  
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "Main",
              fluidRow(maintab)
      ),
      # First tab content
      tabItem(tabName = "English",
              fluidRow(SideEnglish,MainEnglish)
      ),
      
      # Second tab content
      tabItem(tabName = "Greek",
              fluidRow(SideGreek,MainGreek)
      ),
      # Second tab content
      tabItem(tabName = "German",
              fluidRow(SideGerman,MainGerman)
     ),
     # Second tab content
     tabItem(tabName = "Contact",
             fluidRow(contactStelios)
     )
   )
 )
)

##################################################################################################################################################
# Define server logic       
server <- function(input, output, session) {
  
  ##################################################################################################################################################
  #ENglish Outputs (Map,Text)    
  output[['EnglishMap']] <- renderLeaflet({
    leaflet(data = points) %>% 
      addTiles() %>%
      addMarkers(data = points,
                 ~long, 
                 ~lat,
                 label = ~factor,
                 layerId = ~id,
                 popup = ~paste0(descriptio,
                     "<img src='",photo,"' width='300px' height='230px'>"),
                 icon = ~icons[factor],     #visualization icon depended clustering(factor)
                 clusterOptions = markerClusterOptions())%>%
      leaflet::addLegend("bottomright",pal = pal, values = points$factor, #add box with couples "color-novelists" (bottom and right)
                         title = "Building", #title of box
                         opacity = 1)
### To popup text,instead of:     
#popup = ~paste0(descriptio,
#    "<img src='",image_link,"' width='300px' height='230px'>")
#, use: popup = ~as.character(descriptio)  
    
  })
  # click on a marker
  observe({ 
    
    event <- input[['EnglishMap_marker_click']]
    
    message <- HTML(paste(points$English[points$id == event$id])) 
    
    output[['EnglishText']] <- renderText(message)
    
  })
  
  ##################################################################################################################################################
  #Greek Outputs (Map, Text)    
  output[['GreekMap']] <- renderLeaflet({
    leaflet(data = points) %>% 
      addTiles() %>%
      addMarkers(data = points,
                 ~long, 
                 ~lat,
                 label = ~GreekDescriptio,
                 layerId = ~id,
                 popup = ~paste0(GreekDescriptio,
                                 "<img src='",photo,"' width='300px' height='230px'>"),
                 icon = ~icons[factor],     #visualization icon depended clustering(factor)
                 clusterOptions = markerClusterOptions())%>%
      addLegend("bottomright",pal = Epal,
                values = points$GreekFactor,
                title = "Κτίριο",
                opacity = 1) 
  })
  # click on a marker
  observe({ 
    
    event <- input[['GreekMap_marker_click']]
    
    message <- HTML(paste(points$Greek[points$id == event$id])) 
    
    
    output[['GreekText']] <- renderText(message)
    
    
  })
  
  ##################################################################################################################################################
  #German Outputs (Map, Text)
  output[['GermanMap']] <- renderLeaflet({
    leaflet(data = points) %>% 
      addTiles() %>%
      addMarkers(data = points,
                 ~long, 
                 ~lat,
                 label = ~GermanDescriptio,
                 layerId = ~id,
                 popup = ~paste0(GermanDescriptio,
                                 "<img src='",photo,"' width='300px' height='230px'>"),
                 icon = ~Gicons[GermanFactor],     #visualization icon depended clustering(factor)
                 clusterOptions = markerClusterOptions())%>%
      addLegend("bottomright",pal = Gpal, values = points$GermanFactor,
                title = "Gebäude",
                opacity = 1) 
  })
  # click on a marker
  observe({ 
    
    event <- input[['GermanMap_marker_click']]
    
    message <- HTML(paste(points$German[points$id == event$id])) 
    
    output[['GermanText']] <- renderText(message)
    
  })
  
  
}

##################################################################################################################################################
# Run the application 
shinyApp(ui = ui, server = server)