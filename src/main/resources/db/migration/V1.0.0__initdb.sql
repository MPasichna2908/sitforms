create table category (id int8 generated by default as identity, forms_count int4 not null, name varchar(255), primary key (id));
create table category_form (category_id int8 not null, form_id int8 not null);
create table form_entity (id int8 generated by default as identity, category varchar(255), description varchar(255), form_name varchar(255), form_type varchar(255), instant_statistics boolean not null, views_count int4 not null, user_id int8 not null, primary key (id));
create table group_entity (id int8 generated by default as identity, name varchar(255), author_id int8, primary key (id));
create table notification (id int8 generated by default as identity, text varchar(255), user_id int8 not null, primary key (id));
create table question_answer (id int8 generated by default as identity, name varchar(255), question_type varchar(255), submit_form_id int8 not null, primary key (id));
create table question_entity (id int8 generated by default as identity, name varchar(255), question_type varchar(255), total_click_numbers int4 not null, form_id int8 not null, primary key (id));
create table role_entity (id int8 generated by default as identity, name varchar(255), primary key (id));
create table submit_form (id int8 generated by default as identity, form_id int8 not null, sender_id int8 not null, primary key (id));
create table subscription (id int8 generated by default as identity, assigning_people_limit_count int4 not null, creation_date date, due_date date, form_creation_count int4 not null, group_creation_count int4 not null, subscription_type varchar(255), user_entity_id int8, primary key (id));
create table user_assigned_groups (user_id int8 not null, group_id int8 not null);
create table user_entity (id int8 generated by default as identity, email varchar(255), name varchar(255), password varchar(255), surname varchar(255), username varchar(255), role_id int8, primary key (id));
create table user_forms_filled (id int8 generated by default as identity, filled boolean, form_id int8, user_id int8, primary key (id));
create table variant_answer (id int8 generated by default as identity, answered_variant boolean not null, name varchar(255), question_answer_id int8 not null, primary key (id));
create table variant_entity (id int8 generated by default as identity, click_numbers int4 not null, name varchar(255), question_id int8 not null, primary key (id));
alter table if exists category_form add constraint FKdamncp4j8i40dhk5hgv61vv58 foreign key (form_id) references form_entity;
alter table if exists category_form add constraint FKn6x48smlonduogrcqa6svj8m4 foreign key (category_id) references category;
alter table if exists form_entity add constraint FKnsapl1sv9y5h9pbquha8nfk68 foreign key (user_id) references user_entity;
alter table if exists group_entity add constraint FKm21743qssf91ply57p86q6ftf foreign key (author_id) references user_entity;
alter table if exists notification add constraint FK68jwxarc9dmvebcxrkugb5b5b foreign key (user_id) references user_entity;
alter table if exists question_answer add constraint FK43hwkgc0c1jt0g3nvf8e3qj8x foreign key (submit_form_id) references submit_form;
alter table if exists question_entity add constraint FKor0kx4gtcr6fd65l50b6akqam foreign key (form_id) references form_entity;
alter table if exists submit_form add constraint FKc4m8x0jw4pi4y4n9ybk6dl8r7 foreign key (form_id) references form_entity;
alter table if exists submit_form add constraint FKjg8q0senyeutv8f1nvxsqhika foreign key (sender_id) references user_entity;
alter table if exists subscription add constraint FK4bqecg7wmwyivy31bdgfhirp5 foreign key (user_entity_id) references user_entity;
alter table if exists user_assigned_groups add constraint FKbbk0mdkd4qx2ir128t0wcwc9l foreign key (group_id) references group_entity;
alter table if exists user_assigned_groups add constraint FKmus2xexmmutbl8hbu38ebjcks foreign key (user_id) references user_entity;
alter table if exists user_entity add constraint FKc50fb2m5pqs8711tbas2jljlu foreign key (role_id) references role_entity;
alter table if exists user_forms_filled add constraint FK2j5c3wjm27gdxxo6mo89qtfa5 foreign key (form_id) references form_entity;
alter table if exists user_forms_filled add constraint FKs5s2fx0iiq2mt6tvlqu2kr0mq foreign key (user_id) references user_entity;
alter table if exists variant_answer add constraint FK6o1n8qdwr0n4ubekqabbn4uyi foreign key (question_answer_id) references question_answer;
alter table if exists variant_entity add constraint FKmhutu4adk0viaqv2t44wre6ub foreign key (question_id) references question_entity;