library("dplyr")
library("tibble")
library("readxl")
library("compare")

df_one_ACRS <- read_excel("./2018-1-ACRS.xlsx")
df_one_ACRS <- add_column(df_one_ACRS, SiteID = "ACRS", .after = "Collector ID")
names(df_one_ACRS)[28] <- "Race - American Indian or Alaska Native"
names(df_one_ACRS)[29] <- "Race - Asian, Asian-American"
names(df_one_ACRS)[30] <- "Race - Black, African-American, Other African"
names(df_one_ACRS)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_ACRS)[32] <- "Race - Hispanic, Latino"
names(df_one_ACRS)[33] <- "Race - Other"
names(df_one_ACRS)[34] <- "Race - White or Caucasian"
names(df_one_ACRS)[36] <- "Other (please specify)"
names(df_one_ACRS)[38] <- "Extra"
df_one_ACRS <- add_column(df_one_ACRS, Batch = "2018-1", .after = "Collector ID")
df_one_ACRS <- df_one_ACRS[-1,]
df_one_ACRS <- subset(df_one_ACRS, select = -c(has_responded))

df_one_Greenwood <- read_excel("./2018-1-Greenwood.xlsx")
df_one_Greenwood <- add_column(df_one_Greenwood, SiteID = "Greenwood", .after = "Collector ID")
names(df_one_Greenwood)[28] <- "Race - American Indian or Alaska Native"
names(df_one_Greenwood)[29] <- "Race - Asian, Asian-American"
names(df_one_Greenwood)[30] <- "Race - Black, African-American, Other African"
names(df_one_Greenwood)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_Greenwood)[32] <- "Race - Hispanic, Latino"
names(df_one_Greenwood)[33] <- "Race - Other"
names(df_one_Greenwood)[34] <- "Race - White or Caucasian"
names(df_one_Greenwood)[36] <- "Other (please specify)"
names(df_one_Greenwood)[38] <- "Extra"
df_one_Greenwood <- add_column(df_one_Greenwood, Batch = "2018-1", .after = "Collector ID")
df_one_Greenwood <- df_one_Greenwood[-1,]
df_one_Greenwood <- subset(df_one_Greenwood, select = -c(has_responded))

total <- rbind(df_one_ACRS, df_one_Greenwood)

df_one_IDIC <- read_excel("./2018-1-IDIC.xlsx")
df_one_IDIC <- add_column(df_one_IDIC, SiteID = "IDIC", .after = "Collector ID")
names(df_one_IDIC)[28] <- "Race - American Indian or Alaska Native"
names(df_one_IDIC)[29] <- "Race - Asian, Asian-American"
names(df_one_IDIC)[30] <- "Race - Black, African-American, Other African"
names(df_one_IDIC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_IDIC)[32] <- "Race - Hispanic, Latino"
names(df_one_IDIC)[33] <- "Race - Other"
names(df_one_IDIC)[34] <- "Race - White or Caucasian"
names(df_one_IDIC)[36] <- "Other (please specify)"
names(df_one_IDIC)[38] <- "Extra"
df_one_IDIC <- add_column(df_one_IDIC, Batch = "2018-1", .after = "Collector ID")
df_one_IDIC <- df_one_IDIC[-1,]
df_one_IDIC <- subset(df_one_IDIC, select = -c(has_responded))

total <- rbind(total, df_one_IDIC)

df_one_PMSC <- read_excel("./2018-1-PMSC.xlsx")
df_one_PMSC <- add_column(df_one_PMSC, SiteID = "PMSC", .after = "Collector ID")
names(df_one_PMSC)[28] <- "Race - American Indian or Alaska Native"
names(df_one_PMSC)[29] <- "Race - Asian, Asian-American"
names(df_one_PMSC)[30] <- "Race - Black, African-American, Other African"
names(df_one_PMSC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_PMSC)[32] <- "Race - Hispanic, Latino"
names(df_one_PMSC)[33] <- "Race - Other"
names(df_one_PMSC)[34] <- "Race - White or Caucasian"
names(df_one_PMSC)[36] <- "Other (please specify)"
names(df_one_PMSC)[38] <- "Extra"
df_one_PMSC <- add_column(df_one_PMSC, Batch = "2018-1", .after = "Collector ID")
df_one_PMSC <- df_one_PMSC[-1,]
df_one_PMSC <- subset(df_one_PMSC, select = -c(has_responded))

total <- rbind(total, df_one_PMSC)

df_one_Sunshine_Garden <- read_excel("./2018-1-Sunshine-Garden.xlsx")
df_one_Sunshine_Garden <- add_column(df_one_Sunshine_Garden, SiteID = "Sunshine Garden", .after = "Collector ID")
names(df_one_Sunshine_Garden)[28] <- "Race - American Indian or Alaska Native"
names(df_one_Sunshine_Garden)[29] <- "Race - Asian, Asian-American"
names(df_one_Sunshine_Garden)[30] <- "Race - Black, African-American, Other African"
names(df_one_Sunshine_Garden)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_Sunshine_Garden)[32] <- "Race - Hispanic, Latino"
names(df_one_Sunshine_Garden)[33] <- "Race - Other"
names(df_one_Sunshine_Garden)[34] <- "Race - White or Caucasian"
names(df_one_Sunshine_Garden)[36] <- "Other (please specify)"
names(df_one_Sunshine_Garden)[38] <- "Extra"
df_one_Sunshine_Garden <- add_column(df_one_Sunshine_Garden, Batch = "2018-1", .after = "Collector ID")
df_one_Sunshine_Garden <- df_one_Sunshine_Garden[-1,]
df_one_Sunshine_Garden <- subset(df_one_Sunshine_Garden, select = -c(has_responded))

total <- rbind(total, df_one_Sunshine_Garden)

df_one_Wallingford <- read_excel("./2018-1-Wallingford.xlsx")
df_one_Wallingford <- add_column(df_one_Wallingford, SiteID = "Wallingford", .after = "Collector ID")
names(df_one_Wallingford)[28] <- "Race - American Indian or Alaska Native"
names(df_one_Wallingford)[29] <- "Race - Asian, Asian-American"
names(df_one_Wallingford)[30] <- "Race - Black, African-American, Other African"
names(df_one_Wallingford)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_Wallingford)[32] <- "Race - Hispanic, Latino"
names(df_one_Wallingford)[33] <- "Race - Other"
names(df_one_Wallingford)[34] <- "Race - White or Caucasian"
names(df_one_Wallingford)[36] <- "Other (please specify)"
names(df_one_Wallingford)[38] <- "Extra"
df_one_Wallingford <- add_column(df_one_Wallingford, Batch = "2018-1", .after = "Collector ID")
df_one_Wallingford <- df_one_Wallingford[-1,]
df_one_Wallingford <- subset(df_one_Wallingford, select = -c(has_responded))
total <- rbind(total, df_one_Wallingford)

df_two_Greenwood <- read_excel("./2018-2-Greenwood.xlsx")
df_two_Greenwood <- subset(df_two_Greenwood, select = -c(`How would you describe your race/ethnicity`))
df_two_Greenwood <- add_column(df_two_Greenwood, SiteID = "Greenwood", .after = "Collector ID")
df_two_Greenwood <- add_column(df_two_Greenwood, Batch = "2018-2", .after = "Collector ID")
df_two_Greenwood <- add_column(df_two_Greenwood, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_Greenwood)[28] <- "Race - American Indian or Alaska Native"
names(df_two_Greenwood)[29] <- "Race - Asian, Asian-American"
names(df_two_Greenwood)[30] <- "Race - Black, African-American, Other African"
names(df_two_Greenwood)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_Greenwood)[32] <- "Race - Hispanic, Latino"
names(df_two_Greenwood)[33] <- "Race - Other"
names(df_two_Greenwood)[34] <- "Race - White or Caucasian"
names(df_two_Greenwood)[36] <- "Other (please specify)"
names(df_two_Greenwood)[38] <- "Extra"
df_two_Greenwood <- df_two_Greenwood[-1,]

total <- rbind(total, df_two_Greenwood)

df_two_IDIC <- read_excel("./2018-2-IDIC.xlsx")
df_two_IDIC <- subset(df_two_IDIC, select = -c(`How would you describe your race/ethnicity`))
df_two_IDIC <- add_column(df_two_IDIC, SiteID = "IDIC", .after = "Collector ID")
df_two_IDIC <- add_column(df_two_IDIC, Batch = "2018-2", .after = "Collector ID")
df_two_IDIC <- add_column(df_two_IDIC, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_IDIC)[28] <- "Race - American Indian or Alaska Native"
names(df_two_IDIC)[29] <- "Race - Asian, Asian-American"
names(df_two_IDIC)[30] <- "Race - Black, African-American, Other African"
names(df_two_IDIC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_IDIC)[32] <- "Race - Hispanic, Latino"
names(df_two_IDIC)[33] <- "Race - Other"
names(df_two_IDIC)[34] <- "Race - White or Caucasian"
names(df_two_IDIC)[36] <- "Other (please specify)"
names(df_two_IDIC)[38] <- "Extra"
df_two_IDIC <- df_two_IDIC[-1,]

total <- rbind(total, df_two_IDIC)

df_two_ACRS <- read_excel("./2018-2-ACRS.xlsx")
df_two_ACRS <- subset(df_two_ACRS, select = -c(`How would you describe your race/ethnicity`))
df_two_ACRS <- add_column(df_two_ACRS, SiteID = "ACRS", .after = "Collector ID")
df_two_ACRS <- add_column(df_two_ACRS, Batch = "2018-2", .after = "Collector ID")
df_two_ACRS <- add_column(df_two_ACRS, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_ACRS)[28] <- "Race - American Indian or Alaska Native"
names(df_two_ACRS)[29] <- "Race - Asian, Asian-American"
names(df_two_ACRS)[30] <- "Race - Black, African-American, Other African"
names(df_two_ACRS)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_ACRS)[32] <- "Race - Hispanic, Latino"
names(df_two_ACRS)[33] <- "Race - Other"
names(df_two_ACRS)[34] <- "Race - White or Caucasian"
names(df_two_ACRS)[36] <- "Other (please specify)"
names(df_two_ACRS)[38] <- "Extra"
df_two_ACRS <- df_two_ACRS[-1,]

total <- rbind(total, df_two_ACRS)

df_two_PMSC <- read_excel("./2018-2-PMSC.xlsx")
df_two_PMSC <- subset(df_two_PMSC, select = -c(`How would you describe your race/ethnicity`))
df_two_PMSC <- add_column(df_two_PMSC, SiteID = "PMSC", .after = "Collector ID")
df_two_PMSC <- add_column(df_two_PMSC, Batch = "2018-2", .after = "Collector ID")
df_two_PMSC <- add_column(df_two_PMSC, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_PMSC)[28] <- "Race - American Indian or Alaska Native"
names(df_two_PMSC)[29] <- "Race - Asian, Asian-American"
names(df_two_PMSC)[30] <- "Race - Black, African-American, Other African"
names(df_two_PMSC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_PMSC)[32] <- "Race - Hispanic, Latino"
names(df_two_PMSC)[33] <- "Race - Other"
names(df_two_PMSC)[34] <- "Race - White or Caucasian"
names(df_two_PMSC)[36] <- "Other (please specify)"
names(df_two_PMSC)[38] <- "Extra"
df_two_PMSC <- df_two_PMSC[-1,]

total <- rbind(total, df_two_PMSC)

df_two_South_Park <- read_excel("./2018-2-South-Park.xlsx")
df_two_South_Park <- subset(df_two_South_Park, select = -c(`How would you describe your race/ethnicity`))
df_two_South_Park <- add_column(df_two_South_Park, SiteID = "South Park", .after = "Collector ID")
df_two_South_Park <- add_column(df_two_South_Park, Batch = "2018-2", .after = "Collector ID")
df_two_South_Park <- add_column(df_two_South_Park, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_South_Park)[28] <- "Race - American Indian or Alaska Native"
names(df_two_South_Park)[29] <- "Race - Asian, Asian-American"
names(df_two_South_Park)[30] <- "Race - Black, African-American, Other African"
names(df_two_South_Park)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_South_Park)[32] <- "Race - Hispanic, Latino"
names(df_two_South_Park)[33] <- "Race - Other"
names(df_two_South_Park)[34] <- "Race - White or Caucasian"
names(df_two_South_Park)[36] <- "Other (please specify)"
names(df_two_South_Park)[38] <- "Extra"
df_two_South_Park <- df_two_South_Park[-1,]

total <- rbind(total, df_two_South_Park)

df_two_Sunshine_Garden <- read_excel("./2018-2-Sunshine-Garden.xlsx")
df_two_Sunshine_Garden <- subset(df_two_Sunshine_Garden, select = -c(`How would you describe your race/ethnicity`))
df_two_Sunshine_Garden <- add_column(df_two_Sunshine_Garden, SiteID = "Sunshine Garden", .after = "Collector ID")
df_two_Sunshine_Garden <- add_column(df_two_Sunshine_Garden, Batch = "2018-2", .after = "Collector ID")
df_two_Sunshine_Garden <- add_column(df_two_Sunshine_Garden, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_Sunshine_Garden)[28] <- "Race - American Indian or Alaska Native"
names(df_two_Sunshine_Garden)[29] <- "Race - Asian, Asian-American"
names(df_two_Sunshine_Garden)[30] <- "Race - Black, African-American, Other African"
names(df_two_Sunshine_Garden)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_Sunshine_Garden)[32] <- "Race - Hispanic, Latino"
names(df_two_Sunshine_Garden)[33] <- "Race - Other"
names(df_two_Sunshine_Garden)[34] <- "Race - White or Caucasian"
names(df_two_Sunshine_Garden)[36] <- "Other (please specify)"
names(df_two_Sunshine_Garden)[38] <- "Extra"
df_two_Sunshine_Garden <- df_two_Sunshine_Garden[-1,]

total <- rbind(total, df_two_Sunshine_Garden)

df_two_Wallingford <- read_excel("./2018-2-Wallingford.xlsx")
df_two_Wallingford <- subset(df_two_Wallingford, select = -c(`How would you describe your race/ethnicity`))
df_two_Wallingford <- add_column(df_two_Wallingford, SiteID = "Wallingford", .after = "Collector ID")
df_two_Wallingford <- add_column(df_two_Wallingford, Batch = "2018-2", .after = "Collector ID")
df_two_Wallingford <- add_column(df_two_Wallingford, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_Wallingford)[28] <- "Race - American Indian or Alaska Native"
names(df_two_Wallingford)[29] <- "Race - Asian, Asian-American"
names(df_two_Wallingford)[30] <- "Race - Black, African-American, Other African"
names(df_two_Wallingford)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_Wallingford)[32] <- "Race - Hispanic, Latino"
names(df_two_Wallingford)[33] <- "Race - Other"
names(df_two_Wallingford)[34] <- "Race - White or Caucasian"
names(df_two_Wallingford)[36] <- "Other (please specify)"
names(df_two_Wallingford)[38] <- "Extra"
df_two_Wallingford <- df_two_Wallingford[-1,]

total <- rbind(total, df_two_Wallingford)



# -----------------------
df_2017_1 <- read_excel("./2017-1.xlsx")
names(df_2017_1)[2] <- "Collector ID"
names(df_2017_1)[1] <- "Respondent ID"
names(df_2017_1)[4] <- "Start Date"
names(df_2017_1)[5] <- "End Date"
names(df_2017_1)[1] <- "Respondent ID"
names(df_2017_1)[10] <- "Custom Data 1"
names(df_2017_1)[9] <- "Last Name"
names(df_2017_1)[37] <- "Extra"
df_2017_1 <- add_column(df_2017_1, Batch = "2017-1", .after = "Collector ID")

total <- rbind(total, df_2017_1)

df_2017_2 <- read_excel("./2017-2.xlsx")
names(df_2017_2)[2] <- "Collector ID"
names(df_2017_2)[1] <- "Respondent ID"
names(df_2017_2)[4] <- "Start Date"
names(df_2017_2)[5] <- "End Date"
names(df_2017_2)[1] <- "Respondent ID"
names(df_2017_2)[10] <- "Custom Data 1"
names(df_2017_2)[9] <- "Last Name"
names(df_2017_2)[37] <- "Extra"
df_2017_2 <- add_column(df_2017_2, Batch = "2017-2", .after = "Collector ID")

total <- rbind(total, df_2017_2)



#------------------------------

df_one_2019_Wallingford <- read_excel("./2019-1-Wallingford.xlsx")
df_one_2019_Wallingford <- subset(df_one_2019_Wallingford, select = -c(`How would you describe your race/ethnicity`))
df_one_2019_Wallingford <- add_column(df_one_2019_Wallingford, SiteID = "Wallingford", .after = "Collector ID")
df_one_2019_Wallingford <- add_column(df_one_2019_Wallingford, Batch = "2019-1", .after = "Collector ID")
df_one_2019_Wallingford <- add_column(df_one_2019_Wallingford, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_one_2019_Wallingford)[28] <- "Race - American Indian or Alaska Native"
names(df_one_2019_Wallingford)[29] <- "Race - Asian, Asian-American"
names(df_one_2019_Wallingford)[30] <- "Race - Black, African-American, Other African"
names(df_one_2019_Wallingford)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_2019_Wallingford)[32] <- "Race - Hispanic, Latino"
names(df_one_2019_Wallingford)[33] <- "Race - Other"
names(df_one_2019_Wallingford)[34] <- "Race - White or Caucasian"
names(df_one_2019_Wallingford)[36] <- "Other (please specify)"
names(df_one_2019_Wallingford)[38] <- "Extra"
df_one_2019_Wallingford <- df_one_2019_Wallingford[-1,]

total <- rbind(total, df_one_2019_Wallingford)

df_one_2019_PMSC <- read_excel("./2019-1-PMSC.xlsx")
df_one_2019_PMSC <- subset(df_one_2019_PMSC, select = -c(`How would you describe your race/ethnicity`))
df_one_2019_PMSC <- add_column(df_one_2019_PMSC, SiteID = "PMSC", .after = "Collector ID")
df_one_2019_PMSC <- add_column(df_one_2019_PMSC, Batch = "2019-1", .after = "Collector ID")
df_one_2019_PMSC <- add_column(df_one_2019_PMSC, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_one_2019_PMSC)[28] <- "Race - American Indian or Alaska Native"
names(df_one_2019_PMSC)[29] <- "Race - Asian, Asian-American"
names(df_one_2019_PMSC)[30] <- "Race - Black, African-American, Other African"
names(df_one_2019_PMSC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_2019_PMSC)[32] <- "Race - Hispanic, Latino"
names(df_one_2019_PMSC)[33] <- "Race - Other"
names(df_one_2019_PMSC)[34] <- "Race - White or Caucasian"
names(df_one_2019_PMSC)[36] <- "Other (please specify)"
names(df_one_2019_PMSC)[38] <- "Extra"
df_one_2019_PMSC <- df_one_2019_PMSC[-1,]

total <- rbind(total, df_one_2019_PMSC)

df_one_2019_IDIC <- read_excel("./2019-1-IDIC.xlsx")
df_one_2019_IDIC <- subset(df_one_2019_IDIC, select = -c(`How would you describe your race/ethnicity`))
df_one_2019_IDIC <- add_column(df_one_2019_IDIC, SiteID = "IDIC", .after = "Collector ID")
df_one_2019_IDIC <- add_column(df_one_2019_IDIC, Batch = "2019-1", .after = "Collector ID")
df_one_2019_IDIC <- add_column(df_one_2019_IDIC, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_one_2019_IDIC)[28] <- "Race - American Indian or Alaska Native"
names(df_one_2019_IDIC)[29] <- "Race - Asian, Asian-American"
names(df_one_2019_IDIC)[30] <- "Race - Black, African-American, Other African"
names(df_one_2019_IDIC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_2019_IDIC)[32] <- "Race - Hispanic, Latino"
names(df_one_2019_IDIC)[33] <- "Race - Other"
names(df_one_2019_IDIC)[34] <- "Race - White or Caucasian"
names(df_one_2019_IDIC)[36] <- "Other (please specify)"
names(df_one_2019_IDIC)[38] <- "Extra"
df_one_2019_IDIC <- df_one_2019_IDIC[-1,]

total <- rbind(total, df_one_2019_IDIC)

df_one_2019_Greenwood <- read_excel("./2019-1-Greenwood.xlsx")
df_one_2019_Greenwood <- subset(df_one_2019_Greenwood, select = -c(`How would you describe your race/ethnicity`))
df_one_2019_Greenwood <- add_column(df_one_2019_Greenwood, SiteID = "Greenwood", .after = "Collector ID")
df_one_2019_Greenwood <- add_column(df_one_2019_Greenwood, Batch = "2019-1", .after = "Collector ID")
df_one_2019_Greenwood <- add_column(df_one_2019_Greenwood, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_one_2019_Greenwood)[28] <- "Race - American Indian or Alaska Native"
names(df_one_2019_Greenwood)[29] <- "Race - Asian, Asian-American"
names(df_one_2019_Greenwood)[30] <- "Race - Black, African-American, Other African"
names(df_one_2019_Greenwood)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_2019_Greenwood)[32] <- "Race - Hispanic, Latino"
names(df_one_2019_Greenwood)[33] <- "Race - Other"
names(df_one_2019_Greenwood)[34] <- "Race - White or Caucasian"
names(df_one_2019_Greenwood)[36] <- "Other (please specify)"
names(df_one_2019_Greenwood)[38] <- "Extra"
df_one_2019_Greenwood <- df_one_2019_Greenwood[-1,]

total <- rbind(total, df_one_2019_Greenwood)

df_one_2019_Sunshine_Garden <- read_excel("./2019-1-Sunshine-Garden.xlsx")
df_one_2019_Sunshine_Garden <- subset(df_one_2019_Sunshine_Garden, select = -c(`How would you describe your race/ethnicity`))
df_one_2019_Sunshine_Garden <- add_column(df_one_2019_Sunshine_Garden, SiteID = "Sunshine Garden", .after = "Collector ID")
df_one_2019_Sunshine_Garden <- add_column(df_one_2019_Sunshine_Garden, Batch = "2019-1", .after = "Collector ID")
df_one_2019_Sunshine_Garden <- add_column(df_one_2019_Sunshine_Garden, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_one_2019_Sunshine_Garden)[28] <- "Race - American Indian or Alaska Native"
names(df_one_2019_Sunshine_Garden)[29] <- "Race - Asian, Asian-American"
names(df_one_2019_Sunshine_Garden)[30] <- "Race - Black, African-American, Other African"
names(df_one_2019_Sunshine_Garden)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_2019_Sunshine_Garden)[32] <- "Race - Hispanic, Latino"
names(df_one_2019_Sunshine_Garden)[33] <- "Race - Other"
names(df_one_2019_Sunshine_Garden)[34] <- "Race - White or Caucasian"
names(df_one_2019_Sunshine_Garden)[36] <- "Other (please specify)"
names(df_one_2019_Sunshine_Garden)[38] <- "Extra"
df_one_2019_Sunshine_Garden <- df_one_2019_Sunshine_Garden[-1,]

total <- rbind(total, df_one_2019_Sunshine_Garden)

df_one_2019_ACRS <- read_excel("./2019-1-ACRS.xlsx")
df_one_2019_ACRS <- subset(df_one_2019_ACRS, select = -c(`How would you describe your race/ethnicity`))
df_one_2019_ACRS <- add_column(df_one_2019_ACRS, SiteID = "ACRS", .after = "Collector ID")
df_one_2019_ACRS <- add_column(df_one_2019_ACRS, Batch = "2019-1", .after = "Collector ID")
df_one_2019_ACRS <- add_column(df_one_2019_ACRS, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_one_2019_ACRS)[28] <- "Race - American Indian or Alaska Native"
names(df_one_2019_ACRS)[29] <- "Race - Asian, Asian-American"
names(df_one_2019_ACRS)[30] <- "Race - Black, African-American, Other African"
names(df_one_2019_ACRS)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_one_2019_ACRS)[32] <- "Race - Hispanic, Latino"
names(df_one_2019_ACRS)[33] <- "Race - Other"
names(df_one_2019_ACRS)[34] <- "Race - White or Caucasian"
names(df_one_2019_ACRS)[36] <- "Other (please specify)"
names(df_one_2019_ACRS)[38] <- "Extra"
df_one_2019_ACRS <- df_one_2019_ACRS[-1,]

total <- rbind(total, df_one_2019_ACRS)

#---------------------

df_two_2019_Wallingford <- read_excel("./2019-2-Wallingford.xlsx")
df_two_2019_Wallingford <- subset(df_two_2019_Wallingford, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_Wallingford <- add_column(df_two_2019_Wallingford, SiteID = "Wallingford", .after = "Collector ID")
df_two_2019_Wallingford <- add_column(df_two_2019_Wallingford, Batch = "2019-2", .after = "Collector ID")
df_two_2019_Wallingford <- add_column(df_two_2019_Wallingford, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_Wallingford)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_Wallingford)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_Wallingford)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_Wallingford)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_Wallingford)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_Wallingford)[33] <- "Race - Other"
names(df_two_2019_Wallingford)[34] <- "Race - White or Caucasian"
names(df_two_2019_Wallingford)[36] <- "Other (please specify)"
names(df_two_2019_Wallingford)[38] <- "Extra"
df_two_2019_Wallingford <- df_two_2019_Wallingford[-1,]

total <- rbind(total, df_two_2019_Wallingford)

df_two_2019_PMSC <- read_excel("./2019-2-PMSC.xlsx")
df_two_2019_PMSC <- subset(df_two_2019_PMSC, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_PMSC <- add_column(df_two_2019_PMSC, SiteID = "PMSC", .after = "Collector ID")
df_two_2019_PMSC <- add_column(df_two_2019_PMSC, Batch = "2019-2", .after = "Collector ID")
df_two_2019_PMSC <- add_column(df_two_2019_PMSC, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_PMSC)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_PMSC)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_PMSC)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_PMSC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_PMSC)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_PMSC)[33] <- "Race - Other"
names(df_two_2019_PMSC)[34] <- "Race - White or Caucasian"
names(df_two_2019_PMSC)[36] <- "Other (please specify)"
names(df_two_2019_PMSC)[38] <- "Extra"
df_two_2019_PMSC <- df_two_2019_PMSC[-1,]

total <- rbind(total, df_two_2019_PMSC)

df_two_2019_IDIC <- read_excel("./2019-2-IDIC.xlsx")
df_two_2019_IDIC <- subset(df_two_2019_IDIC, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_IDIC <- add_column(df_two_2019_IDIC, SiteID = "IDIC", .after = "Collector ID")
df_two_2019_IDIC <- add_column(df_two_2019_IDIC, Batch = "2019-2", .after = "Collector ID")
df_two_2019_IDIC <- add_column(df_two_2019_IDIC, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_IDIC)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_IDIC)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_IDIC)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_IDIC)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_IDIC)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_IDIC)[33] <- "Race - Other"
names(df_two_2019_IDIC)[34] <- "Race - White or Caucasian"
names(df_two_2019_IDIC)[36] <- "Other (please specify)"
names(df_two_2019_IDIC)[38] <- "Extra"
df_two_2019_IDIC <- df_two_2019_IDIC[-1,]

total <- rbind(total, df_two_2019_IDIC)

df_two_2019_Greenwood <- read_excel("./2019-2-Greenwood.xlsx")
df_two_2019_Greenwood <- subset(df_two_2019_Greenwood, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_Greenwood <- add_column(df_two_2019_Greenwood, SiteID = "Greenwood", .after = "Collector ID")
df_two_2019_Greenwood <- add_column(df_two_2019_Greenwood, Batch = "2019-2", .after = "Collector ID")
df_two_2019_Greenwood <- add_column(df_two_2019_Greenwood, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_Greenwood)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_Greenwood)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_Greenwood)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_Greenwood)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_Greenwood)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_Greenwood)[33] <- "Race - Other"
names(df_two_2019_Greenwood)[34] <- "Race - White or Caucasian"
names(df_two_2019_Greenwood)[36] <- "Other (please specify)"
names(df_two_2019_Greenwood)[38] <- "Extra"
df_two_2019_Greenwood <- df_two_2019_Greenwood[-1,]

total <- rbind(total, df_two_2019_Greenwood)

df_two_2019_Sunshine_Garden <- read_excel("./2019-2-Sunshine-Garden.xlsx")
df_two_2019_Sunshine_Garden <- subset(df_two_2019_Sunshine_Garden, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_Sunshine_Garden <- add_column(df_two_2019_Sunshine_Garden, SiteID = "Sunshine Garden", .after = "Collector ID")
df_two_2019_Sunshine_Garden <- add_column(df_two_2019_Sunshine_Garden, Batch = "2019-2", .after = "Collector ID")
df_two_2019_Sunshine_Garden <- add_column(df_two_2019_Sunshine_Garden, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_Sunshine_Garden)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_Sunshine_Garden)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_Sunshine_Garden)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_Sunshine_Garden)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_Sunshine_Garden)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_Sunshine_Garden)[33] <- "Race - Other"
names(df_two_2019_Sunshine_Garden)[34] <- "Race - White or Caucasian"
names(df_two_2019_Sunshine_Garden)[36] <- "Other (please specify)"
names(df_two_2019_Sunshine_Garden)[38] <- "Extra"
df_two_2019_Sunshine_Garden <- df_two_2019_Sunshine_Garden[-1,]

total <- rbind(total, df_two_2019_Sunshine_Garden)

df_two_2019_ACRS <- read_excel("./2019-2-ACRS.xlsx")
df_two_2019_ACRS <- subset(df_two_2019_ACRS, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_ACRS <- add_column(df_two_2019_ACRS, SiteID = "ACRS", .after = "Collector ID")
df_two_2019_ACRS <- add_column(df_two_2019_ACRS, Batch = "2019-2", .after = "Collector ID")
df_two_2019_ACRS <- add_column(df_two_2019_ACRS, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_ACRS)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_ACRS)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_ACRS)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_ACRS)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_ACRS)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_ACRS)[33] <- "Race - Other"
names(df_two_2019_ACRS)[34] <- "Race - White or Caucasian"
names(df_two_2019_ACRS)[36] <- "Other (please specify)"
names(df_two_2019_ACRS)[38] <- "Extra"
df_two_2019_ACRS <- df_two_2019_ACRS[-1,]

total <- rbind(total, df_two_2019_ACRS)

df_two_2019_GWP <- read_excel("./2019-2-GWP.xlsx")
df_two_2019_GWP <- subset(df_two_2019_GWP, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_GWP <- add_column(df_two_2019_GWP, SiteID = "GWP", .after = "Collector ID")
df_two_2019_GWP <- add_column(df_two_2019_GWP, Batch = "2019-2", .after = "Collector ID")
df_two_2019_GWP <- add_column(df_two_2019_GWP, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_GWP)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_GWP)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_GWP)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_GWP)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_GWP)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_GWP)[33] <- "Race - Other"
names(df_two_2019_GWP)[34] <- "Race - White or Caucasian"
names(df_two_2019_GWP)[36] <- "Other (please specify)"
names(df_two_2019_GWP)[38] <- "Extra"
df_two_2019_GWP <- df_two_2019_GWP[-1,]

total <- rbind(total, df_two_2019_GWP)

df_two_2019_Southeast <- read_excel("./2019-2-Southeast.xlsx")
df_two_2019_Southeast <- subset(df_two_2019_Southeast, select = -c(`How would you describe your race/ethnicity`))
df_two_2019_Southeast <- add_column(df_two_2019_Southeast, SiteID = "Southeast", .after = "Collector ID")
df_two_2019_Southeast <- add_column(df_two_2019_Southeast, Batch = "2019-2", .after = "Collector ID")
df_two_2019_Southeast <- add_column(df_two_2019_Southeast, `Race - American Indian or Alaska Native` = "NA", .after = "I participate in the following activities at the senior center")
names(df_two_2019_Southeast)[28] <- "Race - American Indian or Alaska Native"
names(df_two_2019_Southeast)[29] <- "Race - Asian, Asian-American"
names(df_two_2019_Southeast)[30] <- "Race - Black, African-American, Other African"
names(df_two_2019_Southeast)[31] <- "Race - Hawaiian Native or Pacific Islander"
names(df_two_2019_Southeast)[32] <- "Race - Hispanic, Latino"
names(df_two_2019_Southeast)[33] <- "Race - Other"
names(df_two_2019_Southeast)[34] <- "Race - White or Caucasian"
names(df_two_2019_Southeast)[36] <- "Other (please specify)"
names(df_two_2019_Southeast)[38] <- "Extra"
df_two_2019_Southeast <- df_two_2019_Southeast[-1,]

total <- rbind(total, df_two_2019_Southeast)

total <- add_column(total, Race = NA, .after = "Race - White or Caucasian")

df_one_South_Park <- read_excel("./2018-1-South-Park.xlsx")
df_one_South_Park <- add_column(df_one_South_Park, SiteID = "South Park", .after = "Collector ID")
df_one_South_Park <- add_column(df_one_South_Park, Batch = "2018-1", .after = "Collector ID")
df_one_South_Park <- subset(df_one_South_Park, select = -c(has_responded))
df_one_South_Park <- add_column(df_one_South_Park, `Race - American Indian or Alaska Native`  = NA, .after = "I participate in the following activities at the senior center")
df_one_South_Park <- add_column(df_one_South_Park, `Race - Asian, Asian-American`  = NA, .after = "Race - American Indian or Alaska Native")
df_one_South_Park <- add_column(df_one_South_Park, `Race - Black, African-American, Other African`  = NA, .after = "Race - Asian, Asian-American")
df_one_South_Park <- add_column(df_one_South_Park, `Race - Hawaiian Native or Pacific Islander`  = NA, .after = "Race - Black, African-American, Other African")
df_one_South_Park <- add_column(df_one_South_Park, `Race - Hispanic, Latino`  = NA, .after = "Race - Hawaiian Native or Pacific Islander")
df_one_South_Park <- add_column(df_one_South_Park, `Race - Other`  = NA, .after = "Race - Hispanic, Latino")
df_one_South_Park <- add_column(df_one_South_Park, `Race - White or Caucasian`  = NA, .after = "Race - Other")
df_one_South_Park <- add_column(df_one_South_Park, `Other (please specify)`  = NA, .after = "What is your zip code")
df_one_South_Park <- add_column(df_one_South_Park, `Extra`  = NA, .after = "What is your estimated annual income")
names(df_one_South_Park)[35] <- "Race"
df_one_South_Park <- df_one_South_Park[-1,]

total <- rbind(total, df_one_South_Park)

df_two_South_Park <- read_excel("./2018-2-South-Park.xlsx")
df_two_South_Park <- add_column(df_two_South_Park, SiteID = "South Park", .after = "Collector ID")
df_two_South_Park <- add_column(df_two_South_Park, Batch = "2018-2", .after = "Collector ID")
df_two_South_Park <- add_column(df_two_South_Park, `Race - American Indian or Alaska Native`  = NA, .after = "I participate in the following activities at the senior center")
df_two_South_Park <- add_column(df_two_South_Park, `Race - Asian, Asian-American`  = NA, .after = "Race - American Indian or Alaska Native")
df_two_South_Park <- add_column(df_two_South_Park, `Race - Black, African-American, Other African`  = NA, .after = "Race - Asian, Asian-American")
df_two_South_Park <- add_column(df_two_South_Park, `Race - Hawaiian Native or Pacific Islander`  = NA, .after = "Race - Black, African-American, Other African")
df_two_South_Park <- add_column(df_two_South_Park, `Race - Hispanic, Latino`  = NA, .after = "Race - Hawaiian Native or Pacific Islander")
df_two_South_Park <- add_column(df_two_South_Park, `Race - Other`  = NA, .after = "Race - Hispanic, Latino")
df_two_South_Park <- add_column(df_two_South_Park, `Race - White or Caucasian`  = NA, .after = "Race - Other")
df_two_South_Park <- add_column(df_two_South_Park, `Other (please specify)`  = NA, .after = "What is your zip code")
df_two_South_Park <- add_column(df_two_South_Park, `Extra`  = NA, .after = "What is your estimated annual income")
names(df_two_South_Park)[35] <- "Race"
df_two_South_Park <- df_two_South_Park[-1,]

total <- rbind(total, df_two_South_Park)

df_one_2019_South_Park <- read_excel("./2019-1-South-Park.xlsx")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, SiteID = "South Park", .after = "Collector ID")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, Batch = "2019-1", .after = "Collector ID")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - American Indian or Alaska Native`  = NA, .after = "I participate in the following activities at the senior center")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - Asian, Asian-American`  = NA, .after = "Race - American Indian or Alaska Native")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - Black, African-American, Other African`  = NA, .after = "Race - Asian, Asian-American")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - Hawaiian Native or Pacific Islander`  = NA, .after = "Race - Black, African-American, Other African")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - Hispanic, Latino`  = NA, .after = "Race - Hawaiian Native or Pacific Islander")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - Other`  = NA, .after = "Race - Hispanic, Latino")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Race - White or Caucasian`  = NA, .after = "Race - Other")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Other (please specify)`  = NA, .after = "What is your zip code")
df_one_2019_South_Park <- add_column(df_one_2019_South_Park, `Extra`  = NA, .after = "What is your estimated annual income")
names(df_one_2019_South_Park)[35] <- "Race"
df_one_2019_South_Park <- df_one_2019_South_Park[-1,]

total <- rbind(total, df_one_2019_South_Park)

df_two_2019_South_Park <- read_excel("./2019-2-South-Park.xlsx")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, SiteID = "South Park", .after = "Collector ID")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, Batch = "2019-2", .after = "Collector ID")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - American Indian or Alaska Native`  = NA, .after = "I participate in the following activities at the senior center")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - Asian, Asian-American`  = NA, .after = "Race - American Indian or Alaska Native")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - Black, African-American, Other African`  = NA, .after = "Race - Asian, Asian-American")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - Hawaiian Native or Pacific Islander`  = NA, .after = "Race - Black, African-American, Other African")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - Hispanic, Latino`  = NA, .after = "Race - Hawaiian Native or Pacific Islander")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - Other`  = NA, .after = "Race - Hispanic, Latino")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Race - White or Caucasian`  = NA, .after = "Race - Other")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Other (please specify)`  = NA, .after = "What is your zip code")
df_two_2019_South_Park <- add_column(df_two_2019_South_Park, `Extra`  = NA, .after = "What is your estimated annual income")
names(df_two_2019_South_Park)[35] <- "Race"
df_two_2019_South_Park <- df_two_2019_South_Park[-1,]

total <- rbind(total, df_two_2019_South_Park)

write.csv(total,"C:\\Users\\navedkrishnamurthy\\Survey_Data\\total.csv", row.names = FALSE)
