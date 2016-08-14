# utility script to create function skeletons for package
library(httr)
library(xml2)
library(magrittr)
library(rvest)
library(data.table)
library(rapportools)
library(RoxygenReady) #https://github.com/vertesy/roxygenready
library(whisker)
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
# remove jobs 1 for now as they are all one method
appMethods[[3]] <- appMethods[[3]][2]

appMethods <- setNames(lapply(names(appMethods), function(x){
  rbindlist(
    lapply(appMethods[[x]], function(y){
      setDT(y)
      y[, group := x]
    })
  )
}), names(appMethods))

appMethods <- rbindlist(appMethods, fill = TRUE)
setnames(appMethods, tocamel(tolower(names(appMethods))))
appMethods[, args := sapply(requestFields, function(x){
  rF <- sub("(.*):(.*)", "\\1", x)
  rF <- sub("-", "_", rF)
  rF <- paste0(paste(trimws(sub("(.*)\\(.*", "\\1", rF)), collapse =", "), ", ...")
  sub("^([^,].*)", ", \\1", rF)
})]
appMethods[, method := tocamel(tolower(method))]

funcTemp <- list(
  account = "
{{method}} <- function(account{{{args}}}){
  # {{description}}
  pathTemplate <- whisker.render(\"{{url}}\", data = obj)
  res <- queryAPI(verb = {{methodType}}, url = build_url(pathURL), source = \"{{method}}\", json = body,...)
}
")

appMethods[, RSLFuncs := sapply(rowSplit(appMethods), function(x){
  whisker.render(funcTemp[["account"]], x)
}
)]

appMethods[, RSLFuncs := gsub("js tests, js tests", "js_tests", RSLFuncs)]

# write templates to file based on group
appMethods[,write(file = paste0("R/", group, ".R"), paste(RSLFuncs, collapse = "")), by = group]

# create roxygen skeletons for files:
lapply(list.files("R", full.names = TRUE), function(x){
  RoxygenReady(x, overview =  FALSE)
})

appFiles <- list.files("R", full.names = TRUE)
annotInd <- grepl("annot", appFiles)
file.remove(appFiles[!annotInd])
file.rename(appFiles[annotInd], appFiles[!annotInd])


