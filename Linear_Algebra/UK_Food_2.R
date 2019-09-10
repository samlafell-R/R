## UK Food Consumption PCA

food=read.csv("http://birch.iaa.ncsu.edu/~slrace/LinearAlgebra2020/Code/ukfood.csv", header=TRUE,row.names=1)
food=as.data.frame(t(food))
head(food)

food=data.frame(food)
food


## The prcomp function is the one I most often recommend for reasonably sized principal component calculations in R. This function returns a list with class “prcomp” containing the following components (from help prcomp):

## sdev: the standard deviations of the principal components (i.e., the square roots of the eigenvalues of the covariance/correlation matrix, though the calculation is actually done with the singular values of the data matrix).
## rotation: the matrix of variable loadings (i.e., a matrix whose columns contain the eigenvectors). The function princomp returns this in the element loadings.
## x: if retx is true the value of the rotated data (the centred (and scaled if requested) data multiplied by the rotation matrix) is returned. Hence, cov(x) is the diagonal matrix diag(sdev^2). For the formula method, napredict() is applied to handle the treatment of values omitted by the na.action.
## center, scale: the centering and scaling used, or FALSE.

pca = prcomp(food, scale = F)

## This first plot just looks at magnitudes of eigenvalues
plot(pca, main='Bar-style Screeplot')


# The next plot projects the four data points onto two dimensions maintaining the most variability
plot(pca$x, xlab = "Principal Component 1", ylab = "Principal Component 2", main = 'The four observations projected into 2-dimensional space')
text(pca$x[,1], pca$x[,2],row.names(food))


## Now we can also view our original variable axes projected down onto that same space! 
## A visual you can relate this to: Take a plane (piece of poster board) running at an 
## angle through the origin in 3 space. Think of the unit axis vectors being projected 
## orthogonally onto this poster board… The closer the plane comes to that axis, the longer 
## that projection will be. Long projections means that those principal components run close 
## to the original variable - they are highly correlated - as you move along that principal 
## component axis in space, you also move quickly in the direction of those original variables. 
## Shorter projections indicate less correlation with PCs. Less correlation with major 
## PCs may simply mean there isn’t much variance along those variables - 
##   the variables with the most variance are likely to dominate the first components, 
## particularly for correlation PCA.

biplot(pca, main='BiPlot: The observations and variables projected onto the same plane.',cex = c(2, 1.8))
