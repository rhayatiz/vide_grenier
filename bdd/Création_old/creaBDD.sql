/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  22/06/2020 11:29:28                      */
/*==============================================================*/


drop table if exists MAILING_LIST;

drop table if exists RESERVATION;

drop table if exists UTILISATEUR;

drop table if exists VIDEGRENIER;

/*==============================================================*/
/* Table : MAILING_LIST                                         */
/*==============================================================*/
create table MAILING_LIST
(
   ID_ML                int not null,
   MAIL_ML              varchar(50),
   primary key (ID_ML)
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION
(
   ID_RESA              int not null,
   ID_VG                int,
   ID_UTIL              int,
   NOM_RESA             varchar(50),
   PRENOM_RESA          varchar(50),
   ADDRESSE_RESA        varchar(100),
   MAIL_RESA            varchar(50),
   PORTABLE_RESA        varchar(15),
   NEE_RESA             date,
   DEPARTEMENT_RESA     varchar(4),
   VILLE_RESA           varchar(50),
   CNI_RESA             varchar(12),
   DELIVRE_CNI_RESA     date,
   PAR_CNI_RESA         varchar(50),
   IMMATRICULATION_RESA varchar(10),
   NBR_RESA             int,
   INFO_RESA            varchar(150),
   primary key (ID_RESA)
);

/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table UTILISATEUR
(
   ID_UTIL              int not null,
   MAIL_UTIL            varchar(50),
   MDP_UTIL             varchar(30),
   NOM_UTIL             varchar(50),
   PRENOM_UTIL          varchar(50),
   ADDRESSE_UTIL        varchar(100),
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
   ID_VG                int not null,
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

