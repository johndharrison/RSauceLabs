\dontrun{
myAcc <- account()
myTunnels <- getTunnels(myAcc)
#> myTunnels
#list()
# A tunnel needs to be started with sauceConnect
# ./sc-4.3.16-linux/bin/sc -u seleniumPipes -k ##########-####-####-####-#######
# we start one
myTunnels <- getTunnels(myAcc)
#> myTunnels
#[[1]]
#[1] "cbfb1981c9dd45d1a1ecb9dc47de5ba4"
tunnelInfo <- getTunnel(myAcc, tunnelID = myTunnels[[1]])
#> tunnelInfo[c("status", "host", "owner", "id")]
#$status
#[1] "running"
#
#$host
#[1] "maki81013.miso.saucelabs.com"
#
#$owner
#[1] "seleniumPipes"
#
#$id
#[1] "cbfb1981c9dd45d1a1ecb9dc47de5ba4"
res <- deleteTunnel(myAcc, tunnelID = myTunnels[[1]])
#> res
#$jobs_running
#[1] 0
#
#$result
#[1] TRUE
#
#$id
#[1] "cbfb1981c9dd45d1a1ecb9dc47de5ba4"

#> getTunnels(myAcc)
#list()

}
