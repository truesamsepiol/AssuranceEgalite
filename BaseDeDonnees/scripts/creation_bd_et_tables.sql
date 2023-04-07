/*Debut de modifiaction du fichier
  Vendredi 30 decembre 2022
  Auteur: samsepiol
  se connecter a mysql : mysql -u nomutilisateur -p
  lancer le script : source chemin/vers/script.sql */



/*creation de la base de donnee*/
create database if not exists assurance_egalite;

/*connexion a la base de donnee nouvellement cree*/
use assurance_egalite;

/*creation de la table Membre*/
create table if not exists Membres
(id_membre integer auto_increment ,
Nom char(100) not null,
Prenom char(100),
Sexe char(1),
Telephone char(10),
Quartier char(100),
Ville char(100),
Date_inscription date default '1970-01-01',
primary key(id_membre));

/*creation de la table Emprunt*/
create table if not exists Emprunt
(id_emprunt integer auto_increment ,
Membre integer,
Date_emprunt date not null default '1970-01-01',
Date_retour date not null,
Taux float not null,
Etat boolean default false,
primary key(id_emprunt),
foreign key(Membre) references Membres(id_membre));

/*craetion de la table Versement*/
create table if not exists Versement
(id_versement integer auto_increment ,
Membre integer,
Assurance float default 0,
Secours float default 0,
Mariage float default 0,
Epargne float default 0,
Ration float default 0,
Pagne float default 0,
Date_versement date default '1970-01-01', 
primary key(id_versement),
foreign key(Membre) references Membres(id_membre));
