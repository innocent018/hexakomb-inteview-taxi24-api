# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table driver (
  id                            bigint auto_increment not null,
  names                         varchar(255) not null,
  gender                        varchar(6) not null,
  date_of_birth                 date,
  status                        varchar(8) not null,
  availability                  varchar(13) not null,
  location_id                   bigint,
  constraint ck_driver_gender check ( GENDER in ('MALE','FEMALE')),
  constraint ck_driver_status check ( STATUS in ('ACTIVE','INACTIVE')),
  constraint ck_driver_availability check ( AVAILABILITY in ('AVAILABLE','NOT_AVAILABLE')),
  constraint pk_driver primary key (id)
);

create table location (
  id                            bigint auto_increment not null,
  name                          varchar(255) not null,
  constraint pk_location primary key (id)
);

create table location_distance (
  id                            bigint auto_increment not null,
  location_a_id                 bigint,
  location_b_id                 bigint,
  distance                      double,
  constraint pk_location_distance primary key (id)
);

create table rider (
  id                            bigint auto_increment not null,
  names                         varchar(255) not null,
  gender                        varchar(6) not null,
  date_of_birth                 date,
  location_id                   bigint,
  constraint ck_rider_gender check ( GENDER in ('MALE','FEMALE')),
  constraint pk_rider primary key (id)
);

create table trip (
  id                            bigint auto_increment not null,
  trip_date                     date,
  location_id                   bigint,
  driver_id                     bigint,
  rider_id                      bigint,
  status                        varchar(9) not null,
  constraint ck_trip_status check ( status in ('REQUESTED','CANCELED','REJECTED','ACTIVE','COMPLETED')),
  constraint pk_trip primary key (id)
);

alter table driver add constraint fk_driver_location_id foreign key (location_id) references location (id) on delete restrict on update restrict;
create index ix_driver_location_id on driver (location_id);

alter table location_distance add constraint fk_location_distance_location_a_id foreign key (location_a_id) references location (id) on delete restrict on update restrict;
create index ix_location_distance_location_a_id on location_distance (location_a_id);

alter table location_distance add constraint fk_location_distance_location_b_id foreign key (location_b_id) references location (id) on delete restrict on update restrict;
create index ix_location_distance_location_b_id on location_distance (location_b_id);

alter table rider add constraint fk_rider_location_id foreign key (location_id) references location (id) on delete restrict on update restrict;
create index ix_rider_location_id on rider (location_id);

alter table trip add constraint fk_trip_location_id foreign key (location_id) references location (id) on delete restrict on update restrict;
create index ix_trip_location_id on trip (location_id);

alter table trip add constraint fk_trip_driver_id foreign key (driver_id) references driver (id) on delete restrict on update restrict;
create index ix_trip_driver_id on trip (driver_id);

alter table trip add constraint fk_trip_rider_id foreign key (rider_id) references rider (id) on delete restrict on update restrict;
create index ix_trip_rider_id on trip (rider_id);


# --- !Downs

alter table driver drop foreign key fk_driver_location_id;
drop index ix_driver_location_id on driver;

alter table location_distance drop foreign key fk_location_distance_location_a_id;
drop index ix_location_distance_location_a_id on location_distance;

alter table location_distance drop foreign key fk_location_distance_location_b_id;
drop index ix_location_distance_location_b_id on location_distance;

alter table rider drop foreign key fk_rider_location_id;
drop index ix_rider_location_id on rider;

alter table trip drop foreign key fk_trip_location_id;
drop index ix_trip_location_id on trip;

alter table trip drop foreign key fk_trip_driver_id;
drop index ix_trip_driver_id on trip;

alter table trip drop foreign key fk_trip_rider_id;
drop index ix_trip_rider_id on trip;

drop table if exists driver;

drop table if exists location;

drop table if exists location_distance;

drop table if exists rider;

drop table if exists trip;

