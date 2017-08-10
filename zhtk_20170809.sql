-- CREATE DATABASE IF NOT EXISTS zhtk CHARACTER SET utf8 COLLATE utf8_bin;
-- USE zhtk;

drop table if exists t_log_user_action;

drop table if exists t_log_recommend_paper;
drop table if exists t_log_recommend_qst;

drop table if exists t_log_test_assign_detail_qst;
drop table if exists t_log_test_assign_detail_user;
drop table if exists t_log_test_assign;
drop table if exists t_log_test_result;
drop table if exists t_log_sync_school_data;

drop table if exists t_tmp_phonevc;

drop table if exists t_res_qst_mathml_img;
drop table if exists t_res_qst_image;
drop table if exists t_res_qst_error;
drop table if exists t_res_original_attr;
drop table if exists t_user_qst_collect;

drop table if exists t_res_paper_custom;
drop table if exists t_res_paper;
drop table if exists t_res_question;

drop table if exists t_res_paper_attr;
drop table if exists t_res_paper_rel_teach;
drop table if exists t_res_qst_rel_key;
drop table if exists t_res_qst_rel_teach;

drop table if exists t_sys_user_student;
drop table if exists t_sys_user_teacher_rel;
drop table if exists t_sys_user;

drop table if exists t_org_school_class;
drop table if exists t_org_school;
drop table if exists t_org_region;

drop table if exists t_cde_grade;
drop table if exists t_cde_res_original_attr_type;
drop table if exists t_cde_subject;
drop table if exists t_cde_user_action;




/*==============================================================*/
/* Table: t_cde_grade                                           */
/*==============================================================*/
create table t_cde_grade
(
   grade_id             smallint not null comment '年级ID',
   grade_name           varchar(20) not null comment '年级名称',
   grade_level          smallint comment '学段 (0:初中; 1:高中; 2:小学;)',
   base_nj_code         smallint default NULL,
   primary key (grade_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_cde_grade comment '年级编码表';

/*==============================================================*/
/* Table: t_cde_res_original_attr_type                          */
/*==============================================================*/
create table t_cde_res_original_attr_type
(
   attr_type_id         int not null comment '类型编码ID',
   attr_type_name       varchar(255) not null comment '类型编码名称',
   order_num            int comment '排序号',
   primary key (attr_type_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_cde_res_original_attr_type comment '资源原始属性分类编码表';

/*==============================================================*/
/* Table: t_cde_subject                                         */
/*==============================================================*/
create table t_cde_subject
(
   subject_id           int not null comment '学科ID',
   subject_name         varchar(20) not null comment '学科名称 (如:初中英语)',
   subject_short_name   varchar(20) comment '学科短名称 (如:英语)',
   grade_level          smallint comment '学段 (0:初中; 1:高中; 2:小学;)',
   primary key (subject_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_cde_subject comment '学科编码表';

/*==============================================================*/
/* Table: t_cde_user_action                                     */
/*==============================================================*/
create table t_cde_user_action
(
   action_id            int not null comment '操作ID',
   action_name          varchar(100) not null comment '操作名称',
   primary key (action_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_cde_user_action comment '用户操作编码表';

/*==============================================================*/
/* Table: t_log_recommend_paper                                 */
/*==============================================================*/
create table t_log_recommend_paper
(
   paper_rcmd_id        int not null auto_increment comment '试卷推荐ID',
   user_id              int not null comment '用户ID',
   paper_id             int comment '试卷ID',
   be_valid             numeric(1,0) not null default 1 comment '是否有效 (0:已失效; 1:有效;)',
   be_handled           numeric(1,0) not null default 0 comment '是否已处理 (0:未处理; 1:已处理;)',
   show_times           numeric(3,0) comment '已显示次数',
   create_time          datetime comment '创建时间',
   lastshow_time        datetime comment '最后显示时间',
   primary key (paper_rcmd_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_recommend_paper comment '试卷推荐表';

/*==============================================================*/
/* Table: t_log_recommend_qst                                   */
/*==============================================================*/
create table t_log_recommend_qst
(
   qst_rcmd_id          int not null auto_increment comment '试题推荐ID',
   user_id              int not null comment '用户ID',
   qst_id               int not null comment '试题ID',
   be_valid             numeric(1,0) not null default 1 comment '是否有效 (0:已失效; 1:有效;)',
   be_handled           numeric(1,0) not null default 0 comment '是否已处理 (0:未处理; 1:已处理;)',
   show_times           numeric(3,0) comment '已显示次数',
   create_time          datetime comment '创建时间',
   lastshow_time        datetime comment '最后显示时间',
   primary key (qst_rcmd_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_recommend_qst comment '推荐试题表';

/*==============================================================*/
/* Table: t_log_sync_school_data                                */
/*==============================================================*/
create table t_log_sync_school_data
(
   log_id               int not null auto_increment comment '日志ID',
   school_id            int not null comment '学校ID',
   sync_time            datetime comment '同步时间 (与云端的数据同步)',
   start_time           datetime comment '开始时间',
   end_time             datetime comment '结束时间',
   sync_status          numeric(1,0) default 0 comment '同步状态 (0:正在进行; 1:成功: 2:失败;)',
   num_new_paper        int comment '新增的试卷数量',
   num_new_qst          int comment '新增的试题数量',
   num_upd_paper        int comment '更新的试卷数量',
   num_upd_qst          int comment '更新的试题数量',
   primary key (log_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_sync_school_data comment '学校数据同步日志表';

/*==============================================================*/
/* Table: t_log_test_assign                                     */
/*==============================================================*/
create table t_log_test_assign
(
   assign_id            int not null auto_increment comment '布置ID',
   user_id              int not null comment '用户ID (布置者的用户ID)',
   paper_type           smallint not null default 1 comment '试卷类型 (1:试卷; 2:自定义试卷;)',
   paper_id             int comment '试卷ID',
   cstm_paper_id        int comment '自定义试卷ID',
   start_time           datetime comment '作业开始时间',
   end_time             datetime comment '作业结束时间',
   assign_status        numeric(1,0) not null default 0 comment '发布状态 (0:未发布; 1:已发布;)',
   paper_score          int comment '试卷满分',
   paper_qst_count      int comment '试题数量',
   num_assigned         int comment '布置人数',
   num_done             int comment '已做人数',
   rate_max             numeric(6,2) comment '最高正确率 (0.00~100.00)',
   rate_min             numeric(6,2) comment '最低正确率 (0.00~100.00)',
   rate_avg             numeric(6,2) comment '平均正确率 (0.00~100.00)',
   score_max            numeric(6,2) comment '最高分',
   score_min            numeric(6,2) comment '最低分',
   score_avg            numeric(6,2) comment '平均分',
   create_time          datetime comment '创建时间',
   statistic_time       datetime comment '最后统计时间',
   primary key (assign_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_test_assign comment '测试(作业)布置记录表';

/*==============================================================*/
/* Table: t_log_test_assign_detail_qst                          */
/*==============================================================*/
create table t_log_test_assign_detail_qst
(
   assign_dq_id         int not null auto_increment comment '布置题目详情ID',
   assign_id            int not null comment '布置ID',
   qst_order            int not null comment '试题序号',
   qst_id               int not null comment '试题ID',
   correct_rate         numeric(6,2) comment '正确率',
   create_time          datetime comment '创建时间',
   statistic_time       datetime comment '最后统计时间',
   primary key (assign_dq_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_test_assign_detail_qst comment '测试(作业)布置题目详情表';

/*==============================================================*/
/* Table: t_log_test_assign_detail_user                         */
/*==============================================================*/
create table t_log_test_assign_detail_user
(
   assign_du_id         int not null auto_increment comment '布置学生详情ID',
   assign_id            int not null comment '布置ID',
   user_id              int not null comment '用户ID (布置对象的用户ID)',
   answer_score         int comment '答题得分',
   ranking_num          int comment '排名 (没做的为NULL，排序时放到最后)',
   correct_rate         numeric(6,2) comment '正确率',
   answer_time          int comment '答题用时 (单位:秒)',
   start_time           datetime comment '开考时间',
   end_time             datetime comment '交卷时间',
   right_num            varchar(500) comment '答对题号 (只记客观题，以,分隔)',
   wrong_num            varchar(500) comment '答错题号 (只记客观题，以,分隔)',
   create_time          datetime comment '创建时间',
   statistic_time       datetime comment '最后统计时间',
   primary key (assign_du_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_test_assign_detail_user comment '测试(作业)布置学生详情表';

/*==============================================================*/
/* Table: t_log_test_result                                     */
/*==============================================================*/
create table t_log_test_result
(
   result_id            int not null auto_increment comment '测试结果ID',
   user_id              int not null comment '用户ID',
   assign_id            int comment '布置ID (表T_LOG_TEST_ASSIGN)',
   paper_type           smallint not null default 1 comment '试卷类型 (1:试卷; 2:自定义试卷;)',
   paper_id             int comment '试卷ID (表T_LOG_TEST_ASSIGN)',
   cstm_paper_id        int comment '自定义试卷ID',
   paper_score          int comment '试卷满分',
   paper_qst_count      int comment '试题数量',
   answer_info          text comment '试卷答题信息',
   answer_score         int comment '答题得分',
   correct_rate         numeric(6,2) comment '正确率',
   answer_time          int comment '答题用时 (单位:秒)',
   start_time           datetime comment '开考时间',
   end_time             datetime comment '交卷时间',
   right_num            varchar(3000) comment '答对题号 (只记客观题试题ID，以,分隔)',
   wrong_num            varchar(3000) comment '答错题号 (只记客观题试题ID，以,分隔)',
   create_time          datetime comment '创建时间',
   primary key (result_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_test_result comment '测试结果表';

/*==============================================================*/
/* Table: t_log_user_action                                     */
/*==============================================================*/
create table t_log_user_action
(
   log_id               int not null auto_increment comment '日志ID',
   user_id              int not null comment '用户ID',
   action_id            int not null comment '操作ID',
   detail_info          varchar(200) comment '详细信息',
   create_time          datetime comment '创建时间',
   primary key (log_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_log_user_action comment '用户操作日志表';

/*==============================================================*/
/* Table: t_org_region                                          */
/*==============================================================*/
create table t_org_region
(
   region_code          int not null comment '行政代号',
   name                 varchar(50) not null comment '区划名称',
   parent_code          int not null default 0 comment '上级行政代号（0-顶级区划）',
   region_number        varchar(5) comment '区号',
   level                numeric(1,0) not null comment '行政等级',
   region_type          varchar(4) comment '区域类别（省、市、区）',
   primary key (region_code)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_org_region comment '县区行政区划';

/*==============================================================*/
/* Table: t_org_school                                          */
/*==============================================================*/
create table t_org_school
(
   school_id            int not null comment '学校ID',
   region_code          int not null comment '行政代号',
   school_name          varchar(200) comment '学校名称',
   sync_time            datetime comment '最后成功同步时间 (与云端的数据同步)',
   create_time          datetime comment '创建时间',
   primary key (school_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_org_school comment '学校表';

/*==============================================================*/
/* Table: t_org_school_class                                    */
/*==============================================================*/
create table t_org_school_class
(
   class_id             int not null auto_increment comment '班级ID',
   school_id            int not null comment '学校ID',
   grade_id             smallint not null comment '年级ID',
   class_name           varchar(100) comment '班级名称',
   create_time          datetime comment '创建时间',
   primary key (class_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 100000;

alter table t_org_school_class comment '学校班级表';

/*==============================================================*/
/* Table: t_res_original_attr                                   */
/*==============================================================*/
create table t_res_original_attr
(
   attr_id              int not null comment '属性ID',
   attr_type_id         int comment '类型编码ID',
   parent_id            int not null default 0 comment '上级ID',
   child_count          smallint not null default 0 comment '子级属性个数',
   attr_name            varchar(255) comment '属性名称',
   attr_level           smallint not null default 2 comment '属性级别 (1开始)',
   attr_cascade_id      varchar(100) comment '属性级联ID',
   attr_cascade_name    varchar(1024) comment '属性级联名称',
   order_num            int comment '排序号',
   del_status           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   modify_time          datetime comment '最后修改时间',
   primary key (attr_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_original_attr comment '资源原始属性表';

/*==============================================================*/
/* Table: t_res_paper                                           */
/*==============================================================*/
create table t_res_paper
(
   paper_id             int not null comment '试卷ID',
   paper_name           varchar(255) comment '试卷名称',
   paper_score          int comment '试卷满分',
   paper_answertime     int comment '考试时长 (单位:分钟)',
   paper_price          numeric(8,2) comment '试卷价格',
   paper_year           varchar(30) comment '试卷年份',
   paper_quality        numeric(1,0) not null default 0 comment '试卷推荐等级 (0:默认等级; 1-5:推荐等级)',
   paper_qst_count      int comment '试题数量',
   count_used           int default 0 comment '使用次数',
   attr_subject_id      int comment '属性-学科ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   attr_grade_id        int comment '属性-年级ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   attr_edition_id      int comment '属性-教材版本ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   attr_province_id     int comment '属性-省份ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   attr_paperkind_id    int comment '属性-试卷种类ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   attr_source_id       int comment '属性-试卷来源ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   paper_id_fz          int not null default 0 comment '原试卷ID (方正)',
   paper_content        longtext comment '试卷内容',
   fz_doc_id            int comment 'FZ_DOC_ID (试题与试卷关联)',
   fz_paper_score       numeric(8,2) comment 'FZ_PAPER_SCORE',
   fz_paper_answertime  int comment 'FZ_PAPER_ANSWERTIME',
   fz_paper_scopeid     int comment 'FZ_PAPER_SCOPEID',
   fz_paper_scope       varchar(100) comment 'FZ_PAPER_SCOPE',
   fz_paper_subjectid   int comment 'FZ_PAPER_SUBJECTID',
   fz_paper_subject     varchar(100) comment 'FZ_PAPER_SUBJECT',
   fz_paper_type        int comment 'FZ_PAPER_TYPE',
   fz_qst_count         int comment 'FZ_QST_COUNT',
   fz_doc_productlibid  int comment 'FZ_DOC_PRODUCTLIBID',
   fz_doc_productid     int comment 'FZ_DOC_PRODUCTID',
   fz_doc_product       varchar(255) comment 'FZ_DOC_PRODUCT',
   fz_paper_source      varchar(200) comment 'FZ_PAPER_SOURCE',
   fz_paper_area        varchar(50) comment 'FZ_PAPER_AREA',
   fz_paper_areaid      int comment 'FZ_PAPER_AREAID',
   fz_paper_kind        varchar(50) comment 'FZ_PAPER_KIND',
   fz_paper_kindid      int comment 'FZ_PAPER_KINDID',
   fz_paper_grade       varchar(50) comment 'FZ_PAPER_GRADE',
   fz_paper_gradeid     int comment 'FZ_PAPER_GRADEID',
   fz_paper_year        varchar(50) comment 'FZ_PAPER_YEAR',
   fz_paper_yearid      int comment 'FZ_PAPER_YEARID',
   del_status           numeric(1,0) default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   create_time          datetime comment '创建时间',
   modify_time          datetime comment '最后修改时间',
   release_time         datetime comment '发布时间 (初始与最后修改时间相同)',
   primary key (paper_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_paper comment '试卷';

/*==============================================================*/
/* Index: FZ_DOC_ID                                             */
/*==============================================================*/
create unique index FZ_DOC_ID on t_res_paper
(
   fz_doc_id
);

/*==============================================================*/
/* Index: MODIFY_TIME                                             */
/*==============================================================*/
create index MODIFY_TIME on t_res_paper
(
   modify_time
);

/*==============================================================*/
/* Table: t_res_paper_attr                                      */
/*==============================================================*/
create table t_res_paper_attr
(
   attr_id              int not null comment '属性ID',
   parent_id            int not null comment '上级ID',
   attr_level           smallint not null comment '属性级别 (1开始)',
   attr_name            varchar(50) comment '属性名称',
   attr_type_tab        varchar(50) comment '属性类别标签',
   grade_level          smallint comment '学段 (0:初中; 1:高中; 2:小学;)',
   primary key (attr_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_paper_attr comment '试卷属性表';

/*==============================================================*/
/* Table: t_res_paper_custom                                    */
/*==============================================================*/
create table t_res_paper_custom
(
   cstm_paper_id        int not null auto_increment comment '自定义试卷ID',
   paper_name           varchar(255) not null comment '试卷名称',
   user_id              int not null comment '用户ID (组卷用户ID)',
   paper_content_array  text comment '题卷内容数组',
   attr_subject_id      int comment '属性-学科ID',
   attr_grade_id        int comment '属性-年级ID',
   attr_edition_id      int comment '属性-教材版本ID',
   create_time          datetime not null comment '创建时间',
   primary key (cstm_paper_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_res_paper_custom comment '自定义试卷';

/*==============================================================*/
/* Table: t_res_paper_rel_teach                                 */
/*==============================================================*/
create table t_res_paper_rel_teach
(
   paper_id             int not null comment '试卷ID (表T_RES_PAPER)',
   paper_teach_id       int comment '试卷教材目录ID',
   paper_key_id         int comment '试卷知识点ID',
   class_1              int comment '级联1',
   class_2              int comment '级联2',
   class_3              int comment '级联3',
   class_4              int comment '级联4',
   class_5              int comment '级联5',
   class_6              int comment '级联6',
   class_7              int comment '级联7',
   class_8              int comment '级联8',
   class_9              int comment '级联9',
   class_10             int comment '级联10',
   paper_teach_cascadeid varchar(200) comment '试卷教材目录级联ID',
   paper_key_cascadeid  varchar(400) comment '试卷知识点级联ID',
   create_time          datetime comment '创建时间',
   modify_time          datetime comment '最后修改时间',
   primary key (paper_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_paper_rel_teach comment '试卷教材体系关系表';

/*==============================================================*/
/* Table: t_res_qst_error                                       */
/*==============================================================*/
create table t_res_qst_error
(
   qst_error_id         int not null auto_increment comment '试题纠错ID',
   user_id              int not null comment '用户ID (参照T_SYS_USER.USER_ID)',
   qst_id               int not null comment '试题ID',
   error_type           varchar(50) not null default '0' comment '错误类型 (json格式:{t1:1;t2:0,t3:1,t4:1}) (t1:排版有误; t2:试题有误; t3:答案有误; t4:解析有误;)',
   error_status         numeric(1,0) not null default 0 comment '错误状态 (0:未处理; 1:有效的纠错; 2:无效的纠错;)',
   error_info           varchar(500) not null comment '纠错信息',
   replay_info          varchar(500) comment '回复信息',
   add_time             datetime not null comment '添加时间',
   replay_time          datetime comment '回复时间',
   primary key (qst_error_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_res_qst_error comment '试题纠错表';

/*==============================================================*/
/* Table: t_res_qst_image                                       */
/*==============================================================*/
create table t_res_qst_image
(
   image_id             int not null comment '试题图ID',
   qst_id               int not null comment '试题ID',
   img_large_path       varchar(500) comment '大尺寸图片路径',
   img_height           int comment '图片高度',
   img_width            int comment '图片宽度',
   img_format           varchar(6) comment '图片格式',
   create_time          datetime not null comment '创建时间',
   primary key (image_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_qst_image comment '试题图片表';

/*==============================================================*/
/* Table: t_res_qst_mathml_img                                  */
/*==============================================================*/
create table t_res_qst_mathml_img
(
   mmlimg_uuid          varchar(50) not null comment '公式图UUID',
   qst_id               int not null comment '试题ID',
   file_path            varchar(255) comment '文件路径',
   create_time          datetime not null comment '创建时间',
   primary key (mmlimg_uuid)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_qst_mathml_img comment '试题公式图片表';

/*==============================================================*/
/* Table: t_res_qst_rel_key                                     */
/*==============================================================*/
create table t_res_qst_rel_key
(
   qst_id               int not null comment '试题ID',
   qst_subject          varchar(100) comment '试题学科',
   qst_subjectid        int comment '试题学科ID',
   qst_teachid          int comment '试题教材目录ID',
   qst_keyid            varchar(100) comment '试题知识点ID',
   qst_dificultyid      int comment '试题难度ID',
   qst_typeid           int comment '试题类型ID',
   qst_levelid          int comment '试题等级ID',
   qst_qualityid        int comment '试题质量等级ID',
   class_1              int not null comment '级联1',
   class_2              int not null comment '级联2',
   class_3              int not null comment '级联3',
   class_4              int not null comment '级联4',
   class_5              int not null comment '级联5',
   class_6              int not null comment '级联6',
   class_7              int not null comment '级联7',
   class_8              int not null comment '级联8',
   class_9              int not null comment '级联9',
   class_10             int not null comment '级联10',
   qst_teach_cascadeid  varchar(200) comment '试题教材目录级联ID',
   qst_key_cascadeid    varchar(400) comment '试题知识点级联ID',
   qst_yaer             varchar(30) comment '试题年份',
   grade                varchar(100) comment '年级名',
   gradeid              int comment '年级ID',
   qst_model            varchar(100) comment '模块名',
   qst_modelid          int comment '模块ID',
   qst_unit             varchar(100) comment '单元名',
   qst_unitid           int comment '单元ID',
   del_status           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   create_time          datetime comment '创建时间',
   modify_time          datetime comment '最后修改时间',
   primary key (qst_id, class_1, class_2, class_3, class_4, class_5, class_6, class_7, class_8, class_9, class_10)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_qst_rel_key comment '试题知识点关系表';

/*==============================================================*/
/* Index: QST_ID                                                */
/*==============================================================*/
create index QST_ID on t_res_qst_rel_key
(
   qst_id
);

/*==============================================================*/
/* Index: MODIFY_TIME                                             */
/*==============================================================*/
create index MODIFY_TIME on t_res_qst_rel_key
(
   modify_time
);

/*==============================================================*/
/* Table: t_res_qst_rel_teach                                   */
/*==============================================================*/
create table t_res_qst_rel_teach
(
   qst_id               int not null comment '试题ID',
   qst_subject          varchar(100) comment '试题学科',
   qst_subjectid        int comment '试题学科ID',
   qst_teachid          int comment '试题教材目录ID',
   qst_keyid            varchar(100) comment '试题知识点ID',
   qst_dificultyid      int comment '试题难度ID',
   qst_typeid           int comment '试题类型ID',
   qst_levelid          int comment '试题等级ID',
   qst_qualityid        int comment '试题质量等级ID',
   class_1              int not null comment '级联1',
   class_2              int not null comment '级联2',
   class_3              int not null comment '级联3',
   class_4              int not null comment '级联4',
   class_5              int not null comment '级联5',
   class_6              int not null comment '级联6',
   class_7              int not null comment '级联7',
   class_8              int not null comment '级联8',
   class_9              int not null comment '级联9',
   class_10             int not null comment '级联10',
   qst_teach_cascadeid  varchar(200) comment '试题教材目录级联ID',
   qst_key_cascadeid    varchar(400) comment '试题知识点级联ID',
   grade                varchar(100) comment '年级名',
   gradeid              int comment '年级ID',
   del_status           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   create_time          datetime comment '创建时间',
   modify_time          datetime comment '最后修改时间',
   primary key (qst_id, class_1, class_2, class_3, class_4, class_5, class_6, class_7, class_8, class_9, class_10)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_qst_rel_teach comment '试题教材体系关系表';

/*==============================================================*/
/* Index: REL_TEACH_IDS                                         */
/*==============================================================*/
create index REL_TEACH_IDS on t_res_qst_rel_teach
(
   qst_id,
   qst_typeid,
   qst_dificultyid,
   class_1
);

/*==============================================================*/
/* Index: QST_ID                                                */
/*==============================================================*/
create index QST_ID on t_res_qst_rel_teach
(
   qst_id
);

/*==============================================================*/
/* Index: MODIFY_TIME                                             */
/*==============================================================*/
create index MODIFY_TIME on t_res_qst_rel_teach
(
   modify_time
);

/*==============================================================*/
/* Table: t_res_question                                        */
/*==============================================================*/
create table t_res_question
(
   qst_id               int not null comment '试题ID',
   qst_content          longtext comment '试题内容',
   qst_text             longtext comment '试题文本内容',
   qst_title            text comment '试题题目部分',
   qst_result           text comment '试题答案部分',
   qst_analysis         text comment '试题解析部分',
   qst_qualityid        int comment '试题质量等级ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   qst_dificultyid      int comment '试题难度ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   qst_typeid           int comment '试题题型ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   qst_yaer             varchar(30) comment '试题年份',
   qst_subject_id       int comment '试题学科ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   qst_teach_id         int comment '试题教材目录ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   qst_teach_cascadeid  varchar(200) comment '试题教材目录级联ID',
   qst_keyid            varchar(100) comment '试题知识点ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   qst_key_cascadeid    varchar(400) comment '试题知识点级联ID',
   count_used           int default 0 comment '使用次数',
   fz_doc_id            int comment 'FZ_DOC_ID (试题与试卷关联)',
   del_status           numeric(1,0) default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   create_time          datetime comment '创建时间',
   modify_time          datetime comment '最后修改时间',
   release_time         datetime comment '发布时间 (初始与最后修改时间相同)',
   primary key (qst_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_res_question comment '试题';

/*==============================================================*/
/* Index: QST_YEAR                                              */
/*==============================================================*/
create index QST_YEAR on t_res_question
(
   qst_yaer
);

/*==============================================================*/
/* Index: FZ_DOC_ID                                             */
/*==============================================================*/
create index FZ_DOC_ID on t_res_question
(
   fz_doc_id
);

/*==============================================================*/
/* Index: MODIFY_TIME                                             */
/*==============================================================*/
create index MODIFY_TIME on t_res_question
(
   modify_time
);

/*==============================================================*/
/* Table: t_sys_user                                            */
/*==============================================================*/
create table t_sys_user
(
   user_id              int not null auto_increment comment '用户ID (自增长，起始值100000)',
   user_account         varchar(50) not null comment '用户帐号',
   user_password        varchar(40) not null comment '密码 (40位的加密密钥)',
   user_type            numeric(1,0) not null default 0 comment '用户类型 (0-系统; 1-教师; 2-学生;)',
   user_status          numeric(1,0) not null default 1 comment '用户状态 (0-未激活; 1-激活; 2-失效;)',
   school_id            int not null default 0 comment '学校ID (0:非学校用户;)',
   nickname             varchar(40) comment '昵称',
   truename             varchar(40) comment '姓名',
   gender               numeric(1,0) comment '性别 (1:男; 2:女)',
   email                varchar(40) comment '邮箱',
   mobile               varchar(20) comment '手机号',
   qq                   varchar(20) comment 'QQ号',
   weixin               varchar(40) comment '微信号',
   img_path             varchar(500) comment '头像图片路径',
   subject_id           int comment '学科ID (参照t_cde_subject.SUBJECT_ID)',
   create_time          datetime comment '创建时间',
   primary key (user_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 100000;

alter table t_sys_user comment '用户表：用户ID（自增长，起始值100000）';

/*==============================================================*/
/* Table: t_sys_user_student                                    */
/*==============================================================*/
create table t_sys_user_student
(
   user_id              int not null comment '用户ID',
   class_id             int comment '班级ID',
   primary key (user_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_sys_user_student comment '学生表';

/*==============================================================*/
/* Table: t_sys_user_teacher_rel                                */
/*==============================================================*/
create table t_sys_user_teacher_rel
(
   trel_id              int not null auto_increment comment '教师关系ID',
   user_id              int not null comment '用户ID',
   class_id             int not null comment '班级ID',
   subject_id           int comment '学科ID',
   primary key (trel_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_sys_user_teacher_rel comment '教师信息表';

/*==============================================================*/
/* Table: t_tmp_phonevc                                         */
/*==============================================================*/
create table t_tmp_phonevc
(
   user_id              int not null comment '用户ID (参照t_sys_user.USER_ID)',
   phonevc              varchar(20) not null comment '手机验证码',
   create_time          datetime not null comment '创建时间',
   primary key (user_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

alter table t_tmp_phonevc comment '手机验证码临时表';

/*==============================================================*/
/* Table: t_user_qst_collect                                    */
/*==============================================================*/
create table t_user_qst_collect
(
   qst_clt_id           int not null auto_increment comment '试题收藏ID',
   user_id              int not null comment '用户ID',
   qst_id               int comment '试题ID',
   qst_subject_id       int comment '试题学科ID',
   qst_source           smallint comment '试题来源 (1-原版试卷; 2-自定义组卷; 3-错题重做;)',
   paper_id             int not null comment '试卷ID',
   clt_type             smallint not null default 0 comment '收藏类型 (0-自动错题; 1-手动收藏;)',
   clt_demo             varchar(200) comment '收藏备注 (填写收藏原因等)',
   answer               varchar(200) comment '作答情况',
   del_status           numeric(1,0) default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   add_time             datetime comment '添加时间',
   primary key (qst_clt_id),
   key AK_QST_SUBJECT_ID (qst_subject_id)
)
ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin
auto_increment = 1;

alter table t_user_qst_collect comment '试题收藏，错题或个性收藏';

alter table t_log_recommend_paper add constraint FK_Relationship_28 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;

alter table t_log_recommend_qst add constraint FK_Relationship_26 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;

alter table t_log_test_assign_detail_qst add constraint FK_Relationship_36 foreign key (assign_id)
      references t_log_test_assign (assign_id) on delete restrict on update restrict;

alter table t_log_test_assign_detail_user add constraint FK_Relationship_35 foreign key (assign_id)
      references t_log_test_assign (assign_id) on delete restrict on update restrict;

alter table t_log_test_result add constraint FK_Relationship_24 foreign key (paper_id)
      references t_res_paper (paper_id) on delete restrict on update restrict;

alter table t_log_test_result add constraint FK_Relationship_25 foreign key (cstm_paper_id)
      references t_res_paper_custom (cstm_paper_id) on delete restrict on update restrict;

alter table t_log_test_result add constraint FK_Relationship_9 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;

alter table t_log_user_action add constraint FK_Relationship_20 foreign key (action_id)
      references t_cde_user_action (action_id) on delete restrict on update restrict;

alter table t_log_user_action add constraint FK_Relationship_21 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;

alter table t_org_school add constraint FK_Relationship_3 foreign key (region_code)
      references t_org_region (region_code) on delete restrict on update restrict;

alter table t_org_school_class add constraint FK_Relationship_12 foreign key (school_id)
      references t_org_school (school_id) on delete restrict on update restrict;

alter table t_org_school_class add constraint FK_Relationship_14 foreign key (grade_id)
      references t_cde_grade (grade_id) on delete restrict on update restrict;

alter table t_res_original_attr add constraint FK_Relationship_30 foreign key (attr_type_id)
      references t_cde_res_original_attr_type (attr_type_id) on delete restrict on update restrict;

alter table t_res_qst_error add constraint FK_Relationship_31 foreign key (qst_id)
      references t_res_question (qst_id) on delete restrict on update restrict;

alter table t_sys_user_student add constraint FK_Relationship_13 foreign key (class_id)
      references t_org_school_class (class_id) on delete restrict on update restrict;

alter table t_sys_user_student add constraint FK_Relationship_8 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;

alter table t_sys_user_teacher_rel add constraint FK_Relationship_32 foreign key (subject_id)
      references t_cde_subject (subject_id) on delete restrict on update restrict;

alter table t_sys_user_teacher_rel add constraint FK_Relationship_33 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;

alter table t_sys_user_teacher_rel add constraint FK_Relationship_34 foreign key (class_id)
      references t_org_school_class (class_id) on delete restrict on update restrict;

alter table t_user_qst_collect add constraint FK_Relationship_11 foreign key (qst_id)
      references t_res_question (qst_id) on delete restrict on update restrict;

alter table t_user_qst_collect add constraint FK_Relationship_6 foreign key (user_id)
      references t_sys_user (user_id) on delete restrict on update restrict;



/*==============================================================*/
/* 子系统：同步系统
/*==============================================================*/
create table syn_operation_log (
     syn_data_type varchar(20) comment '同步数据类型',
     syn_page_number   int comment '同步第几页',
     syn_Success_Count int comment '本页同步成功的条数',
     syn_failure_Count  int comment '本页同步失败的条数',
     syn_Insert_Count   int comment '本页同步新增的条数',
     syn_Update_Count   int comment '本页同步更新的条数',
     syn_Exists_Count   int comment '本页同步时已经存在的条数',
     syn_TotalCount     int comment '本赠同步的总条数',
     syn_date           datetime comment '同步时间',
     target_ip          varchar(256) comment '目标库的ip'
     )
     ENGINE=MyISAM
     DEFAULT CHARACTER SET=utf8 COLLATE=utf8_bin
     comment '同步日志表';

/*==============================================================*/
/* 子系统：推荐系统
/*==============================================================*/
CREATE TABLE `t_cde_grade_rel_extend` (
	`GRADE_ID`  int(11) NOT NULL COMMENT '年级ID' ,
	`GRADE_EXT_ID`  int(11) NOT NULL COMMENT '年级扩展ID' ,
	`GRADE_TYPE`  smallint(1) NOT NULL COMMENT '1：试题年级，2：试卷年级' ,
	primary key (`GRADE_ID`,`GRADE_EXT_ID`),
	INDEX `FK_RELATIONSHIP_PAPER_EXT_INDEX_ATTR_ID` (`GRADE_ID`) USING BTREE ,
	INDEX `FK_RELATIONSHIP_PAPER_EXT_INDEX_ATTR_EXT_ID` (`GRADE_EXT_ID`) USING BTREE 
	)
	ENGINE=MyISAM
	DEFAULT CHARACTER SET=utf8 COLLATE=utf8_bin
	COMMENT='年级关系扩展表'
	ROW_FORMAT=COMPACT
	;




-- =========================================================================
-- t_sys_user  用户表
-- ----------------------------------------
INSERT INTO t_sys_user(USER_ID,USER_ACCOUNT,USER_PASSWORD,USER_TYPE,SCHOOL_ID,NICKNAME,TRUENAME,CREATE_TIME)
  values(1000,'admin','e10adc3949ba59abbe56e057f20f883e',0,0,'智慧超管','智慧题库管理员',sysdate());


-- =========================================================================
-- t_cde_user_action  用户操作编码表
-- ----------------------------------------
INSERT INTO t_cde_user_action(ACTION_ID,ACTION_NAME) values(1001,'登陆系统');
INSERT INTO t_cde_user_action(ACTION_ID,ACTION_NAME) values(1002,'退出系统');


-- =========================================================================
-- t_cde_subject  学科编码表
-- ----------------------------------------
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('27','初中英语','英语','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('28','初中数学','数学','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('33','初中语文','语文','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('34','初中物理','物理','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('35','初中化学','化学','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('36','初中政治','政治','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('37','初中历史','历史','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('79','初中地理','地理','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('80','初中生物','生物','0');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('49','高中数学','数学','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('50','高中物理','物理','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('51','高中化学','化学','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('52','高中英语','英语','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('53','高中语文','语文','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('54','高中历史','历史','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('55','高中政治','政治','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('56','高中生物','生物','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('57','高中地理','地理','1');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('66','小学语文','语文','2');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('67','小学数学','数学','2');
INSERT INTO t_cde_subject(SUBJECT_ID,SUBJECT_NAME,SUBJECT_SHORT_NAME,GRADE_LEVEL) values('68','小学英语','英语','2');


-- =========================================================================
-- t_cde_grade  年级编码表
-- ----------------------------------------
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('101','一年级','2','1');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('102','二年级','2','2');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('103','三年级','2','3');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('104','四年级','2','4');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('105','五年级','2','5');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('106','六年级','2','6');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('201','七年级','0','7');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('202','八年级','0','8');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('203','九年级','0','9');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('301','高一','1','10');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('302','高二','1','11');
INSERT INTO t_cde_grade(GRADE_ID,GRADE_NAME,GRADE_LEVEL,BASE_NJ_CODE) values('303','高三','1','12');


-- =========================================================================
-- t_cde_grade  年级扩展表
-- ----------------------------------------
INSERT INTO `t_cde_grade_rel_extend` VALUES (101, 172, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (101, 174, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (102, 175, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (102, 176, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (103, 177, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (103, 178, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (104, 179, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (104, 180, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (105, 181, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (105, 182, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (106, 183, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (106, 184, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (201, 16, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (201, 17, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (202, 18, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (202, 19, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (203, 20, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (203, 21, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (203, 146, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (301, 188, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (301, 189, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (302, 190, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (302, 191, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (303, 192, 2);
INSERT INTO `t_cde_grade_rel_extend` VALUES (101, 82723, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (101, 90755, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (102, 82724, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (102, 90756, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (103, 82725, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (103, 90757, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (104, 82726, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (104, 90758, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (105, 82727, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (105, 90759, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (106, 82728, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (106, 90760, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (201, 84094, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (201, 90761, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (202, 84095, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (202, 90762, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (203, 84096, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (203, 90763, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (203, 90764, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (301, 88945, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (301, 92675, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (302, 88946, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (302, 92676, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (303, 88947, 1);
INSERT INTO `t_cde_grade_rel_extend` VALUES (303, 88948, 1);


-- =========================================================================
-- t_org_region  县区
-- ----------------------------------------
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110000','北京市','0','010','1','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110101','东城区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110102','西城区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110105','朝阳区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110106','丰台区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110107','石景山区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110108','海淀区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110109','门头沟区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110111','房山区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110112','通州区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110113','顺义区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110114','昌平区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110115','大兴区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110116','怀柔区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110117','平谷区','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110228','密云县','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('110229','延庆县','110000','010','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120000','天津市','0','022','1','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120101','和平区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120102','河东区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120103','河西区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120104','南开区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120105','河北区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120106','红桥区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120110','东丽区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120111','西青区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120112','津南区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120113','北辰区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120114','武清区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120115','宝坻区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120116','滨海新区','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120221','宁河县','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120223','静海县','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('120225','蓟县','120000','022','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130000','河北省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130100','石家庄市','130000','0311','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130102','长安区','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130103','桥东区','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130104','桥西区','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130105','新华区','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130107','井陉矿区','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130108','裕华区','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130121','井陉县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130123','正定县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130124','栾城县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130125','行唐县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130126','灵寿县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130127','高邑县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130128','深泽县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130129','赞皇县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130130','无极县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130131','平山县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130132','元氏县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130133','赵县','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130181','辛集市','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130182','藁城市','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130183','晋州市','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130184','新乐市','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130185','鹿泉市','130100','0311','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130200','唐山市','130000','0315','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130202','路南区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130203','路北区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130204','古冶区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130205','开平区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130207','丰南区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130208','丰润区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130223','滦县','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130224','滦南县','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130225','乐亭县','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130227','迁西县','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130229','玉田县','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130230','曹妃甸区','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130281','遵化市','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130283','迁安市','130200','0315','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130300','秦皇岛市','130000','0335','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130302','海港区','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130303','山海关区','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130304','北戴河区','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130321','青龙满族自治县','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130322','昌黎县','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130323','抚宁县','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130324','卢龙县','130300','0335','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130400','邯郸市','130000','0310','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130402','邯山区','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130403','丛台区','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130404','复兴区','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130406','峰峰矿区','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130421','邯郸县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130423','临漳县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130424','成安县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130425','大名县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130426','涉县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130427','磁县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130428','肥乡县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130429','永年县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130430','邱县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130431','鸡泽县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130432','广平县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130433','馆陶县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130434','魏县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130435','曲周县','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130481','武安市','130400','0310','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130500','邢台市','130000','0319','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130502','桥东区','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130503','桥西区','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130521','邢台县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130522','临城县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130523','内丘县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130524','柏乡县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130525','隆尧县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130526','任县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130527','南和县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130528','宁晋县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130529','巨鹿县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130530','新河县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130531','广宗县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130532','平乡县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130533','威县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130534','清河县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130535','临西县','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130581','南宫市','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130582','沙河市','130500','0319','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130600','保定市','130000','0312','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130602','新市区','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130603','北市区','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130604','南市区','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130621','满城县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130622','清苑县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130623','涞水县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130624','阜平县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130625','徐水县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130626','定兴县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130627','唐县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130628','高阳县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130629','容城县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130630','涞源县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130631','望都县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130632','安新县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130633','易县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130634','曲阳县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130635','蠡县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130636','顺平县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130637','博野县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130638','雄县','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130681','涿州市','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130682','定州市','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130683','安国市','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130684','高碑店市','130600','0312','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130700','张家口市','130000','0313','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130702','桥东区','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130703','桥西区','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130705','宣化区','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130706','下花园区','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130721','宣化县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130722','张北县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130723','康保县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130724','沽源县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130725','尚义县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130726','蔚县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130727','阳原县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130728','怀安县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130729','万全县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130730','怀来县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130731','涿鹿县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130732','赤城县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130733','崇礼县','130700','0313','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130800','承德市','130000','0314','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130802','双桥区','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130803','双滦区','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130804','鹰手营子矿区','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130821','承德县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130822','兴隆县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130823','平泉县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130824','滦平县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130825','隆化县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130826','丰宁满族自治县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130827','宽城满族自治县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130828','围场满族蒙古族自治县','130800','0314','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130900','沧州市','130000','0317','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130902','新华区','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130903','运河区','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130921','沧县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130922','青县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130923','东光县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130924','海兴县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130925','盐山县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130926','肃宁县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130927','南皮县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130928','吴桥县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130929','献县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130930','孟村回族自治县','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130981','泊头市','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130982','任丘市','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130983','黄骅市','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('130984','河间市','130900','0317','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131000','廊坊市','130000','0316','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131002','安次区','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131003','广阳区','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131022','固安县','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131023','永清县','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131024','香河县','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131025','大城县','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131026','文安县','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131028','大厂回族自治县','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131081','霸州市','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131082','三河市','131000','0316','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131100','衡水市','130000','0318','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131102','桃城区','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131121','枣强县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131122','武邑县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131123','武强县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131124','饶阳县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131125','安平县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131126','故城县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131127','景县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131128','阜城县','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131181','冀州市','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('131182','深州市','131100','0318','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140000','山西省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140100','太原市','140000','0351','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140105','小店区','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140106','迎泽区','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140107','杏花岭区','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140108','尖草坪区','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140109','万柏林区','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140110','晋源区','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140121','清徐县','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140122','阳曲县','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140123','娄烦县','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140181','古交市','140100','0351','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140200','大同市','140000','0352','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140202','城区','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140203','矿区','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140211','南郊区','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140212','新荣区','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140221','阳高县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140222','天镇县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140223','广灵县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140224','灵丘县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140225','浑源县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140226','左云县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140227','大同县','140200','0352','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140300','阳泉市','140000','0353','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140302','城区','140300','0353','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140303','矿区','140300','0353','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140311','郊区','140300','0353','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140321','平定县','140300','0353','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140322','盂县','140300','0353','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140400','长治市','140000','0355','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140402','城区','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140411','郊区','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140421','长治县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140423','襄垣县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140424','屯留县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140425','平顺县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140426','黎城县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140427','壶关县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140428','长子县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140429','武乡县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140430','沁县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140431','沁源县','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140481','潞城市','140400','0355','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140500','晋城市','140000','0356','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140502','城区','140500','0356','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140521','沁水县','140500','0356','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140522','阳城县','140500','0356','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140524','陵川县','140500','0356','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140525','泽州县','140500','0356','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140581','高平市','140500','0356','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140600','朔州市','140000','0349','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140602','朔城区','140600','0349','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140603','平鲁区','140600','0349','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140621','山阴县','140600','0349','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140622','应县','140600','0349','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140623','右玉县','140600','0349','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140624','怀仁县','140600','0349','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140700','晋中市','140000','0354','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140702','榆次区','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140721','榆社县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140722','左权县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140723','和顺县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140724','昔阳县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140725','寿阳县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140726','太谷县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140727','祁县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140728','平遥县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140729','灵石县','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140781','介休市','140700','0354','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140800','运城市','140000','0359','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140802','盐湖区','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140821','临猗县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140822','万荣县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140823','闻喜县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140824','稷山县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140825','新绛县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140826','绛县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140827','垣曲县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140828','夏县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140829','平陆县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140830','芮城县','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140881','永济市','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140882','河津市','140800','0359','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140900','忻州市','140000','0350','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140902','忻府区','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140921','定襄县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140922','五台县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140923','代县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140924','繁峙县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140925','宁武县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140926','静乐县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140927','神池县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140928','五寨县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140929','岢岚县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140930','河曲县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140931','保德县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140932','偏关县','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('140981','原平市','140900','0350','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141000','临汾市','140000','0357','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141002','尧都区','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141021','曲沃县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141022','翼城县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141023','襄汾县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141024','洪洞县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141025','古县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141026','安泽县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141027','浮山县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141028','吉县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141029','乡宁县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141030','大宁县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141031','隰县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141032','永和县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141033','蒲县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141034','汾西县','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141081','侯马市','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141082','霍州市','141000','0357','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141100','吕梁市','140000','0358','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141102','离石区','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141121','文水县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141122','交城县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141123','兴县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141124','临县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141125','柳林县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141126','石楼县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141127','岚县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141128','方山县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141129','中阳县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141130','交口县','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141181','孝义市','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('141182','汾阳市','141100','0358','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150000','内蒙古自治区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150100','呼和浩特市','150000','0471','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150102','新城区','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150103','回民区','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150104','玉泉区','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150105','赛罕区','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150121','土默特左旗','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150122','托克托县','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150123','和林格尔县','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150124','清水河县','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150125','武川县','150100','0471','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150200','包头市','150000','0472','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150202','东河区','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150203','昆都仑区','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150204','青山区','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150205','石拐区','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150206','白云鄂博矿区','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150207','九原区','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150221','土默特右旗','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150222','固阳县','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150223','达尔罕茂明安联合旗','150200','0472','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150300','乌海市','150000','0473','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150302','海勃湾区','150300','0473','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150303','海南区','150300','0473','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150304','乌达区','150300','0473','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150400','赤峰市','150000','0476','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150402','红山区','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150403','元宝山区','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150404','松山区','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150421','阿鲁科尔沁旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150422','巴林左旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150423','巴林右旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150424','林西县','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150425','克什克腾旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150426','翁牛特旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150428','喀喇沁旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150429','宁城县','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150430','敖汉旗','150400','0476','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150500','通辽市','150000','0475','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150502','科尔沁区','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150521','科尔沁左翼中旗','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150522','科尔沁左翼后旗','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150523','开鲁县','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150524','库伦旗','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150525','奈曼旗','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150526','扎鲁特旗','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150581','霍林郭勒市','150500','0475','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150600','鄂尔多斯市','150000','0477','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150602','东胜区','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150621','达拉特旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150622','准格尔旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150623','鄂托克前旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150624','鄂托克旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150625','杭锦旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150626','乌审旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150627','伊金霍洛旗','150600','0477','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150700','呼伦贝尔市','150000','0470','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150702','海拉尔区','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150721','阿荣旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150722','莫力达瓦达斡尔族自治旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150723','鄂伦春自治旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150724','鄂温克族自治旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150725','陈巴尔虎旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150726','新巴尔虎左旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150727','新巴尔虎右旗','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150781','满洲里市','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150782','牙克石市','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150783','扎兰屯市','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150784','额尔古纳市','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150785','根河市','150700','0470','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150800','巴彦淖尔市','150000','0478','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150802','临河区','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150821','五原县','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150822','磴口县','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150823','乌拉特前旗','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150824','乌拉特中旗','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150825','乌拉特后旗','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150826','杭锦后旗','150800','0478','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150900','乌兰察布市','150000','0474','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150902','集宁区','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150921','卓资县','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150922','化德县','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150923','商都县','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150924','兴和县','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150925','凉城县','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150926','察哈尔右翼前旗','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150927','察哈尔右翼中旗','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150928','察哈尔右翼后旗','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150929','四子王旗','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('150981','丰镇市','150900','0474','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152200','兴安盟','150000','0482','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152201','乌兰浩特市','152200','0482','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152202','阿尔山市','152200','0482','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152221','科尔沁右翼前旗','152200','0482','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152222','科尔沁右翼中旗','152200','0482','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152223','扎赉特旗','152200','0482','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152224','突泉县','152200','0482','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152500','锡林郭勒盟','150000','0479','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152501','二连浩特市','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152502','锡林浩特市','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152522','阿巴嘎旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152523','苏尼特左旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152524','苏尼特右旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152525','东乌珠穆沁旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152526','西乌珠穆沁旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152527','太仆寺旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152528','镶黄旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152529','正镶白旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152530','正蓝旗','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152531','多伦县','152500','0479','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152900','阿拉善盟','150000','0483','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152921','阿拉善左旗','152900','0483','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152922','阿拉善右旗','152900','0483','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('152923','额济纳旗','152900','0483','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210000','辽宁省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210100','沈阳市','210000','024','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210102','和平区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210103','沈河区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210104','大东区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210105','皇姑区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210106','铁西区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210111','苏家屯区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210112','东陵区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210113','沈北新区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210114','于洪区','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210122','辽中县','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210123','康平县','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210124','法库县','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210181','新民市','210100','024','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210200','大连市','210000','0411','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210202','中山区','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210203','西岗区','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210204','沙河口区','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210211','甘井子区','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210212','旅顺口区','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210213','金州区','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210224','长海县','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210281','瓦房店市','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210282','普兰店市','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210283','庄河市','210200','0411','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210300','鞍山市','210000','0412','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210302','铁东区','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210303','铁西区','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210304','立山区','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210311','千山区','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210321','台安县','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210323','岫岩满族自治县','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210381','海城市','210300','0412','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210400','抚顺市','210000','0413','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210402','新抚区','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210403','东洲区','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210404','望花区','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210411','顺城区','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210421','抚顺县','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210422','新宾满族自治县','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210423','清原满族自治县','210400','0413','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210500','本溪市','210000','0414','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210502','平山区','210500','0414','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210503','溪湖区','210500','0414','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210504','明山区','210500','0414','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210505','南芬区','210500','0414','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210521','本溪满族自治县','210500','0414','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210522','桓仁满族自治县','210500','0414','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210600','丹东市','210000','0415','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210602','元宝区','210600','0415','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210603','振兴区','210600','0415','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210604','振安区','210600','0415','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210624','宽甸满族自治县','210600','0415','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210681','东港市','210600','0415','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210682','凤城市','210600','0415','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210700','锦州市','210000','0416','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210702','古塔区','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210703','凌河区','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210711','太和区','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210726','黑山县','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210727','义县','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210781','凌海市','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210782','北镇市','210700','0416','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210800','营口市','210000','0417','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210802','站前区','210800','0417','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210803','西市区','210800','0417','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210804','鲅鱼圈区','210800','0417','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210811','老边区','210800','0417','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210881','盖州市','210800','0417','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210882','大石桥市','210800','0417','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210900','阜新市','210000','0418','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210902','海州区','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210903','新邱区','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210904','太平区','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210905','清河门区','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210911','细河区','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210921','阜新蒙古族自治县','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('210922','彰武县','210900','0418','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211000','辽阳市','210000','0419','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211002','白塔区','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211003','文圣区','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211004','宏伟区','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211005','弓长岭区','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211011','太子河区','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211021','辽阳县','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211081','灯塔市','211000','0419','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211100','盘锦市','210000','0427','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211102','双台子区','211100','0427','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211103','兴隆台区','211100','0427','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211121','大洼县','211100','0427','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211122','盘山县','211100','0427','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211200','铁岭市','210000','0410','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211202','银州区','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211204','清河区','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211221','铁岭县','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211223','西丰县','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211224','昌图县','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211281','调兵山市','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211282','开原市','211200','0410','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211300','朝阳市','210000','0421','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211302','双塔区','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211303','龙城区','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211321','朝阳县','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211322','建平县','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211324','喀喇沁左翼蒙古族自治县','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211381','北票市','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211382','凌源市','211300','0421','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211400','葫芦岛市','210000','0429','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211402','连山区','211400','0429','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211403','龙港区','211400','0429','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211404','南票区','211400','0429','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211421','绥中县','211400','0429','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211422','建昌县','211400','0429','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('211481','兴城市','211400','0429','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220000','吉林省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220100','长春市','220000','0431','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220102','南关区','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220103','宽城区','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220104','朝阳区','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220105','二道区','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220106','绿园区','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220112','双阳区','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220122','农安县','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220181','九台市','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220182','榆树市','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220183','德惠市','220100','0431','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220200','吉林市','220000','0432','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220202','昌邑区','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220203','龙潭区','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220204','船营区','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220211','丰满区','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220221','永吉县','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220281','蛟河市','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220282','桦甸市','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220283','舒兰市','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220284','磐石市','220200','0432','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220300','四平市','220000','0434','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220302','铁西区','220300','0434','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220303','铁东区','220300','0434','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220322','梨树县','220300','0434','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220323','伊通满族自治县','220300','0434','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220381','公主岭市','220300','0434','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220382','双辽市','220300','0434','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220400','辽源市','220000','0437','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220402','龙山区','220400','0437','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220403','西安区','220400','0437','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220421','东丰县','220400','0437','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220422','东辽县','220400','0437','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220500','通化市','220000','0435','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220502','东昌区','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220503','二道江区','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220521','通化县','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220523','辉南县','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220524','柳河县','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220581','梅河口市','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220582','集安市','220500','0435','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220600','白山市','220000','0439','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220602','浑江区','220600','0439','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220605','江源区','220600','0439','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220621','抚松县','220600','0439','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220622','靖宇县','220600','0439','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220623','长白朝鲜族自治县','220600','0439','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220681','临江市','220600','0439','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220700','松原市','220000','0438','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220702','宁江区','220700','0438','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220721','前郭尔罗斯蒙古族自治县','220700','0438','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220722','长岭县','220700','0438','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220723','乾安县','220700','0438','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220724','扶余县','220700','0438','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220800','白城市','220000','0436','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220802','洮北区','220800','0436','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220821','镇赉县','220800','0436','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220822','通榆县','220800','0436','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220881','洮南市','220800','0436','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('220882','大安市','220800','0436','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222400','延边朝鲜族自治州','220000','0433','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222401','延吉市','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222402','图们市','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222403','敦化市','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222404','珲春市','222400','0440','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222405','龙井市','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222406','和龙市','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222424','汪清县','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('222426','安图县','222400','0433','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230000','黑龙江省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230100','哈尔滨市','230000','0451','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230102','道里区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230103','南岗区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230104','道外区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230108','平房区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230109','松北区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230110','香坊区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230111','呼兰区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230112','阿城区','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230123','依兰县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230124','方正县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230125','宾县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230126','巴彦县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230127','木兰县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230128','通河县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230129','延寿县','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230182','双城市','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230183','尚志市','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230184','五常市','230100','0451','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230200','齐齐哈尔市','230000','0452','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230202','龙沙区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230203','建华区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230204','铁锋区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230205','昂昂溪区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230206','富拉尔基区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230207','碾子山区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230208','梅里斯达斡尔族区','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230221','龙江县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230223','依安县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230224','泰来县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230225','甘南县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230227','富裕县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230229','克山县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230230','克东县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230231','拜泉县','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230281','讷河市','230200','0452','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230300','鸡西市','230000','0467','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230302','鸡冠区','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230303','恒山区','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230304','滴道区','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230305','梨树区','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230306','城子河区','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230307','麻山区','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230321','鸡东县','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230381','虎林市','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230382','密山市','230300','0467','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230400','鹤岗市','230000','0468','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230402','向阳区','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230403','工农区','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230404','南山区','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230405','兴安区','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230406','东山区','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230407','兴山区','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230421','萝北县','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230422','绥滨县','230400','0468','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230500','双鸭山市','230000','0469','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230502','尖山区','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230503','岭东区','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230505','四方台区','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230506','宝山区','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230521','集贤县','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230522','友谊县','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230523','宝清县','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230524','饶河县','230500','0469','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230600','大庆市','230000','0459','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230602','萨尔图区','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230603','龙凤区','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230604','让胡路区','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230605','红岗区','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230606','大同区','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230621','肇州县','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230622','肇源县','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230623','林甸县','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230624','杜尔伯特蒙古族自治县','230600','0459','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230700','伊春市','230000','0458','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230702','伊春区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230703','南岔区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230704','友好区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230705','西林区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230706','翠峦区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230707','新青区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230708','美溪区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230709','金山屯区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230710','五营区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230711','乌马河区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230712','汤旺河区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230713','带岭区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230714','乌伊岭区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230715','红星区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230716','上甘岭区','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230722','嘉荫县','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230781','铁力市','230700','0458','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230800','佳木斯市','230000','0454','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230803','向阳区','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230804','前进区','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230805','东风区','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230811','郊区','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230822','桦南县','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230826','桦川县','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230828','汤原县','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230833','抚远县','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230881','同江市','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230882','富锦市','230800','0454','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230900','七台河市','230000','0464','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230902','新兴区','230900','0464','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230903','桃山区','230900','0464','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230904','茄子河区','230900','0464','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('230921','勃利县','230900','0464','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231000','牡丹江市','230000','0453','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231002','东安区','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231003','阳明区','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231004','爱民区','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231005','西安区','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231024','东宁县','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231025','林口县','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231081','绥芬河市','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231083','海林市','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231084','宁安市','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231085','穆棱市','231000','0453','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231100','黑河市','230000','0456','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231102','爱辉区','231100','0456','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231121','嫩江县','231100','0456','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231123','逊克县','231100','0456','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231124','孙吴县','231100','0456','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231181','北安市','231100','0456','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231182','五大连池市','231100','0456','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231200','绥化市','230000','0455','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231202','北林区','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231221','望奎县','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231222','兰西县','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231223','青冈县','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231224','庆安县','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231225','明水县','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231226','绥棱县','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231281','安达市','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231282','肇东市','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('231283','海伦市','231200','0455','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232700','大兴安岭地区','230000','0457','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232701','加格达奇区','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232702','松岭区','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232703','新林区','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232704','呼中区','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232721','呼玛县','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232722','塔河县','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('232723','漠河县','232700','0457','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310000','上海市','0','021','1','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310101','黄浦区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310104','徐汇区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310105','长宁区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310106','静安区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310107','普陀区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310108','闸北区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310109','虹口区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310110','杨浦区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310112','闵行区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310113','宝山区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310114','嘉定区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310115','浦东新区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310116','金山区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310117','松江区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310118','青浦区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310120','奉贤区','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('310230','崇明县','310000','021','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320000','江苏省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320100','南京市','320000','025','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320102','玄武区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320103','白下区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320104','秦淮区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320105','建邺区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320106','鼓楼区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320107','下关区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320111','浦口区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320113','栖霞区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320114','雨花台区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320115','江宁区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320116','六合区','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320124','溧水县','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320125','高淳县','320100','025','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320200','无锡市','320000','0510','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320202','崇安区','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320203','南长区','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320204','北塘区','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320205','锡山区','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320206','惠山区','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320211','滨湖区','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320281','江阴市','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320282','宜兴市','320200','0510','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320300','徐州市','320000','0516','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320302','鼓楼区','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320303','云龙区','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320305','贾汪区','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320311','泉山区','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320312','铜山区','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320321','丰县','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320322','沛县','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320324','睢宁县','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320381','新沂市','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320382','邳州市','320300','0516','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320400','常州市','320000','0519','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320402','天宁区','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320404','钟楼区','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320405','戚墅堰区','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320411','新北区','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320412','武进区','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320481','溧阳市','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320482','金坛市','320400','0519','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320500','苏州市','320000','0512','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320503','姑苏区','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320505','虎丘区','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320506','吴中区','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320507','相城区','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320581','常熟市','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320582','张家港市','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320583','昆山市','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320584','吴江区','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320585','太仓市','320500','0512','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320600','南通市','320000','0513','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320602','崇川区','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320611','港闸区','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320612','通州区','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320621','海安县','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320623','如东县','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320681','启东市','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320682','如皋市','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320684','海门市','320600','0513','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320700','连云港市','320000','0518','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320703','连云区','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320705','新浦区','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320706','海州区','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320721','赣榆县','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320722','东海县','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320723','灌云县','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320724','灌南县','320700','0518','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320800','淮安市','320000','0517','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320802','清河区','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320803','淮安区','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320804','淮阴区','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320811','青浦区','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320826','涟水县','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320829','洪泽县','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320830','盱眙县','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320831','金湖县','320800','0517','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320900','盐城市','320000','0515','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320902','亭湖区','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320903','盐都区','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320921','响水县','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320922','滨海县','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320923','阜宁县','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320924','射阳县','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320925','建湖县','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320981','东台市','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('320982','大丰市','320900','0515','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321000','扬州市','320000','0514','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321002','广陵区','321000','0514','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321003','邗江区','321000','0514','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321023','宝应县','321000','0514','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321081','仪征市','321000','0514','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321084','高邮市','321000','0514','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321088','江都市','321000','0514','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321100','镇江市','320000','0511','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321102','京口区','321100','0511','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321111','润州区','321100','0511','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321112','丹徒区','321100','0511','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321181','丹阳市','321100','0511','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321182','扬中市','321100','0511','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321183','句容市','321100','0511','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321200','泰州市','320000','0523','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321202','海陵区','321200','0523','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321203','高港区','321200','0523','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321281','兴化市','321200','0523','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321282','靖江市','321200','0523','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321283','泰兴市','321200','0523','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321284','姜堰市','321200','0523','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321300','宿迁市','320000','0527','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321302','宿城区','321300','0527','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321311','宿豫区','321300','0527','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321322','沭阳县','321300','0527','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321323','泗阳县','321300','0527','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('321324','泗洪县','321300','0527','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330000','浙江省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330100','杭州市','330000','0571','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330102','上城区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330103','下城区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330104','江干区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330105','拱墅区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330106','西湖区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330108','滨江区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330109','萧山区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330110','余杭区','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330122','桐庐县','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330127','淳安县','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330182','建德市','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330183','富阳市','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330185','临安市','330100','0571','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330200','宁波市','330000','0574','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330203','海曙区','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330204','江东区','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330205','江北区','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330206','北仑区','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330211','镇海区','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330212','鄞州区','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330225','象山县','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330226','宁海县','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330281','余姚市','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330282','慈溪市','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330283','奉化市','330200','0574','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330300','温州市','330000','0577','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330302','鹿城区','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330303','龙湾区','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330304','瓯海区','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330322','洞头县','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330324','永嘉县','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330326','平阳县','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330327','苍南县','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330328','文成县','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330329','泰顺县','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330381','瑞安市','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330382','乐清市','330300','0577','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330400','嘉兴市','330000','0573','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330402','南湖区','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330411','秀洲区','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330421','嘉善县','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330424','海盐县','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330481','海宁市','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330482','平湖市','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330483','桐乡市','330400','0573','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330500','湖州市','330000','0572','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330502','吴兴区','330500','0572','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330503','南浔区','330500','0572','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330521','德清县','330500','0572','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330522','长兴县','330500','0572','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330523','安吉县','330500','0572','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330600','绍兴市','330000','0575','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330602','越城区','330600','0575','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330621','绍兴县','330600','0575','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330624','新昌县','330600','0575','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330681','诸暨市','330600','0575','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330682','上虞市','330600','0575','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330683','嵊州市','330600','0575','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330700','金华市','330000','0579','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330702','婺城区','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330703','金东区','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330723','武义县','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330726','浦江县','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330727','磐安县','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330781','兰溪市','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330782','义乌市','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330783','东阳市','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330784','永康市','330700','0579','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330800','衢州市','330000','0570','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330802','柯城区','330800','0570','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330803','衢江区','330800','0570','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330822','常山县','330800','0570','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330824','开化县','330800','0570','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330825','龙游县','330800','0570','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330881','江山市','330800','0570','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330900','舟山市','330000','0580','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330902','定海区','330900','0580','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330903','普陀区','330900','0580','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330921','岱山县','330900','0580','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('330922','嵊泗县','330900','0580','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331000','台州市','330000','0576','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331002','椒江区','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331003','黄岩区','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331004','路桥区','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331021','玉环县','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331022','三门县','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331023','天台县','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331024','仙居县','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331081','温岭市','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331082','临海市','331000','0576','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331100','丽水市','330000','0578','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331102','莲都区','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331121','青田县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331122','缙云县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331123','遂昌县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331124','松阳县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331125','云和县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331126','庆元县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331127','景宁畲族自治县','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('331181','龙泉市','331100','0578','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340000','安徽省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340100','合肥市','340000','0551','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340102','瑶海区','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340103','庐阳区','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340104','蜀山区','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340111','包河区','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340121','长丰县','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340122','肥东县','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340123','肥西县','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340124','庐江县','340100','0551','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340181','巢湖市','340100','0565','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340200','芜湖市','340000','0553','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340202','镜湖区','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340203','弋江区','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340207','鸠江区','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340208','三山区','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340221','芜湖县','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340222','繁昌县','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340223','南陵县','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340225','无为县','340200','0553','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340300','蚌埠市','340000','0552','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340302','龙子湖区','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340303','蚌山区','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340304','禹会区','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340311','淮上区','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340321','怀远县','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340322','五河县','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340323','固镇县','340300','0552','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340400','淮南市','340000','0554','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340402','大通区','340400','0554','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340403','田家庵区','340400','0554','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340404','谢家集区','340400','0554','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340405','八公山区','340400','0554','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340406','潘集区','340400','0554','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340421','凤台县','340400','0554','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340500','马鞍山市','340000','0555','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340503','花山区','340500','0555','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340504','雨山区','340500','0555','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340521','当涂县','340500','0555','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340522','含山县','340500','0555','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340523','和县','340500','0555','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340596','博望区','340500','0555','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340600','淮北市','340000','0561','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340602','杜集区','340600','0561','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340603','相山区','340600','0561','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340604','烈山区','340600','0561','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340621','濉溪县','340600','0561','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340700','铜陵市','340000','0562','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340702','铜官山区','340700','0562','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340703','狮子山区','340700','0562','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340711','郊区','340700','0562','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340721','铜陵县','340700','0562','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340800','安庆市','340000','0556','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340802','迎江区','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340803','大观区','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340811','宜秀区','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340822','怀宁县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340823','枞阳县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340824','潜山县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340825','太湖县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340826','宿松县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340827','望江县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340828','岳西县','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('340881','桐城市','340800','0556','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341000','黄山市','340000','0559','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341002','屯溪区','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341003','黄山区','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341004','徽州区','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341021','歙县','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341022','休宁县','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341023','黟县','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341024','祁门县','341000','0559','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341100','滁州市','340000','0550','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341102','琅琊区','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341103','南谯区','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341122','来安县','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341124','全椒县','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341125','定远县','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341126','凤阳县','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341181','天长市','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341182','明光市','341100','0550','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341200','阜阳市','340000','0558','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341202','颍州区','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341203','颍东区','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341204','颍泉区','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341221','临泉县','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341222','太和县','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341225','阜南县','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341226','颍上县','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341282','界首市','341200','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341300','宿州市','340000','0557','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341302','埇桥区','341300','0557','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341321','砀山县','341300','0557','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341322','萧县','341300','0557','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341323','灵璧县','341300','0557','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341324','泗县','341300','0557','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341500','六安市','340000','0564','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341502','金安区','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341503','裕安区','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341521','寿县','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341522','霍邱县','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341523','舒城县','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341524','金寨县','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341525','霍山县','341500','0564','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341600','亳州市','340000','0558','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341602','谯城区','341600','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341621','涡阳县','341600','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341622','蒙城县','341600','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341623','利辛县','341600','0558','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341700','池州市','340000','0566','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341702','贵池区','341700','0566','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341721','东至县','341700','0566','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341722','石台县','341700','0566','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341723','青阳县','341700','0566','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341800','宣城市','340000','0563','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341802','宣州区','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341821','郎溪县','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341822','广德县','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341823','泾县','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341824','绩溪县','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341825','旌德县','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('341881','宁国市','341800','0563','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350000','福建省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350100','福州市','350000','0591','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350102','鼓楼区','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350103','台江区','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350104','仓山区','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350105','马尾区','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350111','晋安区','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350121','闽侯县','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350122','连江县','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350123','罗源县','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350124','闽清县','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350125','永泰县','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350128','平潭县','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350181','福清市','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350182','长乐市','350100','0591','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350200','厦门市','350000','0592','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350203','思明区','350200','0592','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350205','海沧区','350200','0592','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350206','湖里区','350200','0592','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350211','集美区','350200','0592','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350212','同安区','350200','0592','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350213','翔安区','350200','0592','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350300','莆田市','350000','0594','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350302','城厢区','350300','0594','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350303','涵江区','350300','0594','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350304','荔城区','350300','0594','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350305','秀屿区','350300','0594','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350322','仙游县','350300','0594','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350400','三明市','350000','0598','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350402','梅列区','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350403','三元区','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350421','明溪县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350423','清流县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350424','宁化县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350425','大田县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350426','尤溪县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350427','沙县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350428','将乐县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350429','泰宁县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350430','建宁县','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350481','永安市','350400','0598','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350500','泉州市','350000','0595','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350502','鲤城区','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350503','丰泽区','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350504','洛江区','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350505','泉港区','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350521','惠安县','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350524','安溪县','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350525','永春县','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350526','德化县','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350527','金门县','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350581','石狮市','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350582','晋江市','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350583','南安市','350500','0595','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350600','漳州市','350000','0596','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350602','芗城区','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350603','龙文区','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350622','云霄县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350623','漳浦县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350624','诏安县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350625','长泰县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350626','东山县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350627','南靖县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350628','平和县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350629','华安县','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350681','龙海市','350600','0596','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350700','南平市','350000','0599','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350702','延平区','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350721','顺昌县','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350722','浦城县','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350723','光泽县','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350724','松溪县','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350725','政和县','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350781','邵武市','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350782','武夷山市','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350783','建瓯市','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350784','建阳市','350700','0599','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350800','龙岩市','350000','0597','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350802','新罗区','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350821','长汀县','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350822','永定县','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350823','上杭县','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350824','武平县','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350825','连城县','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350881','漳平市','350800','0597','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350900','宁德市','350000','0593','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350902','蕉城区','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350921','霞浦县','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350922','古田县','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350923','屏南县','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350924','寿宁县','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350925','周宁县','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350926','柘荣县','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350981','福安市','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('350982','福鼎市','350900','0593','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360000','江西省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360100','南昌市','360000','0791','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360102','东湖区','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360103','西湖区','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360104','青云谱区','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360105','湾里区','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360111','青山湖区','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360121','南昌县','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360122','新建县','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360123','安义县','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360124','进贤县','360100','0791','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360200','景德镇市','360000','0798','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360202','昌江区','360200','0798','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360203','珠山区','360200','0798','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360222','浮梁县','360200','0798','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360281','乐平市','360200','0798','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360300','萍乡市','360000','0799','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360302','安源区','360300','0799','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360313','湘东区','360300','0799','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360321','莲花县','360300','0799','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360322','上栗县','360300','0799','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360323','芦溪县','360300','0799','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360400','九江市','360000','0792','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360402','庐山区','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360403','浔阳区','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360421','九江县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360423','武宁县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360424','修水县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360425','永修县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360426','德安县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360427','星子县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360428','都昌县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360429','湖口县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360430','彭泽县','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360481','瑞昌市','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360482','共青城市','360400','0792','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360500','新余市','360000','0790','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360502','渝水区','360500','0790','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360521','分宜县','360500','0790','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360600','鹰潭市','360000','0701','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360602','月湖区','360600','0701','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360622','余江县','360600','0701','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360681','贵溪市','360600','0701','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360700','赣州市','360000','0797','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360702','章贡区','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360721','赣县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360722','信丰县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360723','大余县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360724','上犹县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360725','崇义县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360726','安远县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360727','龙南县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360728','定南县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360729','全南县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360730','宁都县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360731','于都县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360732','兴国县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360733','会昌县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360734','寻乌县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360735','石城县','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360781','瑞金市','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360782','南康市','360700','0797','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360800','吉安市','360000','0796','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360802','吉州区','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360803','青原区','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360821','吉安县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360822','吉水县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360823','峡江县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360824','新干县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360825','永丰县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360826','泰和县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360827','遂川县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360828','万安县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360829','安福县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360830','永新县','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360881','井冈山市','360800','0796','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360900','宜春市','360000','0795','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360902','袁州区','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360921','奉新县','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360922','万载县','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360923','上高县','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360924','宜丰县','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360925','靖安县','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360926','铜鼓县','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360981','丰城市','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360982','樟树市','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('360983','高安市','360900','0795','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361000','抚州市','360000','0794','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361002','临川区','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361021','南城县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361022','黎川县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361023','南丰县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361024','崇仁县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361025','乐安县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361026','宜黄县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361027','金溪县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361028','资溪县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361029','东乡县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361030','广昌县','361000','0794','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361100','上饶市','360000','0793','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361102','信州区','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361121','上饶县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361122','广丰县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361123','玉山县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361124','铅山县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361125','横峰县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361126','弋阳县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361127','余干县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361128','鄱阳县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361129','万年县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361130','婺源县','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('361181','德兴市','361100','0793','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370000','山东省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370100','济南市','370000','0531','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370102','历下区','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370103','市中区','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370104','槐荫区','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370105','天桥区','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370112','历城区','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370113','长清区','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370124','平阴县','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370125','济阳县','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370126','商河县','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370181','章丘市','370100','0531','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370200','青岛市','370000','0532','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370202','市南区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370203','市北区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370205','四方区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370211','黄岛区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370212','崂山区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370213','李沧区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370214','城阳区','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370281','胶州市','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370282','即墨市','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370283','平度市','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370284','胶南市','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370285','莱西市','370200','0532','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370300','淄博市','370000','0533','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370302','淄川区','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370303','张店区','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370304','博山区','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370305','临淄区','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370306','周村区','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370321','桓台县','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370322','高青县','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370323','沂源县','370300','0533','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370400','枣庄市','370000','0632','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370402','市中区','370400','0632','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370403','薛城区','370400','0632','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370404','峄城区','370400','0632','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370405','台儿庄区','370400','0632','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370406','山亭区','370400','0632','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370481','滕州市','370400','0632','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370500','东营市','370000','0546','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370502','东营区','370500','0546','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370503','河口区','370500','0546','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370521','垦利县','370500','0546','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370522','利津县','370500','0546','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370523','广饶县','370500','0546','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370600','烟台市','370000','0535','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370602','芝罘区','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370611','福山区','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370612','牟平区','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370613','莱山区','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370634','长岛县','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370681','龙口市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370682','莱阳市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370683','莱州市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370684','蓬莱市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370685','招远市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370686','栖霞市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370687','海阳市','370600','0535','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370700','潍坊市','370000','0536','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370702','潍城区','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370703','寒亭区','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370704','坊子区','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370705','奎文区','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370724','临朐县','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370725','昌乐县','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370781','青州市','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370782','诸城市','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370783','寿光市','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370784','安丘市','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370785','高密市','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370786','昌邑市','370700','0536','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370800','济宁市','370000','0537','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370802','市中区','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370811','任城区','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370826','微山县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370827','鱼台县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370828','金乡县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370829','嘉祥县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370830','汶上县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370831','泗水县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370832','梁山县','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370881','曲阜市','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370882','兖州市','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370883','邹城市','370800','0537','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370900','泰安市','370000','0538','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370902','泰山区','370900','0538','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370911','岱岳区','370900','0538','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370921','宁阳县','370900','0538','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370923','东平县','370900','0538','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370982','新泰市','370900','0538','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('370983','肥城市','370900','0538','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371000','威海市','370000','0631','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371002','环翠区','371000','0631','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371081','文登市','371000','0631','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371082','荣成市','371000','0631','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371083','乳山市','371000','0631','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371100','日照市','370000','0633','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371102','东港区','371100','0633','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371103','岚山区','371100','0633','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371121','五莲县','371100','0633','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371122','莒县','371100','0633','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371200','莱芜市','370000','0634','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371202','莱城区','371200','0634','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371203','钢城区','371200','0634','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371300','临沂市','370000','0539','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371302','兰山区','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371311','罗庄区','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371312','河东区','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371321','沂南县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371322','郯城县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371323','沂水县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371324','苍山县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371325','费县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371326','平邑县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371327','莒南县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371328','蒙阴县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371329','临沭县','371300','0539','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371400','德州市','370000','0534','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371402','德城区','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371421','陵县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371422','宁津县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371423','庆云县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371424','临邑县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371425','齐河县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371426','平原县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371427','夏津县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371428','武城县','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371481','乐陵市','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371482','禹城市','371400','0534','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371500','聊城市','370000','0635','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371502','东昌府区','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371521','阳谷县','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371522','莘县','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371523','茌平县','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371524','东阿县','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371525','冠县','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371526','高唐县','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371581','临清市','371500','0635','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371600','滨州市','370000','0543','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371602','滨城区','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371621','惠民县','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371622','阳信县','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371623','无棣县','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371624','沾化县','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371625','博兴县','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371626','邹平县','371600','0543','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371700','菏泽市','370000','0530','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371702','牡丹区','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371721','曹县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371722','单县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371723','成武县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371724','巨野县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371725','郓城县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371726','鄄城县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371727','定陶县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('371728','东明县','371700','0530','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410000','河南省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410100','郑州市','410000','0371','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410102','中原区','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410103','二七区','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410104','管城回族区','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410105','金水区','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410106','上街区','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410108','惠济区','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410122','中牟县','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410181','巩义市','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410182','荥阳市','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410183','新密市','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410184','新郑市','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410185','登封市','410100','0371','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410200','开封市','410000','0378','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410202','龙亭区','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410203','顺河回族区','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410204','鼓楼区','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410205','禹王台区','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410211','金明区','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410221','杞县','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410222','通许县','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410223','尉氏县','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410224','开封县','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410225','兰考县','410200','0378','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410300','洛阳市','410000','0379','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410302','老城区','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410303','西工区','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410304','瀍河回族区','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410305','涧西区','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410306','吉利区','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410311','洛龙区','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410322','孟津县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410323','新安县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410324','栾川县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410325','嵩县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410326','汝阳县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410327','宜阳县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410328','洛宁县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410329','伊川县','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410381','偃师市','410300','0379','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410400','平顶山市','410000','0375','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410402','新华区','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410403','卫东区','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410404','石龙区','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410411','湛河区','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410421','宝丰县','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410422','叶县','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410423','鲁山县','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410425','郏县','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410481','舞钢市','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410482','汝州市','410400','0375','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410500','安阳市','410000','0372','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410502','文峰区','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410503','北关区','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410505','殷都区','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410506','龙安区','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410522','安阳县','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410523','汤阴县','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410526','滑县','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410527','内黄县','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410581','林州市','410500','0372','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410600','鹤壁市','410000','0392','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410602','鹤山区','410600','0392','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410603','山城区','410600','0392','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410611','淇滨区','410600','0392','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410621','浚县','410600','0392','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410622','淇县','410600','0392','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410700','新乡市','410000','0373','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410702','红旗区','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410703','卫滨区','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410704','凤泉区','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410711','牧野区','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410721','新乡县','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410724','获嘉县','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410725','原阳县','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410726','延津县','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410727','封丘县','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410728','长垣县','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410781','卫辉市','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410782','辉县市','410700','0373','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410800','焦作市','410000','0391','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410802','解放区','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410803','中站区','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410804','马村区','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410811','山阳区','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410821','修武县','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410822','博爱县','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410823','武陟县','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410825','温县','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410882','沁阳市','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410883','孟州市','410800','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410900','濮阳市','410000','0393','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410902','华龙区','410900','0393','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410922','清丰县','410900','0393','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410923','南乐县','410900','0393','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410926','范县','410900','0393','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410927','台前县','410900','0393','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('410928','濮阳县','410900','0393','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411000','许昌市','410000','0374','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411002','魏都区','411000','0374','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411023','许昌县','411000','0374','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411024','鄢陵县','411000','0374','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411025','襄城县','411000','0374','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411081','禹州市','411000','0374','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411082','长葛市','411000','0374','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411100','漯河市','410000','0395','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411102','源汇区','411100','0395','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411103','郾城区','411100','0395','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411104','召陵区','411100','0395','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411121','舞阳县','411100','0395','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411122','临颍县','411100','0395','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411200','三门峡市','410000','0398','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411202','湖滨区','411200','0398','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411221','渑池县','411200','0398','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411222','陕县','411200','0398','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411224','卢氏县','411200','0398','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411281','义马市','411200','0398','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411282','灵宝市','411200','0398','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411300','南阳市','410000','0377','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411302','宛城区','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411303','卧龙区','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411321','南召县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411322','方城县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411323','西峡县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411324','镇平县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411325','内乡县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411326','淅川县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411327','社旗县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411328','唐河县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411329','新野县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411330','桐柏县','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411381','邓州市','411300','0377','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411400','商丘市','410000','0370','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411402','梁园区','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411403','睢阳区','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411421','民权县','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411422','睢县','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411423','宁陵县','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411424','柘城县','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411425','虞城县','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411426','夏邑县','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411481','永城市','411400','0370','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411500','信阳市','410000','0376','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411502','浉河区','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411503','平桥区','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411521','罗山县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411522','光山县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411523','新县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411524','商城县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411525','固始县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411526','潢川县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411527','淮滨县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411528','息县','411500','0376','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411600','周口市','410000','0394','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411602','川汇区','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411621','扶沟县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411622','西华县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411623','商水县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411624','沈丘县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411625','郸城县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411626','淮阳县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411627','太康县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411628','鹿邑县','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411681','项城市','411600','0394','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411700','驻马店市','410000','0396','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411702','驿城区','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411721','西平县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411722','上蔡县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411723','平舆县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411724','正阳县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411725','确山县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411726','泌阳县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411727','汝南县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411728','遂平县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('411729','新蔡县','411700','0396','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('419000','省直辖','410000','','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('419001','济源市','419000','0391','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420000','湖北省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420100','武汉市','420000','027','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420102','江岸区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420103','江汉区','420100','0728','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420104','硚口区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420105','汉阳区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420106','武昌区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420107','青山区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420111','洪山区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420112','东西湖区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420113','汉南区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420114','蔡甸区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420115','江夏区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420116','黄陂区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420117','新洲区','420100','027','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420200','黄石市','420000','0714','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420202','黄石港区','420200','0714','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420203','西塞山区','420200','0714','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420204','下陆区','420200','0714','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420205','铁山区','420200','0714','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420222','阳新县','420200','0714','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420281','大冶市','420200','0714','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420300','十堰市','420000','0719','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420302','茅箭区','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420303','张湾区','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420321','郧县','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420322','郧西县','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420323','竹山县','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420324','竹溪县','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420325','房县','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420381','丹江口市','420300','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420500','宜昌市','420000','0717','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420502','西陵区','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420503','伍家岗区','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420504','点军区','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420505','猇亭区','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420506','夷陵区','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420525','远安县','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420526','兴山县','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420527','秭归县','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420528','长阳土家族自治县','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420529','五峰土家族自治县','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420581','宜都市','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420582','当阳市','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420583','枝江市','420500','0717','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420600','襄阳市','420000','0710','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420602','襄城区','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420606','樊城区','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420607','襄州区','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420624','南漳县','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420625','谷城县','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420626','保康县','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420682','老河口市','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420683','枣阳市','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420684','宜城市','420600','0710','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420700','鄂州市','420000','0711','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420702','梁子湖区','420700','0711','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420703','华容区','420700','0711','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420704','鄂城区','420700','0711','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420800','荆门市','420000','0724','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420802','东宝区','420800','0724','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420804','掇刀区','420800','0724','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420821','京山县','420800','0724','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420822','沙洋县','420800','0724','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420881','钟祥市','420800','0724','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420900','孝感市','420000','0712','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420902','孝南区','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420921','孝昌县','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420922','大悟县','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420923','云梦县','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420981','应城市','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420982','安陆市','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('420984','汉川市','420900','0712','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421000','荆州市','420000','0716','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421002','沙市区','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421003','荆州区','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421022','公安县','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421023','监利县','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421024','江陵县','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421081','石首市','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421083','洪湖市','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421087','松滋市','421000','0716','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421100','黄冈市','420000','0713','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421102','黄州区','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421121','团风县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421122','红安县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421123','罗田县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421124','英山县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421125','浠水县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421126','蕲春县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421127','黄梅县','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421181','麻城市','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421182','武穴市','421100','0713','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421200','咸宁市','420000','0715','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421202','咸安区','421200','0715','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421221','嘉鱼县','421200','0715','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421222','通城县','421200','0715','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421223','崇阳县','421200','0715','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421224','通山县','421200','0715','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421281','赤壁市','421200','0715','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421300','随州市','420000','0722','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421303','曾都区','421300','0722','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421321','随县','421300','0722','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('421381','广水市','421300','0722','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422800','恩施土家族苗族自治州','420000','0718','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422801','恩施市','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422802','利川市','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422822','建始县','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422823','巴东县','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422825','宣恩县','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422826','咸丰县','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422827','来凤县','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('422828','鹤峰县','422800','0718','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('429000','省直辖','420000','','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('429004','仙桃市','429000','0728','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('429005','潜江市','429000','0728','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('429006','天门市','429000','0728','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('429021','神农架林区','429000','0719','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430000','湖南省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430100','长沙市','430000','0731','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430102','芙蓉区','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430103','天心区','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430104','岳麓区','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430105','开福区','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430111','雨花区','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430112','望城区','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430121','长沙县','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430124','宁乡县','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430181','浏阳市','430100','0731','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430200','株洲市','430000','0733','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430202','荷塘区','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430203','芦淞区','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430204','石峰区','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430211','天元区','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430221','株洲县','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430223','攸县','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430224','茶陵县','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430225','炎陵县','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430281','醴陵市','430200','0733','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430300','湘潭市','430000','0732','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430302','雨湖区','430300','0732','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430304','岳塘区','430300','0732','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430321','湘潭县','430300','0732','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430381','湘乡市','430300','0732','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430382','韶山市','430300','0732','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430400','衡阳市','430000','0734','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430405','珠晖区','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430406','雁峰区','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430407','石鼓区','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430408','蒸湘区','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430412','南岳区','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430421','衡阳县','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430422','衡南县','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430423','衡山县','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430424','衡东县','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430426','祁东县','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430481','耒阳市','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430482','常宁市','430400','0734','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430500','邵阳市','430000','0739','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430502','双清区','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430503','大祥区','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430511','北塔区','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430521','邵东县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430522','新邵县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430523','邵阳县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430524','隆回县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430525','洞口县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430527','绥宁县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430528','新宁县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430529','城步苗族自治县','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430581','武冈市','430500','0739','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430600','岳阳市','430000','0730','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430602','岳阳楼区','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430603','云溪区','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430611','君山区','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430621','岳阳县','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430623','华容县','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430624','湘阴县','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430626','平江县','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430681','汨罗市','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430682','临湘市','430600','0730','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430700','常德市','430000','0736','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430702','武陵区','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430703','鼎城区','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430721','安乡县','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430722','汉寿县','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430723','澧县','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430724','临澧县','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430725','桃源县','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430726','石门县','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430781','津市市','430700','0736','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430800','张家界市','430000','0744','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430802','永定区','430800','0744','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430811','武陵源区','430800','0744','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430821','慈利县','430800','0744','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430822','桑植县','430800','0744','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430900','益阳市','430000','0737','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430902','资阳区','430900','0737','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430903','赫山区','430900','0737','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430921','南县','430900','0737','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430922','桃江县','430900','0737','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430923','安化县','430900','0737','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('430981','沅江市','430900','0737','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431000','郴州市','430000','0735','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431002','北湖区','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431003','苏仙区','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431021','桂阳县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431022','宜章县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431023','永兴县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431024','嘉禾县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431025','临武县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431026','汝城县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431027','桂东县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431028','安仁县','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431081','资兴市','431000','0735','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431100','永州市','430000','0746','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431102','零陵区','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431103','冷水滩区','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431121','祁阳县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431122','东安县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431123','双牌县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431124','道县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431125','江永县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431126','宁远县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431127','蓝山县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431128','新田县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431129','江华瑶族自治县','431100','0746','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431200','怀化市','430000','0745','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431202','鹤城区','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431221','中方县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431222','沅陵县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431223','辰溪县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431224','溆浦县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431225','会同县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431226','麻阳苗族自治县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431227','新晃侗族自治县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431228','芷江侗族自治县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431229','靖州苗族侗族自治县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431230','通道侗族自治县','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431281','洪江市','431200','0745','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431300','娄底市','430000','0738','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431302','娄星区','431300','0738','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431321','双峰县','431300','0738','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431322','新化县','431300','0738','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431381','冷水江市','431300','0738','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('431382','涟源市','431300','0738','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433100','湘西土家族苗族自治州','430000','0743','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433101','吉首市','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433122','泸溪县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433123','凤凰县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433124','花垣县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433125','保靖县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433126','古丈县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433127','永顺县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('433130','龙山县','433100','0743','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440000','广东省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440100','广州市','440000','020','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440103','荔湾区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440104','越秀区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440105','海珠区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440106','天河区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440111','白云区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440112','黄埔区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440113','番禺区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440114','花都区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440115','南沙区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440116','萝岗区','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440183','增城市','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440184','从化市','440100','020','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440200','韶关市','440000','0751','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440203','武江区','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440204','浈江区','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440205','曲江区','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440222','始兴县','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440224','仁化县','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440229','翁源县','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440232','乳源瑶族自治县','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440233','新丰县','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440281','乐昌市','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440282','南雄市','440200','0751','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440300','深圳市','440000','0755','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440303','罗湖区','440300','0755','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440304','福田区','440300','0755','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440305','南山区','440300','0755','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440306','宝安区','440300','0755','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440307','龙岗区','440300','0755','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440308','盐田区','440300','0755','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440400','珠海市','440000','0756','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440402','香洲区','440400','0756','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440403','斗门区','440400','0756','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440404','金湾区','440400','0756','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440500','汕头市','440000','0754','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440507','龙湖区','440500','0754','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440511','金平区','440500','0754','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440512','濠江区','440500','0754','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440513','潮阳区','440500','0661','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440514','潮南区','440500','0754','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440515','澄海区','440500','0754','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440523','南澳县','440500','0754','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440600','佛山市','440000','0757','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440604','禅城区','440600','0757','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440605','南海区','440600','0757','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440606','顺德区','440600','0765','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440607','三水区','440600','0757','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440608','高明区','440600','0757','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440700','江门市','440000','0750','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440703','蓬江区','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440704','江海区','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440705','新会区','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440781','台山市','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440783','开平市','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440784','鹤山市','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440785','恩平市','440700','0750','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440800','湛江市','440000','0759','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440802','赤坎区','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440803','霞山区','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440804','坡头区','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440811','麻章区','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440823','遂溪县','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440825','徐闻县','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440881','廉江市','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440882','雷州市','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440883','吴川市','440800','0759','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440900','茂名市','440000','0668','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440902','茂南区','440900','0668','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440903','茂港区','440900','0668','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440923','电白县','440900','0668','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440981','高州市','440900','0668','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440982','化州市','440900','0668','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('440983','信宜市','440900','0668','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441200','肇庆市','440000','0758','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441202','端州区','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441203','鼎湖区','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441223','广宁县','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441224','怀集县','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441225','封开县','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441226','德庆县','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441283','高要市','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441284','四会市','441200','0758','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441300','惠州市','440000','0752','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441302','惠城区','441300','0752','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441303','惠阳区','441300','0752','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441322','博罗县','441300','0752','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441323','惠东县','441300','0752','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441324','龙门县','441300','0752','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441400','梅州市','440000','0753','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441402','梅江区','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441421','梅县','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441422','大埔县','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441423','丰顺县','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441424','五华县','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441426','平远县','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441427','蕉岭县','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441481','兴宁市','441400','0753','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441500','汕尾市','440000','0660','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441502','城区','441500','0660','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441521','海丰县','441500','0660','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441523','陆河县','441500','0660','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441581','陆丰市','441500','0660','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441600','河源市','440000','0762','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441602','源城区','441600','0762','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441621','紫金县','441600','0762','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441622','龙川县','441600','0762','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441623','连平县','441600','0762','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441624','和平县','441600','0762','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441625','东源县','441600','0762','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441700','阳江市','440000','0662','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441702','江城区','441700','0662','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441721','阳西县','441700','0662','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441723','阳东县','441700','0662','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441781','阳春市','441700','0662','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441800','清远市','440000','0763','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441802','清城区','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441821','佛冈县','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441823','阳山县','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441825','连山壮族瑶族自治县','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441826','连南瑶族自治县','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441827','清新县','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441881','英德市','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441882','连州市','441800','0763','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441900','东莞市','440000','0769','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('441901','东莞市','441900','0769','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('442000','中山市','440000','0760','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('442001','中山市','442000','0760','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445100','潮州市','440000','0768','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445102','湘桥区','445100','0768','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445121','潮安县','445100','0768','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445122','饶平县','445100','0768','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445200','揭阳市','440000','0663','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445202','榕城区','445200','0663','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445221','揭东县','445200','0663','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445222','揭西县','445200','0663','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445224','惠来县','445200','0663','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445281','普宁市','445200','0663','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445300','云浮市','440000','0766','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445302','云城区','445300','0766','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445321','新兴县','445300','0766','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445322','郁南县','445300','0766','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445323','云安县','445300','0766','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('445381','罗定市','445300','0766','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450000','广西壮族自治区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450100','南宁市','450000','0771','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450102','兴宁区','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450103','青秀区','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450105','江南区','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450107','西乡塘区','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450108','良庆区','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450109','邕宁区','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450122','武鸣县','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450123','隆安县','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450124','马山县','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450125','上林县','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450126','宾阳县','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450127','横县','450100','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450200','柳州市','450000','0772','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450202','城中区','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450203','鱼峰区','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450204','柳南区','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450205','柳北区','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450221','柳江县','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450222','柳城县','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450223','鹿寨县','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450224','融安县','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450225','融水苗族自治县','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450226','三江侗族自治县','450200','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450300','桂林市','450000','0773','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450302','秀峰区','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450303','叠彩区','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450304','象山区','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450305','七星区','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450311','雁山区','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450321','阳朔县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450322','临桂县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450323','灵川县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450324','全州县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450325','兴安县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450326','永福县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450327','灌阳县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450328','龙胜各族自治县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450329','资源县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450330','平乐县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450331','荔蒲县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450332','恭城瑶族自治县','450300','0773','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450400','梧州市','450000','0774','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450403','万秀区','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450404','蝶山区','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450405','长洲区','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450421','苍梧县','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450422','藤县','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450423','蒙山县','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450481','岑溪市','450400','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450500','北海市','450000','0779','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450502','海城区','450500','0779','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450503','银海区','450500','0779','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450512','铁山港区','450500','0779','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450521','合浦县','450500','0779','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450600','防城港市','450000','0770','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450602','港口区','450600','0770','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450603','防城区','450600','0770','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450621','上思县','450600','0770','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450681','东兴市','450600','0770','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450700','钦州市','450000','0777','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450702','钦南区','450700','0777','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450703','钦北区','450700','0777','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450721','灵山县','450700','0777','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450722','浦北县','450700','0777','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450800','贵港市','450000','0775','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450802','港北区','450800','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450803','港南区','450800','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450804','覃塘区','450800','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450821','平南县','450800','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450881','桂平市','450800','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450900','玉林市','450000','0775','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450902','玉州区','450900','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450921','容县','450900','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450922','陆川县','450900','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450923','博白县','450900','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450924','兴业县','450900','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('450981','北流市','450900','0775','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451000','百色市','450000','0776','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451002','右江区','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451021','田阳县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451022','田东县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451023','平果县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451024','德保县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451025','靖西县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451026','那坡县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451027','凌云县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451028','乐业县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451029','田林县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451030','西林县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451031','隆林各族自治县','451000','0776','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451100','贺州市','450000','0774','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451102','八步区','451100','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451119','平桂管理区','451100','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451121','昭平县','451100','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451122','钟山县','451100','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451123','富川瑶族自治县','451100','0774','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451200','河池市','450000','0778','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451202','金城江区','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451221','南丹县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451222','天峨县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451223','凤山县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451224','东兰县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451225','罗城仫佬族自治县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451226','环江毛南族自治县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451227','巴马瑶族自治县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451228','都安瑶族自治县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451229','大化瑶族自治县','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451281','宜州市','451200','0778','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451300','来宾市','450000','0772','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451302','兴宾区','451300','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451321','忻城县','451300','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451322','象州县','451300','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451323','武宣县','451300','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451324','金秀瑶族自治县','451300','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451381','合山市','451300','0772','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451400','崇左市','450000','0771','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451402','江洲区','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451421','扶绥县','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451422','宁明县','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451423','龙州县','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451424','大新县','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451425','天等县','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('451481','凭祥市','451400','0771','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460000','海南省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460100','海口市','460000','0898','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460105','秀英区','460100','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460106','龙华区','460100','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460107','琼山区','460100','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460108','美兰区','460100','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460200','三亚市','460000','0899','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460201','三亚市','460200','0899','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460300','三沙市','460000','0898','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460321','西沙群岛','460300','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460322','南沙群岛','460300','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('460323','中沙群岛','460300','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469000','省直辖','460000','','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469001','五指山市','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469002','琼海市','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469003','儋州市','469000','0890','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469005','文昌市','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469006','万宁市','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469007','东方市','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469021','定安县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469022','屯昌县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469023','澄迈县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469024','临高县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469025','白沙黎族自治县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469026','昌江黎族自治县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469027','乐东黎族自治县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469028','陵水黎族自治县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469029','保亭黎族苗族自治县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('469030','琼中黎族苗族自治县','469000','0898','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500000','重庆市','0','0811','1','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500101','万州区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500102','涪陵区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500103','渝中区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500104','大渡口区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500105','江北区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500106','沙坪坝区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500107','九龙坡区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500108','南岸区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500109','北碚区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500110','綦江区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500111','大足区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500112','渝北区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500113','巴南区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500114','黔江区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500115','长寿区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500116','江津区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500117','合川区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500118','永川区','500000','0814','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500119','南川区','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500223','潼南县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500224','铜梁县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500226','荣昌县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500227','璧山县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500228','梁平县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500229','城口县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500230','丰都县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500231','垫江县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500232','武隆县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500233','忠县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500234','开县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500235','云阳县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500236','奉节县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500237','巫山县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500238','巫溪县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500240','石柱土家族自治县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500241','秀山土家族苗族自治县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500242','酉阳土家族苗族自治县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('500243','彭水苗族土家族自治县','500000','0811','2','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510000','四川省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510100','成都市','510000','028','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510104','锦江区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510105','青羊区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510106','金牛区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510107','武侯区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510108','成华区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510112','龙泉驿区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510113','青白江区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510114','新都区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510115','温江区','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510121','金堂县','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510122','双流县','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510124','郫县','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510129','大邑县','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510131','蒲江县','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510132','新津县','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510181','都江堰市','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510182','彭州市','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510183','邛崃市','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510184','崇州市','510100','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510300','自贡市','510000','0813','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510302','自流井区','510300','0813','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510303','贡井区','510300','0813','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510304','大安区','510300','0813','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510311','沿滩区','510300','0813','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510321','荣县','510300','0813','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510322','富顺县','510300','0813','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510400','攀枝花市','510000','0812','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510402','东区','510400','0812','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510403','西区','510400','0812','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510411','仁和区','510400','0812','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510421','米易县','510400','0812','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510422','盐边县','510400','0812','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510500','泸州市','510000','0840','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510502','江阳区','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510503','纳溪区','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510504','龙马潭区','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510521','泸县','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510522','合江县','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510524','叙永县','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510525','古蔺县','510500','0840','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510600','德阳市','510000','0838','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510603','旌阳区','510600','0838','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510623','中江县','510600','0838','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510626','罗江县','510600','0838','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510681','广汉市','510600','0838','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510682','什邡市','510600','0838','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510683','绵竹市','510600','0838','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510700','绵阳市','510000','0816','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510703','涪城区','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510704','游仙区','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510722','三台县','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510723','盐亭县','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510724','安县','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510725','梓潼县','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510726','北川羌族自治县','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510727','平武县','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510781','江油市','510700','0816','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510800','广元市','510000','0839','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510802','利州区','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510811','元坝区','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510812','朝天区','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510821','旺苍县','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510822','青川县','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510823','剑阁县','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510824','苍溪县','510800','0839','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510900','遂宁市','510000','0825','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510903','船山区','510900','0825','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510904','安居区','510900','0825','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510921','蓬溪县','510900','0825','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510922','射洪县','510900','0825','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('510923','大英县','510900','0825','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511000','内江市','510000','0832','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511002','市中区','511000','0832','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511011','东兴区','511000','0832','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511024','威远县','511000','0832','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511025','资中县','511000','0832','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511028','隆昌县','511000','0832','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511100','乐山市','510000','0833','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511102','市中区','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511111','沙湾区','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511112','五通桥区','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511113','金口河区','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511123','犍为县','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511124','井研县','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511126','夹江县','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511129','沐川县','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511132','峨边彝族自治县','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511133','马边彝族自治县','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511181','峨眉山市','511100','0833','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511300','南充市','510000','0817','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511302','顺庆区','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511303','高坪区','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511304','嘉陵区','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511321','南部县','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511322','营山县','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511323','蓬安县','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511324','仪陇县','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511325','西充县','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511381','阆中市','511300','0817','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511400','眉山市','510000','028','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511402','东坡区','511400','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511421','仁寿县','511400','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511422','彭山县','511400','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511423','洪雅县','511400','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511424','丹棱县','511400','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511425','青神县','511400','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511500','宜宾市','510000','0831','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511502','翠屏区','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511521','宜宾县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511522','南溪区','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511523','江安县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511524','长宁县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511525','高县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511526','珙县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511527','筠连县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511528','兴文县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511529','屏山县','511500','0831','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511600','广安市','510000','0826','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511602','广安区','511600','0826','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511621','岳池县','511600','0826','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511622','武胜县','511600','0826','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511623','邻水县','511600','0826','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511681','华蓥市','511600','0826','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511700','达州市','510000','0818','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511702','通川区','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511721','达县','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511722','宣汉县','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511723','开江县','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511724','大竹县','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511725','渠县','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511781','万源市','511700','0818','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511800','雅安市','510000','0835','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511802','雨城区','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511821','名山县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511822','荥经县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511823','汉源县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511824','石棉县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511825','天全县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511826','芦山县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511827','宝兴县','511800','0835','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511900','巴中市','510000','0827','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511902','巴州区','511900','0827','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511921','通江县','511900','0827','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511922','南江县','511900','0827','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('511923','平昌县','511900','0827','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('512000','资阳市','510000','028','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('512002','雁江区','512000','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('512021','安岳县','512000','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('512022','乐至县','512000','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('512081','简阳市','512000','028','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513200','阿坝藏族羌族自治州','510000','0837','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513221','汶川县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513222','理县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513223','茂县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513224','松潘县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513225','九寨沟县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513226','金川县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513227','小金县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513228','黑水县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513229','马尔康县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513230','壤塘县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513231','阿坝县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513232','若尔盖县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513233','红原县','513200','0837','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513300','甘孜藏族自治州','510000','0836','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513321','康定县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513322','泸定县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513323','丹巴县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513324','九龙县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513325','雅江县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513326','道孚县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513327','炉霍县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513328','甘孜县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513329','新龙县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513330','德格县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513331','白玉县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513332','石渠县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513333','色达县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513334','理塘县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513335','巴塘县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513336','乡城县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513337','稻城县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513338','得荣县','513300','0836','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513400','凉山彝族自治州','510000','0834','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513401','西昌市','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513422','木里藏族自治县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513423','盐源县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513424','德昌县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513425','会理县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513426','会东县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513427','宁南县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513428','普格县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513429','布拖县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513430','金阳县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513431','昭觉县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513432','喜德县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513433','冕宁县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513434','越西县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513435','甘洛县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513436','美姑县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('513437','雷波县','513400','0834','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520000','贵州省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520100','贵阳市','520000','0851','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520102','南明区','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520103','云岩区','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520111','花溪区','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520112','乌当区','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520113','白云区','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520114','小河区','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520121','开阳县','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520122','息烽县','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520123','修文县','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520181','清镇市','520100','0851','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520200','六盘水市','520000','0858','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520201','钟山区','520200','0858','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520203','六枝特区','520200','0858','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520221','水城县','520200','0858','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520222','盘县','520200','0858','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520300','遵义市','520000','0852','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520302','红花岗区','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520303','汇川区','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520321','遵义县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520322','桐梓县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520323','绥阳县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520324','正安县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520325','道真仡佬族苗族自治县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520326','务川仡佬族苗族自治县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520327','凤冈县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520328','湄潭县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520329','余庆县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520330','习水县','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520381','赤水市','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520382','仁怀市','520300','0852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520400','安顺市','520000','0853','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520402','西秀区','520400','0853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520421','平坝县','520400','0853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520422','普定县','520400','0853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520423','镇宁布依族苗族自治县','520400','0853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520424','关岭布依族苗族自治县','520400','0853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520425','紫云苗族布依族自治县','520400','0853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520500','毕节市','520000','0857','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520501','七星关区','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520522','大方县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520523','黔西县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520524','金沙县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520525','织金县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520526','纳雍县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520527','威宁彝族回族苗族自治县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520528','赫章县','520500','0857','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520600','铜仁市','520000','0856','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520601','碧江区','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520602','万山区','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520622','江口县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520623','玉屏侗族自治县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520624','石阡县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520625','思南县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520626','印江土家族苗族自治县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520627','德江县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520628','沿河土家族自治县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('520629','松桃苗族自治县','520600','0856','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522300','黔西南布依族苗族自治州','520000','0859','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522301','兴义市','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522322','兴仁县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522323','普安县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522324','晴隆县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522325','贞丰县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522326','望谟县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522327','册亨县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522328','安龙县','522300','0859','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522600','黔东南苗族侗族自治州','520000','0855','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522601','凯里市','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522622','黄平县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522623','施秉县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522624','三穗县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522625','镇远县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522626','岑巩县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522627','天柱县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522628','锦屏县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522629','剑河县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522630','台江县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522631','黎平县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522632','榕江县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522633','从江县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522634','雷山县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522635','麻江县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522636','丹寨县','522600','0855','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522700','黔南布依族苗族自治州','520000','0854','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522701','都匀市','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522702','福泉市','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522722','荔波县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522723','贵定县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522725','瓮安县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522726','独山县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522727','平塘县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522728','罗甸县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522729','长顺县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522730','龙里县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522731','惠水县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('522732','三都水族自治县','522700','0854','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530000','云南省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530100','昆明市','530000','0871','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530102','五华区','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530103','盘龙区','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530111','官渡区','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530112','西山区','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530113','东川区','530100','0881','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530121','呈贡区','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530122','晋宁县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530124','富民县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530125','宜良县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530126','石林彝族自治县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530127','嵩明县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530128','禄劝彝族苗族自治县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530129','寻甸回族彝族自治县','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530181','安宁市','530100','0871','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530300','曲靖市','530000','0874','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530302','麒麟区','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530321','马龙县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530322','陆良县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530323','师宗县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530324','罗平县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530325','富源县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530326','会泽县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530328','沾益县','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530381','宣威市','530300','0874','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530400','玉溪市','530000','0877','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530402','红塔区','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530421','江川县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530422','澄江县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530423','通海县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530424','华宁县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530425','易门县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530426','峨山彝族自治县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530427','新平彝族傣族自治县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530428','元江哈尼族彝族傣族自治县','530400','0877','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530500','保山市','530000','0875','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530502','隆阳区','530500','0875','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530521','施甸县','530500','0875','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530522','腾冲县','530500','0875','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530523','龙陵县','530500','0875','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530524','昌宁县','530500','0875','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530600','昭通市','530000','0870','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530602','昭阳区','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530621','鲁甸县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530622','巧家县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530623','盐津县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530624','大关县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530625','永善县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530626','绥江县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530627','镇雄县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530628','彝良县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530629','威信县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530630','水富县','530600','0870','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530700','丽江市','530000','0888','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530702','古城区','530700','0888','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530721','玉龙纳西族自治县','530700','0888','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530722','永胜县','530700','0888','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530723','华坪县','530700','0888','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530724','宁蒗彝族自治县','530700','0888','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530800','普洱市','530000','0879','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530802','思茅区','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530821','宁洱哈尼族彝族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530822','墨江哈尼族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530823','景东彝族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530824','景谷傣族彝族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530825','镇沅彝族哈尼族拉祜族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530826','江城哈尼族彝族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530827','孟连傣族拉祜族佤族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530828','澜沧拉祜族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530829','西盟佤族自治县','530800','0879','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530900','临沧市','530000','0883','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530902','临翔区','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530921','凤庆县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530922','云县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530923','永德县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530924','镇康县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530925','双江拉祜族佤族布朗族傣族自治县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530926','耿马傣族佤族自治县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('530927','沧源佤族自治县','530900','0883','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532300','楚雄彝族自治州','530000','0878','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532301','楚雄市','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532322','双柏县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532323','牟定县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532324','南华县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532325','姚安县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532326','大姚县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532327','永仁县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532328','元谋县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532329','武定县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532331','禄丰县','532300','0878','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532500','红河哈尼族彝族自治州','530000','0873','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532501','个旧市','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532502','开远市','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532503','蒙自市','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532523','屏边苗族自治县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532524','建水县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532525','石屏县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532526','弥勒县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532527','泸西县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532528','元阳县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532529','红河县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532530','金平苗族瑶族傣族自治县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532531','绿春县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532532','河口瑶族自治县','532500','0873','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532600','文山壮族苗族自治州','530000','0876','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532621','文山市','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532622','砚山县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532623','西畴县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532624','麻栗坡县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532625','马关县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532626','丘北县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532627','广南县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532628','富宁县','532600','0876','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532800','西双版纳傣族自治州','530000','0691','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532801','景洪市','532800','0691','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532822','勐海县','532800','0691','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532823','勐腊县','532800','0691','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532900','大理白族自治州','530000','0872','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532901','大理市','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532922','漾濞彝族自治县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532923','祥云县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532924','宾川县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532925','弥渡县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532926','南涧彝族自治县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532927','巍山彝族回族自治县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532928','永平县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532929','云龙县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532930','洱源县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532931','剑川县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('532932','鹤庆县','532900','0872','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533100','德宏傣族景颇族自治州','530000','0692','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533102','瑞丽市','533100','0692','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533103','芒市','533100','0692','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533122','梁河县','533100','0692','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533123','盈江县','533100','0692','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533124','陇川县','533100','0692','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533300','怒江傈僳族自治州','530000','0886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533321','泸水县','533300','0886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533323','福贡县','533300','0886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533324','贡山独龙族怒族自治县','533300','0886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533325','兰坪白族普米族自治县','533300','0886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533400','迪庆藏族自治州','530000','0887','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533421','香格里拉县','533400','0887','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533422','德钦县','533400','0887','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('533423','维西傈僳族自治县','533400','0887','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540000','西藏自治区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540100','拉萨市','540000','0891','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540102','城关区','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540121','林周县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540122','当雄县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540123','尼木县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540124','曲水县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540125','堆龙德庆县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540126','达孜县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('540127','墨竹工卡县','540100','0891','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542100','昌都地区','540000','0895','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542121','昌都县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542122','江达县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542123','贡觉县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542124','类乌齐县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542125','丁青县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542126','察雅县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542127','八宿县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542128','左贡县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542129','芒康县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542132','洛隆县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542133','边坝县','542100','0895','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542200','山南地区','540000','0893','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542221','乃东县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542222','扎囊县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542223','贡嘎县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542224','桑日县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542225','琼结县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542226','曲松县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542227','措美县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542228','洛扎县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542229','加查县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542231','隆子县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542232','错那县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542233','浪卡子县','542200','0893','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542300','日喀则地区','540000','0892','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542301','日喀则市','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542322','南木林县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542323','江孜县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542324','定日县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542325','萨迦县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542326','拉孜县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542327','昂仁县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542328','谢通门县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542329','白朗县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542330','仁布县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542331','康马县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542332','定结县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542333','仲巴县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542334','亚东县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542335','吉隆县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542336','聂拉木县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542337','萨嘎县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542338','岗巴县','542300','0892','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542400','那曲地区','540000','0896','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542421','那曲县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542422','嘉黎县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542423','比如县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542424','聂荣县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542425','安多县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542426','申扎县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542427','索县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542428','班戈县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542429','巴青县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542430','尼玛县','542400','0896','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542500','阿里地区','540000','0897','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542521','普兰县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542522','札达县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542523','噶尔县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542524','日土县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542525','革吉县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542526','改则县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542527','措勤县','542500','0897','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542600','林芝地区','540000','0894','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542621','林芝县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542622','工布江达县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542623','米林县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542624','墨脱县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542625','波密县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542626','察隅县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('542627','朗县','542600','0894','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610000','陕西省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610100','西安市','610000','029','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610102','新城区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610103','碑林区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610104','莲湖区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610111','灞桥区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610112','未央区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610113','雁塔区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610114','阎良区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610115','临潼区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610116','长安区','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610122','蓝田县','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610124','周至县','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610125','户县','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610126','高陵县','610100','029','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610200','铜川市','610000','0919','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610202','王益区','610200','0919','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610203','印台区','610200','0919','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610204','耀州区','610200','0919','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610222','宜君县','610200','0919','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610300','宝鸡市','610000','0917','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610302','渭滨区','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610303','金台区','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610304','陈仓区','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610322','凤翔县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610323','岐山县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610324','扶风县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610326','眉县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610327','陇县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610328','千阳县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610329','麟游县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610330','凤县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610331','太白县','610300','0917','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610400','咸阳市','610000','0910','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610402','秦都区','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610403','杨陵区','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610404','渭城区','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610422','三原县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610423','泾阳县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610424','乾县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610425','礼泉县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610426','永寿县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610427','彬县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610428','长武县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610429','旬邑县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610430','淳化县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610431','武功县','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610481','兴平市','610400','0910','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610500','渭南市','610000','0913','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610502','临渭区','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610521','华县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610522','潼关县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610523','大荔县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610524','合阳县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610525','澄城县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610526','蒲城县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610527','白水县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610528','富平县','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610581','韩城市','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610582','华阴市','610500','0913','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610600','延安市','610000','0911','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610602','宝塔区','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610621','延长县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610622','延川县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610623','子长县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610624','安塞县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610625','志丹县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610626','吴起县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610627','甘泉县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610628','富县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610629','洛川县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610630','宜川县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610631','黄龙县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610632','黄陵县','610600','0911','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610700','汉中市','610000','0916','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610702','汉台区','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610721','南郑县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610722','城固县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610723','洋县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610724','西乡县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610725','勉县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610726','宁强县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610727','略阳县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610728','镇巴县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610729','留坝县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610730','佛坪县','610700','0916','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610800','榆林市','610000','0912','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610802','榆阳区','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610821','神木县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610822','府谷县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610823','横山县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610824','靖边县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610825','定边县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610826','绥德县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610827','米脂县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610828','佳县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610829','吴堡县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610830','清涧县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610831','子洲县','610800','0912','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610900','安康市','610000','0915','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610902','汉滨区','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610921','汉阴县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610922','石泉县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610923','宁陕县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610924','紫阳县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610925','岚皋县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610926','平利县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610927','镇坪县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610928','旬阳县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('610929','白河县','610900','0915','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611000','商洛市','610000','0914','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611002','商州区','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611021','洛南县','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611022','丹凤县','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611023','商南县','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611024','山阳县','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611025','镇安县','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('611026','柞水县','611000','0914','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620000','甘肃省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620100','兰州市','620000','0931','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620102','城关区','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620103','七里河区','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620104','西固区','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620105','安宁区','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620111','红古区','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620121','永登县','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620122','皋兰县','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620123','榆中县','620100','0931','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620200','嘉峪关市','620000','0937','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620201','嘉峪关市','620200','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620300','金昌市','620000','0935','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620302','金川区','620300','0935','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620321','永昌县','620300','0935','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620400','白银市','620000','0943','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620402','白银区','620400','0943','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620403','平川区','620400','0943','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620421','靖远县','620400','0943','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620422','会宁县','620400','0943','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620423','景泰县','620400','0943','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620500','天水市','620000','0938','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620502','秦州区','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620503','麦积区','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620521','清水县','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620522','秦安县','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620523','甘谷县','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620524','武山县','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620525','张家川回族自治县','620500','0938','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620600','武威市','620000','0935','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620602','凉州区','620600','0935','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620621','民勤县','620600','0935','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620622','古浪县','620600','0935','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620623','天祝藏族自治县','620600','0935','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620700','张掖市','620000','0936','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620702','甘州区','620700','0936','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620721','肃南裕固族自治县','620700','0936','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620722','民乐县','620700','0936','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620723','临泽县','620700','0936','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620724','高台县','620700','0936','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620725','山丹县','620700','0936','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620800','平凉市','620000','0933','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620802','崆峒区','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620821','泾川县','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620822','灵台县','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620823','崇信县','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620824','华亭县','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620825','庄浪县','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620826','静宁县','620800','0933','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620900','酒泉市','620000','0937','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620902','肃州区','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620921','金塔县','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620922','瓜州县','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620923','肃北蒙古族自治县','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620924','阿克塞哈萨克族自治县','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620981','玉门市','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('620982','敦煌市','620900','0937','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621000','庆阳市','620000','0934','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621002','西峰区','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621021','庆城县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621022','环县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621023','华池县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621024','合水县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621025','正宁县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621026','宁县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621027','镇原县','621000','0934','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621100','定西市','620000','0932','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621102','安定区','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621121','通渭县','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621122','陇西县','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621123','渭源县','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621124','临洮县','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621125','漳县','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621126','岷县','621100','0932','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621200','陇南市','620000','0939','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621202','武都区','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621221','成县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621222','文县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621223','宕昌县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621224','康县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621225','西和县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621226','礼县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621227','徽县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('621228','两当县','621200','0939','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622900','临夏回族自治州','620000','0930','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622901','临夏市','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622921','临夏县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622922','康乐县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622923','永靖县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622924','广河县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622925','和政县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622926','东乡族自治县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('622927','积石山保安族东乡族撒拉族自治县','622900','0930','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623000','甘南藏族自治州','620000','0941','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623001','合作市','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623021','临潭县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623022','卓尼县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623023','舟曲县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623024','迭部县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623025','玛曲县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623026','碌曲县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('623027','夏河县','623000','0941','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630000','青海省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630100','西宁市','630000','0971','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630102','城东区','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630103','城中区','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630104','城西区','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630105','城北区','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630121','大通回族土族自治县','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630122','湟中县','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('630123','湟源县','630100','0971','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632100','海东地区','630000','0972','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632121','平安县','632100','0972','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632122','民和回族土族自治县','632100','0972','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632123','乐都县','632100','0972','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632126','互助土族自治县','632100','0972','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632127','化隆回族自治县','632100','0972','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632128','循化撒拉族自治县','632100','0972','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632200','海北藏族自治州','630000','0970','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632221','门源回族自治县','632200','0970','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632222','祁连县','632200','0970','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632223','海晏县','632200','0970','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632224','刚察县','632200','0970','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632300','黄南藏族自治州','630000','0973','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632321','同仁县','632300','0973','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632322','尖扎县','632300','0973','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632323','泽库县','632300','0973','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632324','河南蒙古族自治县','632300','0973','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632500','海南藏族自治州','630000','0974','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632521','共和县','632500','0974','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632522','同德县','632500','0974','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632523','贵德县','632500','0974','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632524','兴海县','632500','0974','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632525','贵南县','632500','0974','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632600','果洛藏族自治州','630000','0975','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632621','玛沁县','632600','0975','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632622','班玛县','632600','0975','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632623','甘德县','632600','0975','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632624','达日县','632600','0975','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632625','久治县','632600','0975','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632626','玛多县','632600','0975','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632700','玉树藏族自治州','630000','0976','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632721','玉树县','632700','0976','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632722','杂多县','632700','0976','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632723','称多县','632700','0976','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632724','治多县','632700','0976','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632725','囊谦县','632700','0976','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632726','曲麻莱县','632700','0976','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632800','海西蒙古族藏族自治州','630000','0977','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632801','格尔木市','632800','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632802','德令哈市','632800','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632821','乌兰县','632800','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632822','都兰县','632800','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('632823','天峻县','632800','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640000','宁夏回族自治区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640100','银川市','640000','0951','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640104','兴庆区','640100','0951','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640105','西夏区','640100','0951','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640106','金凤区','640100','0951','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640121','永宁县','640100','0951','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640122','贺兰县','640100','0951','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640181','灵武市','640100','0951','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640200','石嘴山市','640000','0952','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640202','大武口区','640200','0952','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640205','惠农区','640200','0952','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640221','平罗县','640200','0952','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640300','吴忠市','640000','0953','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640302','利通区','640300','0953','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640303','红寺堡区','640300','0953','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640323','盐池县','640300','0953','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640324','同心县','640300','0953','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640381','青铜峡市','640300','0953','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640400','固原市','640000','0954','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640402','原州区','640400','0954','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640422','西吉县','640400','0954','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640423','隆德县','640400','0954','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640424','泾源县','640400','0954','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640425','彭阳县','640400','0954','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640500','中卫市','640000','0977','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640502','沙坡头区','640500','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640521','中宁县','640500','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('640522','海原县','640500','0977','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650000','新疆维吾尔自治区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650100','乌鲁木齐市','650000','0991','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650102','天山区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650103','沙依巴克区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650104','新市区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650105','水磨沟区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650106','头屯河区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650107','达坂城区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650109','米东区','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650121','乌鲁木齐县','650100','0991','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650200','克拉玛依市','650000','0990','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650202','独山子区','650200','0992','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650203','克拉玛依区','650200','0990','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650204','白碱滩区','650200','0990','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('650205','乌尔禾区','650200','0990','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652100','吐鲁番地区','650000','0995','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652101','吐鲁番市','652100','0995','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652122','鄯善县','652100','0995','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652123','托克逊县','652100','0995','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652200','哈密地区','650000','0902','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652201','哈密市','652200','0902','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652222','巴里坤哈萨克自治县','652200','0902','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652223','伊吾县','652200','0902','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652300','昌吉回族自治州','650000','0994','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652301','昌吉市','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652302','阜康市','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652323','呼图壁县','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652324','玛纳斯县','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652325','奇台县','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652327','吉木萨尔县','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652328','木垒哈萨克自治县','652300','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652700','博尔塔拉蒙古自治州','650000','0909','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652701','博乐市','652700','0909','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652722','精河县','652700','0909','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652723','温泉县','652700','0909','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652800','巴音郭楞蒙古自治州','650000','0996','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652801','库尔勒市','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652822','轮台县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652823','尉犁县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652824','若羌县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652825','且末县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652826','焉耆回族自治县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652827','和静县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652828','和硕县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652829','博湖县','652800','0996','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652900','阿克苏地区','650000','0997','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652901','阿克苏市','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652922','温宿县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652923','库车县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652924','沙雅县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652925','新和县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652926','拜城县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652927','乌什县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652928','阿瓦提县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('652929','柯坪县','652900','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653000','克孜勒苏柯尔克孜自治州','650000','0908','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653001','阿图什市','653000','0908','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653022','阿克陶县','653000','0908','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653023','阿合奇县','653000','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653024','乌恰县','653000','0908','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653100','喀什地区','650000','0998','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653101','喀什市','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653121','疏附县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653122','疏勒县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653123','英吉沙县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653124','泽普县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653125','莎车县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653126','叶城县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653127','麦盖提县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653128','岳普湖县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653129','伽师县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653130','巴楚县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653131','塔什库尔干塔吉克自治县','653100','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653200','和田地区','650000','0903','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653201','和田市','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653221','和田县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653222','墨玉县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653223','皮山县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653224','洛浦县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653225','策勒县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653226','于田县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('653227','民丰县','653200','0903','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654000','伊犁哈萨克自治州','650000','0999','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654002','伊宁市','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654003','奎屯市','654000','0992','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654021','伊宁县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654022','察布查尔锡伯自治县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654023','霍城县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654024','巩留县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654025','新源县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654026','昭苏县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654027','特克斯县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654028','尼勒克县','654000','0999','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654200','塔城地区','650000','0901','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654201','塔城市','654200','0901','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654202','乌苏市','654200','0992','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654221','额敏县','654200','0901','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654223','沙湾县','654200','0993','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654224','托里县','654200','0901','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654225','裕民县','654200','0901','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654226','和布克赛尔蒙古自治县','654200','0990','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654300','阿勒泰地区','650000','0906','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654301','阿勒泰市','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654321','布尔津县','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654322','富蕴县','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654323','福海县','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654324','哈巴河县','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654325','青河县','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('654326','吉木乃县','654300','0906','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('659000','自治区直辖','650000','','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('659001','石河子市','659000','0993','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('659002','阿拉尔市','659000','0997','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('659003','图木舒克市','659000','0998','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('659004','五家渠市','659000','0994','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710000','台湾省','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710100','台北市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710101','中正区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710102','大同区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710103','中山区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710104','松山区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710105','大安区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710106','万华区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710107','信义区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710108','士林区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710109','北投区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710110','内湖区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710111','南港区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710112','文山区','710100','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710200','高雄市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710201','新兴区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710202','前金区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710203','芩雅区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710204','盐埕区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710205','鼓山区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710206','旗津区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710207','前镇区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710208','三民区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710209','左营区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710210','楠梓区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710211','小港区','710200','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710300','基隆市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710301','仁爱区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710302','信义区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710303','中正区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710304','中山区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710305','安乐区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710306','暖暖区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710307','七堵区','710300','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710400','台中市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710401','中区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710402','东区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710403','南区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710404','西区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710405','北区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710406','北屯区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710407','西屯区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710408','南屯区','710400','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710500','台南市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710501','中西区','710500','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710502','东区','710500','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710503','南区','710500','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710504','北区','710500','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710505','安平区','710500','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710506','安南区','710500','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710600','新竹市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710601','东区','710600','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710602','北区','710600','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710603','香山区','710600','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710700','嘉义市','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710701','东区','710700','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('710702','西区','710700','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719000','省直辖','710000','00886','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719001','台北县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719002','宜兰县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719003','新竹县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719004','桃园县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719005','苗栗县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719006','台中县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719007','彰化县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719008','南投县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719009','嘉义县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719010','云林县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719011','台南县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719012','高雄县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719013','屏东县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719014','台东县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719015','花莲县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('719016','澎湖县','719000','00886','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810000','香港特别行政区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810100','香港岛','810000','00852','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810101','中西区','810100','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810102','湾仔区','810100','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810103','东区','810100','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810104','南区','810100','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810200','九龙','810000','00852','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810201','油尖旺区','810200','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810202','深水埗区','810200','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810203','九龙城区','810200','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810204','黄大仙区','810200','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810205','观塘区','810200','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810300','新界','810000','00852','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810301','北区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810302','大埔区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810303','沙田区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810304','西贡区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810305','荃湾区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810306','屯门区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810307','元朗区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810308','葵青区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('810309','离岛区','810300','00852','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820000','澳门特别行政区','0','','1','省');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820100','澳门半岛','820000','00853','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820101','花地玛堂区','820100','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820102','圣安多尼堂区','820100','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820103','大堂区','820100','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820104','望德堂区','820100','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820105','风顺堂区','820100','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820200','澳门离岛','820000','00853','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820201','嘉模堂区','820200','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820202','圣方济各堂区','820200','00853','3','区');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820300','无堂区划分区域','820000','00853','2','市');
INSERT INTO t_org_region(REGION_CODE,NAME,PARENT_CODE,REGION_NUMBER,LEVEL,REGION_TYPE) values('820301','路氹城','820300','00853','3','区');

