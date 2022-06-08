# WEB SCRAPPING
# SCRAPPING WEBSITE
url <- 'https://www.amazon.com/product-reviews/B09JF5ZHQS/ref=cm_cr_arp_d_viewopt_sr?ie=UTF8&filterByStar=positive&reviewerType=all_reviews&pageNumber=1#reviews-filter-bar'

# HTML ELEMENTS from WEBSITE
my_html <- read_html(url)

# SEGREGATING TABLES
my_tables <- html_nodes(my_html, 'table')

# STORING A TABLE
products_table <- html_table(my_tables)[[1]]

# VIEWING THE TABLE
View(products_table)

# SAVING THE DATA
write.csv(products_table, "Products_review.csv")

#DATA PREPROCESSING
# IMPORTING DATASET
reviews <- read.csv("Products_review.csv")

# VIEW DATASET
View(reviews)

# SLICING COLUMNS
reviews <- products_table[,1:3]

#DELETING EXTRA COLUMN BY NAME
reviews <- reviews[,-2]

#RENAMING LABELS
names(reviews)[0] <- 'S.No.'
names(reviews)[1] <- 'Ratings'
names(reviews)[2] <- 'Rating_Percentage'

# VIEW MODIFIED TABLE
View(reviews)

# DATATYPES CHECK
str(reviews)

# SAVING THE DATA
write.csv(reviews, "Cleaned_products_review.csv")