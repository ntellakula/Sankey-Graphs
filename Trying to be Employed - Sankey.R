library(plotly)
library(stringr)

mylabel <- c("Total Applications", "Rejected", "No Reply", "Reply",
             "Assessment", "Phone Interview", "Video Interview",
             "Offered", "Turned Down", "Multiple Phone Interviews",
             "On-site Interview", "Accepted")

mycolor <- c("rgba(0, 0, 255, 0.3)", "rgba(112, 54, 0, 0.3)", "rgba(255, 0, 0, 0.3)",
             "rgba(137, 0, 2, 0.3)", "rgba(255, 122, 0, 0.3)", "rgba(255, 0, 255, 0.3)",
             "rgba(207, 255, 178, 0.3)", "rgba(196, 196, 196, 0.3)",
             "rgba(130, 130, 130, 0.3)", "rgba(127, 255, 0, 0.3)",
             "rgba(0, 255, 255, 0.3)", "rgba(0, 255, 0, 0.3)")

mysource <- c(0, 0, 0, 3, 3, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 7, 7, 9, 9, 9, 9, 9,
              9, 10, 10)

mytarget <- c(1, 2, 3, 4, 5, 1, 7, 7, 1, 2, 6, 4, 9, 2, 4, 8, 11, 1, 2, 6, 4, 7,
              10, 1, 2)

myvalue <- c(79, 29, 19, 1, 18, 3, 1, 1, 2, 3, 1, 1, 10, 1, 1, 2, 1, 3, 1, 1, 1,
             1, 3, 2, 1)

path_color <- rep("", length(mysource))

for (i in c(1:length(mycolor))) {
  for (j in c(1:length(mysource))) {
    if (mysource[j] == i - 1) {
      path_color[j] <- mycolor[i]
      j = j + 1
    } else
      j = j + 1
  }
  i = i + 1
}

path_color2 <- str_replace(path_color, fixed("1)"), "0.3)")


p <- plot_ly(
  type = "sankey",
  domain = list(
    x =  c(0, 1),
    y =  c(0, 1)
  ),
  orientation = "h",
  valueformat = ".0f",
  
  node = list(
    label = mylabel,
    color = mycolor,
    pad = 15,
    thickness = 15,
    line = list(
      color = "black",
      width = 0.5
    )
  ),
  
  link = list(
    source = mysource,
    target = mytarget,
    value =  myvalue,
    color = path_color2
  )
) %>% 
  layout(
    title = "Hunt for Full Time Work as a STEM Graduate Student",
    font = list(
      size = 10
    ),
    xaxis = list(showgrid = F, zeroline = F),
    yaxis = list(showgrid = F, zeroline = F)
  )
p #source node as path color


r <- plot_ly(
  type = "sankey",
  domain = list(
    x =  c(0, 1),
    y =  c(0, 1)
  ),
  orientation = "h",
  valueformat = ".0f",
  
  node = list(
    label = mylabel,
    color = mycolor,
    pad = 15,
    thickness = 15,
    line = list(
      color = "black",
      width = 0.5
    )
  ),
  
  link = list(
    source = mysource,
    target = mytarget,
    value =  myvalue
  )
) %>% 
  layout(
    title = "Hunt for Full Time Work as a STEM Graduate Student",
    font = list(
      size = 10
    ),
    xaxis = list(showgrid = F, zeroline = F),
    yaxis = list(showgrid = F, zeroline = F)
  )
r #Grey path color



color_factor <- factor(mytarget,
                       levels = sort(unique(mytarget)),
                       labels = mycolor[2:length(mycolor)])


q <- plot_ly(
  type = "sankey",
  domain = list(
    x =  c(0, 1),
    y =  c(0, 1)
  ),
  orientation = "h",
  valueformat = ".0f",
  
  node = list(
    label = mylabel,
    color = mycolor,
    pad = 15,
    thickness = 15,
    line = list(
      color = "black",
      width = 0.5
    )
  ),
  
  link = list(
    source = mysource,
    target = mytarget,
    value =  myvalue,
    color = color_factor
  )
) %>% 
  layout(
    title = "Hunt for Full Time Work as a STEM Graduate Student",
    font = list(
      size = 10
    ),
    xaxis = list(showgrid = F, zeroline = F),
    yaxis = list(showgrid = F, zeroline = F)
  )
q #target node as path color
  