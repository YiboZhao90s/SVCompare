#######################################################################################################
## Although the variable names are "MUC5AC" only, the region was expanded to cover MUC5B and +- 20kb ##
#######################################################################################################
## reformat and save raw variant lists called from 1KG and All of Us BCM cohort long-read seq
setwd("R:/TobinGroup/yz735/AllofUs_mucin_lrseq")
library(tidyr)
library(data.table)
# putting together All of Us VCF annotation files
BCM_ONT <- fread("v8.BCM_ONT_high.QualFT34_chr11.frq", fill = 36, header = F)
colnames(BCM_ONT) <- c("chr", "pos", "n_alleles", "n_chr", paste0("A", c(1:32)))
names_vec <- as.vector(rbind(paste0("A", 1:32), paste0("MAF", 1:32)))
BCM_ONT <- separate_wider_delim(BCM_ONT, cols = A1:A32, delim = ":", names_sep = "_", too_few = "align_start")
colnames(BCM_ONT) <- c("chr", "pos", "n_alleles", "n_chr", names_vec)
BCM_ONT_MUC5AC <- subset(BCM_ONT, pos >= 1137953 & pos <= 1282172)
# BCM_ONT_MUC5AC$var_length = nchar(BCM_ONT_MUC5AC$A2) - nchar(BCM_ONT_MUC5AC$A1)
# h <- hist(BCM_ONT_MUC5AC$var_length, plot = T, main = "Histogram of Variant Lengths MUC5AC", xlab = "Variant Length")
# head(BCM_ONT_MUC5AC)
#write.table(BCM_ONT_MUC5AC, "BCM_ONT_MUC5AC_MUC5B_SV.txt", sep = "\t", quote = F, row.names = F)

#BCM Sequel
BCM_Seq <- fread("v8.BCM_Seq_high.QualFT40_chr11.frq", fill = 36, header = F)
colnames(BCM_Seq) <- c("chr", "pos", "n_alleles", "n_chr", paste0("A", c(1:32)))
names_vec <- as.vector(rbind(paste0("A", 1:32), paste0("MAF", 1:32)))
BCM_Seq <- separate_wider_delim(BCM_Seq, cols = A1:A32, delim = ":", names_sep = "_", too_few = "align_start")
colnames(BCM_Seq) <- c("chr", "pos", "n_alleles", "n_chr", names_vec)
BCM_Seq_MUC5AC <- subset(BCM_Seq, pos >= 1137953 & pos <= 1282172)
# BCM_Seq_MUC5AC$var_length = nchar(BCM_Seq_MUC5AC$A2) - nchar(BCM_Seq_MUC5AC$A1)
# h <- hist(BCM_Seq_MUC5AC$var_length, plot = T, main = "Histogram of Variant Lengths MUC5AC", xlab = "Variant Length")
# head(BCM_Seq_MUC5AC)
#write.table(BCM_Seq_MUC5AC, "BCM_Seq_MUC5AC_MUC5B_SV.txt", sep = "\t", quote = F, row.names = F)

##BCM_Rev
BCM_Rev <- fread("v8.BCM_Rev_high.QualFT40_chr11.frq", fill = 36, header = F)
colnames(BCM_Rev) <- c("chr", "pos", "n_alleles", "n_chr", paste0("A", c(1:32)))
names_vec <- as.vector(rbind(paste0("A", 1:32), paste0("MAF", 1:32)))
BCM_Rev <- separate_wider_delim(BCM_Rev, cols = A1:A32, delim = ":", names_sep = "_", too_few = "align_start")
colnames(BCM_Rev) <- c("chr", "pos", "n_alleles", "n_chr", names_vec)
BCM_Rev_MUC5AC <- subset(BCM_Rev, pos >= 1137953 & pos <= 1282172)
# BCM_Rev_MUC5AC$var_length = nchar(BCM_Rev_MUC5AC$A2) - nchar(BCM_Rev_MUC5AC$A1)
# h1 <- hist(BCM_Rev_MUC5AC$var_length, plot = T, main = "Histogram of Variant Lengths MUC5AC", xlab = "Variant Length")
# head(BCM_Rev_MUC5AC)
#write.table(BCM_Rev_MUC5AC, "BCM_Rev_MUC5AC_MUC5B_SV.txt", sep = "\t", quote = F, row.names = F)

#One KG
OneKG_merge_MUC5AC <- fread("merged_MUC_sorted_dedup_MUC5AC_MUC5B.frq", fill = 10,header = T)
colnames(OneKG_merge_MUC5AC) <- c("chr", "pos", "n_alleles", "n_chr", "A1", "A2", "A3", "A4")
OneKG_merge_MUC5AC <- separate(OneKG_merge_MUC5AC, A1, into = c("A1", "MAF1"),sep = ":")
OneKG_merge_MUC5AC <- separate(OneKG_merge_MUC5AC, A2, into = c("A2", "MAF2"),sep = ":")
OneKG_merge_MUC5AC <- separate(OneKG_merge_MUC5AC, A3, into = c("A3", "MAF3"),sep = ":")
OneKG_merge_MUC5AC <- separate(OneKG_merge_MUC5AC, A4, into = c("A4", "MAF4"),sep = ":")
# head(OneKG_merge_MUC5AC)
# OneKG_merge_MUC5AC$var_length = nchar(OneKG_merge_MUC5AC$A2) - nchar(OneKG_merge_MUC5AC$A1)
# OneKG_merge_MUC5AC$pos <- as.numeric(OneKG_merge_MUC5AC$pos)
#h2 <- hist(OneKG_merge_MUC5AC$var_length, plot = T, main = "Histogram of Variant Lengths MUC5AC")
#write.table(OneKG_merge_MUC5AC, "OneKG_merge_MUC5AC_MUC5B_SV.txt", sep = "\t", quote = F, row.names = F)
