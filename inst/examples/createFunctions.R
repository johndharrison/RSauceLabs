# utility script to create function skeletons for package
library(httr)
library(xml2)
library(magrittr)
library(rvest)
slURL <- list(
  accountMethods = "https://wiki.saucelabs.com/display/DOCS/Account+Methods",
  infoMethods = "https://wiki.saucelabs.com/display/DOCS/Information+Methods",
  jobMethods = "https://wiki.saucelabs.com/display/DOCS/Job+Methods",
  actUsageMethods = "https://wiki.saucelabs.com/display/DOCS/Test+Activity+and+Usage+Methods",
  tunnelMethds = "https://wiki.saucelabs.com/display/DOCS/Tunnel+Methods",
  tempStorageMethods = "https://wiki.saucelabs.com/display/DOCS/Temporary+Storage+Methods",
  jsUnitTestMethods = "https://wiki.saucelabs.com/display/DOCS/JavaScript+Unit+Testing+Methods"
)

readSLUrl <- function(appURL){
  appTable <- (doc <- appURL %>% read_html %>% xml_find_all("//table")) %>%
    html_table(header = TRUE)
  funcArgs <- lapply(doc, function(docT){
    fArgs <- docT %>% xml_find_all(".//td[@class='confluenceTd'][5]")
    fArgs <- lapply(fArgs, function(x){
      xml_text(xml_find_all(x, ".//li"))
    })
  })
  Map(function(aT, fA){
    aT$`Request Fields` <- fA
    aT
  }
  , aT = appTable
  , fA = funcArgs
  )
}

appMethods <- lapply(slURL, readSLUrl)
