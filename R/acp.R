ACP <- function(DATAACT, DATASUP = NULL, VARACT, VARSUP = NULL,ID = NULL, IDSUP = NULL, POIDS){
  if(!is.data.frame(DATAACT)){
    stop("Veuillez sélectionner une data.frame contenant les données pour l'argument DATAACT")
  } else {
    #Vérification que l'ensemble des variables actives sont bien quantitatives
    if(!all(apply(DATAACT,1,is.numeric))){
      stop("Il existe des variables non quantitatives parmi les variables actives : cela peut être dû à un problème de lecture de la table.
           Si ce n'est pas le cas, il vous est conseillé de vous orienter vers d'autres méthodes comme l'ACM ou l'AFDM.")
    }

    if(!is.null(ID)){
      if(!(ID %in% colnames(DATAACT))){
        warning("Le nom de variable ID ne correspond pas à une colonne de la matrice DATAACT.
                Les individus seront identifiés à l'aide de leurs numéros de ligne.")
      } else {
        rownames(DATAACT) <- DATAACT[,ID]
        DATAACT <- DATAACT[,colnames(DATAACT) != ID]
      }
    }
  }
}
