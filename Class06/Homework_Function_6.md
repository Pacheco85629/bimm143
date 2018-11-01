Homework- Creating a Function
================
Alicia Pacheco
October 27, 2018

``` r
#install.packages("bio3d")
library (bio3d)
```

This is the function created to take any file name availabe in bio3d and automatically assigning a a character matrix containing all atomic coordinate ATOM data. Function reduces user error

``` r
obtain_datapoints <- function(file_name) {       #Takes in a PDB file name
  
 sub<- read.pdb(file_name)                       #Assigns a list of class "pdb" to "s"
   sub.chainA <- trim.pdb (sub, chain="A", elety="CA")   # Assigns smaller chain PDB object to s.chainA
     chain_and_atomtype <- sub.chainA$atom$b              #Assigns x with the chain identifier and atom type 
     
  return(chain_and_atomtype)                    #Returns chain vs atom type data points
}
```

Calling the function using the file's name, data points are stored in x,y and z respectivaly

``` r
x<-obtain_datapoints("4AKE")# kinase with drug
```

    ##   Note: Accessing on-line PDB file

``` r
y<-obtain_datapoints("1AKE")# kinase no drug
```

    ##   Note: Accessing on-line PDB file
    ##    PDB has ALT records, taking A only, rm.alt=TRUE

``` r
z<-obtain_datapoints("1E4Y")# kinase with drug
```

    ##   Note: Accessing on-line PDB file

Ploting all three kinases, with overlay for easier analysis

``` r
plot(x, typ="l", ylab="Bfactor", col="red")
points(y,typ="l", col="green3" )
points(z,type="l", col="skyblue")
```

![](Homework_Function_6_files/figure-markdown_github/unnamed-chunk-4-1.png)
