
#' ---
#' title: "Homework week 06"
#' author: "Alicia Pacheco"
#' date: "October 2018"
#' ---
#install.packages("bio3d")

library (bio3d)

#------------------------------------------------------
#This is the function created to take any file name availabe in bio3d
#and automatically assigning a a character matrix containing all atomic coordinate ATOM data.
#Function reduces user error


obtain_datapoints <- function(file_name) {       #Takes in a PDB file name
  
 sub<- read.pdb(file_name)                       #Assigns a list of class "pdb" to "s"
   sub.chainA <- trim.pdb (sub, chain="A", elety="CA")   # Assigns smaller chain PDB object to s.chainA
     chain_and_atomtype <- sub.chainA$atom$b              #Assigns x with the chain identifier and atom type 
     
  return(chain_and_atomtype)                    #Returns chain vs atom type data points
}

#-------------------------------------------------------
#Calling the function using the file's name,
#data points are stored in x,y and z respectivaly

x<-obtain_datapoints("4AKE")# kinase with drug
y<-obtain_datapoints("1AKE")# kinase no drug
z<-obtain_datapoints("1E4Y")# kinase with drug

#-------------------------------------------------------
#Ploting all three kinases, with overlay for easier analysis 

plot(x, typ="l", ylab="Bfactor", col="red")
points(y,typ="l", col="green3" )
points(z,type="l", col="skyblue")





