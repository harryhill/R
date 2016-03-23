# install.packages('pdftools')
library(pdftools)

#input path of pdf file which you want to collect data
path <- "/Users/Documents/pdf.pdf"

#collect info from pdf
pdf.info <- pdf_info(pdf = path)
names(pdf.info)
pdf.info

#import text data from pdf
text.data <- pdf_text(path)
text.data
