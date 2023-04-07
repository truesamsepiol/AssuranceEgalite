/*Debut de modifiaction du fichier
  Vendredi 07 Avril 2023
  Auteur: samsepiol 
  Differente requete possible*/



/*1- Etat des comptes individuel*/
select Date_versement as "Date de versement" , Secours, Mariage, Epargne, Ration, Pagne, Secours+Mariage+Epargne+Ration+Pagne as Total  
from Versement 
where Membre=id_membre and Date_versement <= now();
/* Date_versement <= nom() permet de ne pas afficher les mois qui ne sont pas encore arrivé
   A noter egalement que le back end connait id_membre, c'est lui qui fourni l'id_membre au SGBD */


/*2- Bilan Global */
select M.Nom, M.Prenom, T.Secours, T.Mariage, T.Epargne, T.Ration, T.Pagne , T.Secours + T.Mariage + T.Epargne + T.Ration + T.Pagne as Total 
	from Membres M inner join 
	(select Membre, sum(Secours) as Secours, sum(Mariage) as Mariage, sum(Epargne) as Epargne, sum(Ration) as Ration, sum(Pagne) as Pagne 
		from Versement group by Membre) T  
	where M.id_membre=T.Membre order by M.Nom;
