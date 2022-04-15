# Spatial Data Visualization On Map Using Shiny DashBoard And Leaflet  [![MIT License](https://img.shields.io/apm/l/atomic-design-ui.svg?)](https://github.com/tterb/atomic-design-ui/blob/master/LICENSEs)


The purpose of the application is to visualize spatial data in the Open Street Map. 
The visualization is done using the tools Shiny DashBoard and leaflet in the 
programming language R. More specifically, each marker on the map corresponds 
to an entry in the dataset. The use of the app is to visualize various buildings 
in Western Macedonia in Greece. Each building has a factor and is divided into **squares**,
**hospitals** and **town halls**. Each marker, depending on its color scheme, represents 1 of
these buildings. The cities are 4: Kozani, Serbia, Ptolemaida, Grevena. 

The user can browse the map, find the markers and by clicking on them to read a short historical
text related to the building but also to see a photo of it. Finally, this process is 
done in 3 languages: Greek, English, German. You can see the result of the code and the
data set by clicking [this link](https://stylianoseleftheriadis.shinyapps.io/WesterMacedonia).

Initially I created the project for its publication in the **"International Conference
on the History and Memory of National Socialist Concentration Camps"** (Berlin, Germany)
entitled **"Engraving The Memory"**, visualization of historical data on the map. 
It depicted various prose stories of Greek prose writers in occupied Thessaloniki by
the Nazis. (You can [find it here](https://skiaxtro.shinyapps.io/map2)).


##  Preparing Data 
- You can use my dataset, but also you can create your own. If you have difficulty findingthe coordinates you can use the QGIS app and create a **shp** file. You can find thecoordinates and integrate them into your dataset as you wish, however if you encounterany problems with the coordinates, you can run the **`export_coordinates_from_shp.R`** fileand copy/insert them to your dataset.
- Run the [**`Libraries.R `**](Libraries.R) file
- Run the **`DataPreprocessing.R`** file
- In case you have created your own dataset, make the necessary changes and configure it as you wish.
## instructions
- Complete **Preparing Data** and make sure you have a correct dataset
- Run the **`Western_Macedonia_App.R`** file
## Possible problems you may encounter
- It is very likely that you have a problem with encoding in non-Latin characters.
  In this case, make sure that you have loaded your dataset with **UTF-8** encoding. 
  If you continue to have problems, open your dataset file with the Notepad++ application, 
  and encode **UTF-8** so that the **BOM** is removed.
- There is a high probability that when you run the Application locally on your machine it will
  not display the non-Latin characters correctly. In this case if the encoding is correct,
  when you publish it to the shiny app, they will look correct.
- In each case find the correct encoding of the language you want.
- When it is published if you have a coding problem try to execute the following commands on the R 
   console. (The following example is about Greek Letters)
  ```
  parse (file ("<name.R>", encoding = "UTF-8"), n = -1L)
  options = "ENCODING = WINDOWS-1252"
  ```
- When it is published if the page does not load or is not connected to the server,
   make sure that you have published the last save of the **`.RData`** file.
- Libraries must also be in your main file when you publish it for it to work.
## License
My code is released under [MIT License](LICENSE).
## Author

- [@Stylianos Eleftheriadis](https://www.linkedin.com/in/stylianos-eleftheriadisdis/)

