## The function "descriptives" takes a database (raw or otherwise) and outputs
# common descriptive statistics. The inputs are the data to be processed, and if
# said data is raw (default = TRUE).

descriptives <- function(data, raw=TRUE) {
        require("psych")
#         Load the pair list.
        source("tracklist.R")
#         Check if the data has been processed, or if it is raw. If raw is TRUE,
#         it cleans and processes the data. If raw is FALSE, it runs the
#         descriptive statistics to the unchanged data.
        if (raw == T)) {
                #         Load helper functions
                source("reliability.check.R")
                source("clean.data.R")
#                 Run the data through the functions
#                 Remove unreliable cases
                reliable.data <- reliability.check(data)
#                 Clean and format the remaining cases
                clean.data <- clean.data.subjectwise(raw.data=reliable.data)
                desc <- as.data.frame(describe(clean.data))
        } else {
                desc <- as.data.frame(describe(data))
        }
#         Merge the pair list with the descriptive statistics
        descriptives <- merge(x=tracklist, y=desc, by.x="PairNumber", by.y="vars")
        descriptives
}

# ------------------------------------------------------------------------------
# David López Mejía, June 2014
