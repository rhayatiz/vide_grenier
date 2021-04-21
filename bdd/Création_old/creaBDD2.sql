/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/06/2020 14:52:22                      */
/*==============================================================*/


drop table if exists RESERVATION;

drop table if exists UTILISATEUR;

drop table if exists VIDEGRENIER;

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION
(
   ID_VG                int not null,
   ID_UTIL              int not null,
   NOM_RESA             varchar(50) not null,
   PRENOM_RESA          varchar(50) not null,
   MAIL_RESA            varchar(50) not null,
   ADDRESSE_RESA        varchar(100) not null,
   CODE_POSTAL_RESA     varchar(4) not null,
   VILLE_RESA           varchar(50) not null,
   PORTABLE_RESA        varchar(15),
   CNI_RESA             varchar(12) not null,
   DELIVRE_CNI_RESA     date not null,
   PAR_CNI_RESA         varchar(50) not null,
   IMMATRICULATION_RESA varchar(10) not null,
   NBR_RESA             int not null,
   INFO_RESA            varchar(150),
   primary key (ID_VG, ID_UTIL)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   ID_UTIL              int not null auto_increment,
   MAIL_UTIL            varchar(50),
   MDP_UTIL             varchar(30),
   NOM_UTIL             varchar(50),
   PRENOM_UTIL          varchar(50),
   TEL_UTIL             varchar(15),
   DESC_UTIL            varchar(280),
   ADMIN_UTIL           bool,
   primary key (ID_UTIL)
);

/*==============================================================*/
/* Table : VIDEGRENIER                                          */
/*==============================================================*/
create table VIDEGRENIER
(
   ID_VG                int not null auto_increment,
   LABEL_VG             varchar(50),
   DATE_VG              date,
   NBR_EMPLACEMENTS     int,
   PRIX_EMPLACEMENTS    decimal,
   primary key (ID_VG)
);

alter table RESERVATION add constraint FK_RELATION_1 foreign key (ID_VG)
      references VIDEGRENIER (ID_VG) on delete restrict on update restrict;

alter table RESERVATION add constraint FK_RELATION_2 foreign key (ID_UTIL)
      references UTILISATEUR (ID_UTIL) on delete restrict on update restrict;

