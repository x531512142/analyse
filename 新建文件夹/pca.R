install.packages('xlsx')
library(xlsx)
library(mvstats)

data = read.xlsx('data.xlsx', sheetIndex = 1, encoding = "UTF-8")
dim(data)
data_zscore = scale(data[2:7])                 #z_score标准化


cor(data_zscore)
data_cor = cor(data_zscore)                    #相关系数矩阵
PCA = princomp(data_zscore,cor = T)            #主成分分析
summary(PCA)
eigen(data_cor)                                #主成分载荷
screeplot(PCA, type = 'lines')                 #碎石图
PCA$scores[,1:2]                               #主成分得分
princomp.rank(PCA, m = 2)                      #主成分排名

#write.xlsx(data_zscore, file = 'data.xlsx', sheetName = 'sheet2', append = T)
#write.xlsx(data_cor, file = 'data.xlsx', sheetName =  'sheet4', append = T)
