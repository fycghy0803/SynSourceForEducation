drop table if exists T_LOG_USER_ACTION;

drop table if exists T_LOG_RECOMMEND_PAPER;
drop table if exists T_LOG_RECOMMEND_QST;

drop table if exists T_LOG_TEST_ASSIGN_DETAIL_QST;
drop table if exists T_LOG_TEST_ASSIGN_DETAIL_USER;
drop table if exists T_LOG_TEST_ASSIGN;
drop table if exists T_LOG_TEST_RESULT;
drop table if exists T_LOG_SYNC_SCHOOL_DATA;

drop table if exists T_RES_QST_MATHML_IMG;
drop table if exists T_RES_QST_IMAGE;
drop table if exists T_RES_QST_ERROR;
drop table if exists T_RES_ORIGINAL_ATTR;
drop table if exists T_USER_QST_COLLECT;

drop table if exists T_RES_PAPER_CUSTOM;
drop table if exists T_RES_PAPER;
drop table if exists T_RES_QUESTION;

drop table if exists T_RES_PAPER_ATTR;
drop table if exists T_RES_PAPER_REL_TEACH;
drop table if exists T_RES_QST_REL_KEY;
drop table if exists T_RES_QST_REL_TEACH;

drop table if exists T_SYS_USER_STUDENT;
drop table if exists T_SYS_USER_TEACHER_REL;
drop table if exists T_SYS_USER;

drop table if exists T_ORG_SCHOOL_CLASS;
drop table if exists T_ORG_SCHOOL;
drop table if exists T_ORG_REGION;

drop table if exists T_CDE_GRADE;
drop table if exists T_CDE_RES_ORIGINAL_ATTR_TYPE;
drop table if exists T_CDE_SUBJECT;
drop table if exists T_CDE_USER_ACTION;



/*==============================================================*/
/* Table: T_CDE_GRADE                                           */
/*==============================================================*/
create table T_CDE_GRADE
(
   GRADE_ID             smallint not null comment '年级ID',
   GRADE_NAME           varchar(20) not null comment '年级名称',
   GRADE_LEVEL          smallint comment '学段 (0:初中; 1:高中; 2:小学;)',
   primary key (GRADE_ID)
);

alter table T_CDE_GRADE comment '年级编码表';

/*==============================================================*/
/* Table: T_CDE_RES_ORIGINAL_ATTR_TYPE                          */
/*==============================================================*/
create table T_CDE_RES_ORIGINAL_ATTR_TYPE
(
   ATTR_TYPE_ID         int not null comment '类型编码ID',
   ATTR_TYPE_NAME       varchar(255) not null comment '类型编码名称',
   ORDER_NUM            int comment '排序号',
   primary key (ATTR_TYPE_ID)
);

alter table T_CDE_RES_ORIGINAL_ATTR_TYPE comment '资源原始属性分类编码表';

/*==============================================================*/
/* Table: T_CDE_SUBJECT                                         */
/*==============================================================*/
create table T_CDE_SUBJECT
(
   SUBJECT_ID           int not null comment '学科ID',
   SUBJECT_NAME         varchar(20) not null comment '学科名称 (如:初中英语)',
   SUBJECT_SHORT_NAME   varchar(20) comment '学科短名称 (如:英语)',
   GRADE_LEVEL          smallint comment '学段 (0:初中; 1:高中; 2:小学;)',
   primary key (SUBJECT_ID)
);

alter table T_CDE_SUBJECT comment '学科编码表';

/*==============================================================*/
/* Table: T_CDE_USER_ACTION                                     */
/*==============================================================*/
create table T_CDE_USER_ACTION
(
   ACTION_ID            int not null comment '操作ID',
   ACTION_NAME          varchar(100) not null comment '操作名称',
   primary key (ACTION_ID)
);

alter table T_CDE_USER_ACTION comment '用户操作编码表';

/*==============================================================*/
/* Table: T_LOG_RECOMMEND_PAPER                                 */
/*==============================================================*/
create table T_LOG_RECOMMEND_PAPER
(
   PAPER_RCMD_ID        int not null auto_increment comment '试卷推荐ID',
   USER_ID              int not null comment '用户ID',
   PAPER_ID             int comment '试卷ID',
   BE_VALID             numeric(1,0) not null default 1 comment '是否有效 (0:已失效; 1:有效;)',
   BE_HANDLED           numeric(1,0) not null default 0 comment '是否已处理 (0:未处理; 1:已处理;)',
   SHOW_TIMES           numeric(3,0) comment '已显示次数',
   CREATE_TIME          datetime comment '创建时间',
   LASTSHOW_TIME        datetime comment '最后显示时间',
   primary key (PAPER_RCMD_ID)
)
auto_increment = 1;

alter table T_LOG_RECOMMEND_PAPER comment '试卷推荐表';

/*==============================================================*/
/* Table: T_LOG_RECOMMEND_QST                                   */
/*==============================================================*/
create table T_LOG_RECOMMEND_QST
(
   QST_RCMD_ID          int not null auto_increment comment '试题推荐ID',
   USER_ID              int not null comment '用户ID',
   QST_ID               int not null comment '试题ID',
   BE_VALID             numeric(1,0) not null default 1 comment '是否有效 (0:已失效; 1:有效;)',
   BE_HANDLED           numeric(1,0) not null default 0 comment '是否已处理 (0:未处理; 1:已处理;)',
   SHOW_TIMES           numeric(3,0) comment '已显示次数',
   CREATE_TIME          datetime comment '创建时间',
   LASTSHOW_TIME        datetime comment '最后显示时间',
   primary key (QST_RCMD_ID)
)
auto_increment = 1;

alter table T_LOG_RECOMMEND_QST comment '推荐试题表';

/*==============================================================*/
/* Table: T_LOG_SYNC_SCHOOL_DATA                                */
/*==============================================================*/
create table T_LOG_SYNC_SCHOOL_DATA
(
   LOG_ID               int not null auto_increment comment '日志ID',
   SCHOOL_ID            int not null comment '学校ID',
   SYNC_TIME            datetime comment '同步时间 (与云端的数据同步)',
   START_TIME           datetime comment '开始时间',
   END_TIME             datetime comment '结束时间',
   SYNC_STATUS          numeric(1,0) default 0 comment '同步状态 (0:正在进行; 1:成功: 2:失败;)',
   NUM_NEW_PAPER        int comment '新增的试卷数量',
   NUM_NEW_QST          int comment '新增的试题数量',
   NUM_UPD_PAPER        int comment '更新的试卷数量',
   NUM_UPD_QST          int comment '更新的试题数量',
   primary key (LOG_ID)
)
auto_increment = 1;

alter table T_LOG_SYNC_SCHOOL_DATA comment '学校数据同步日志表';

/*==============================================================*/
/* Table: T_LOG_TEST_ASSIGN                                     */
/*==============================================================*/
create table T_LOG_TEST_ASSIGN
(
   ASSIGN_ID            int not null auto_increment comment '布置ID',
   USER_ID              int not null comment '用户ID (布置者的用户ID)',
   PAPER_TYPE           smallint not null default 1 comment '试卷类型 (1:试卷; 2:自定义试卷;)',
   PAPER_ID             int comment '试卷ID',
   CSTM_PAPER_ID        int comment '自定义试卷ID',
   START_TIME           datetime comment '作业开始时间',
   END_TIME             datetime comment '作业结束时间',
   ASSIGN_STATUS        numeric(1,0) not null default 0 comment '发布状态 (0:未发布; 1:已发布;)',
   PAPER_SCORE          int comment '试卷满分',
   PAPER_QST_COUNT      int comment '试题数量',
   NUM_ASSIGNED         int comment '布置人数',
   NUM_DONE             int comment '已做人数',
   RATE_MAX             numeric(6,2) comment '最高正确率 (0.00~100.00)',
   RATE_MIN             numeric(6,2) comment '最低正确率 (0.00~100.00)',
   RATE_AVG             numeric(6,2) comment '平均正确率 (0.00~100.00)',
   SCORE_MAX            numeric(6,2) comment '最高分',
   SCORE_MIN            numeric(6,2) comment '最低分',
   SCORE_AVG            numeric(6,2) comment '平均分',
   CREATE_TIME          datetime comment '创建时间',
   STATISTIC_TIME       datetime comment '最后统计时间',
   primary key (ASSIGN_ID)
)
auto_increment = 1;

alter table T_LOG_TEST_ASSIGN comment '测试(作业)布置记录表';

/*==============================================================*/
/* Table: T_LOG_TEST_ASSIGN_DETAIL_QST                          */
/*==============================================================*/
create table T_LOG_TEST_ASSIGN_DETAIL_QST
(
   ASSIGN_DQ_ID         int not null auto_increment comment '布置题目详情ID',
   ASSIGN_ID            int not null comment '布置ID',
   QST_ORDER            int not null comment '试题序号',
   QST_ID               int not null comment '试题ID',
   CORRECT_RATE         numeric(6,2) comment '正确率',
   CREATE_TIME          datetime comment '创建时间',
   STATISTIC_TIME       datetime comment '最后统计时间',
   primary key (ASSIGN_DQ_ID)
)
auto_increment = 1;

alter table T_LOG_TEST_ASSIGN_DETAIL_QST comment '测试(作业)布置题目详情表';

/*==============================================================*/
/* Table: T_LOG_TEST_ASSIGN_DETAIL_USER                         */
/*==============================================================*/
create table T_LOG_TEST_ASSIGN_DETAIL_USER
(
   ASSIGN_DU_ID         int not null auto_increment comment '布置学生详情ID',
   ASSIGN_ID            int not null comment '布置ID',
   USER_ID              int not null comment '用户ID (布置对象的用户ID)',
   ANSWER_SCORE         int comment '答题得分',
   RANKING_NUM          int comment '排名 (没做的为NULL，排序时放到最后)',
   CORRECT_RATE         numeric(6,2) comment '正确率',
   ANSWER_TIME          int comment '答题用时 (单位:秒)',
   START_TIME           datetime comment '开考时间',
   END_TIME             datetime comment '交卷时间',
   RIGHT_NUM            varchar(500) comment '答对题号 (只记客观题，以,分隔)',
   WRONG_NUM            varchar(500) comment '答错题号 (只记客观题，以,分隔)',
   CREATE_TIME          datetime comment '创建时间',
   STATISTIC_TIME       datetime comment '最后统计时间',
   primary key (ASSIGN_DU_ID)
)
auto_increment = 1;

alter table T_LOG_TEST_ASSIGN_DETAIL_USER comment '测试(作业)布置学生详情表';

/*==============================================================*/
/* Table: T_LOG_TEST_RESULT                                     */
/*==============================================================*/
create table T_LOG_TEST_RESULT
(
   RESULT_ID            int not null auto_increment comment '测试结果ID',
   USER_ID              int not null comment '用户ID',
   ASSIGN_ID            int comment '布置ID (表T_LOG_TEST_ASSIGN)',
   PAPER_TYPE           smallint not null default 1 comment '试卷类型 (1:试卷; 2:自定义试卷;)',
   PAPER_ID             int comment '试卷ID (表T_LOG_TEST_ASSIGN)',
   CSTM_PAPER_ID        int comment '自定义试卷ID',
   PAPER_SCORE          int comment '试卷满分',
   PAPER_QST_COUNT      int comment '试题数量',
   ANSWER_INFO          text comment '试卷答题信息',
   ANSWER_SCORE         int comment '答题得分',
   CORRECT_RATE         numeric(6,2) comment '正确率',
   ANSWER_TIME          int comment '答题用时 (单位:秒)',
   START_TIME           datetime comment '开考时间',
   END_TIME             datetime comment '交卷时间',
   RIGHT_NUM            varchar(500) comment '答对题号 (只记客观题，以,分隔)',
   WRONG_NUM            varchar(500) comment '答错题号 (只记客观题，以,分隔)',
   CREATE_TIME          datetime comment '创建时间',
   primary key (RESULT_ID)
)
auto_increment = 1;

alter table T_LOG_TEST_RESULT comment '测试结果表';

/*==============================================================*/
/* Table: T_LOG_USER_ACTION                                     */
/*==============================================================*/
create table T_LOG_USER_ACTION
(
   LOG_ID               int not null auto_increment comment '日志ID',
   USER_ID              int not null comment '用户ID',
   ACTION_ID            int not null comment '操作ID',
   DETAIL_INFO          varchar(200) comment '详细信息',
   CREATE_TIME          datetime comment '创建时间',
   primary key (LOG_ID)
)
auto_increment = 1;

alter table T_LOG_USER_ACTION comment '用户操作日志表';

/*==============================================================*/
/* Table: T_ORG_REGION                                          */
/*==============================================================*/
create table T_ORG_REGION
(
   REGION_CODE          int not null comment '行政代号',
   NAME                 varchar(50) not null comment '区划名称',
   PARENT_CODE          int not null default 0 comment '上级行政代号（0-顶级区划）',
   REGION_NUMBER        varchar(5) comment '区号',
   LEVEL                numeric(1,0) not null comment '行政等级',
   REGION_TYPE          varchar(4) comment '区域类别（省、市、区）',
   primary key (REGION_CODE)
);

alter table T_ORG_REGION comment '县区行政区划';

/*==============================================================*/
/* Table: T_ORG_SCHOOL                                          */
/*==============================================================*/
create table T_ORG_SCHOOL
(
   SCHOOL_ID            int not null comment '学校ID',
   REGION_CODE          int not null comment '行政代号',
   SCHOOL_NAME          varchar(200) comment '学校名称',
   SYNC_TIME            datetime comment '最后成功同步时间 (与云端的数据同步)',
   CREATE_TIME          datetime comment '创建时间',
   primary key (SCHOOL_ID)
);

alter table T_ORG_SCHOOL comment '学校表';

/*==============================================================*/
/* Table: T_ORG_SCHOOL_CLASS                                    */
/*==============================================================*/
create table T_ORG_SCHOOL_CLASS
(
   CLASS_ID             int not null auto_increment comment '班级ID',
   SCHOOL_ID            int not null comment '学校ID',
   GRADE_ID             smallint not null comment '年级ID',
   CLASS_NAME           varchar(100) comment '班级名称',
   CREATE_TIME          datetime comment '创建时间',
   primary key (CLASS_ID)
)
auto_increment = 100000;

alter table T_ORG_SCHOOL_CLASS comment '学校班级表';

/*==============================================================*/
/* Table: T_RES_ORIGINAL_ATTR                                   */
/*==============================================================*/
create table T_RES_ORIGINAL_ATTR
(
   ATTR_ID              int not null comment '属性ID',
   ATTR_TYPE_ID         int comment '类型编码ID',
   PARENT_ID            int not null default 0 comment '上级ID',
   CHILD_COUNT          smallint not null default 0 comment '子级属性个数',
   ATTR_NAME            varchar(255) comment '属性名称',
   ATTR_LEVEL           smallint not null default 2 comment '属性级别 (1开始)',
   ATTR_CASCADE_ID      varchar(100) comment '属性级联ID',
   ATTR_CASCADE_NAME    varchar(1024) comment '属性级联名称',
   ORDER_NUM            int comment '排序号',
   DEL_STATUS           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   MODIFY_TIME          datetime comment '最后修改时间',
   primary key (ATTR_ID)
);

alter table T_RES_ORIGINAL_ATTR comment '资源原始属性表';

/*==============================================================*/
/* Table: T_RES_PAPER                                           */
/*==============================================================*/
create table T_RES_PAPER
(
   PAPER_ID             int not null comment '试卷ID',
   PAPER_NAME           varchar(255) not null comment '试卷名称',
   PAPER_SCORE          int comment '试卷满分',
   PAPER_ANSWERTIME     int comment '考试时长 (单位:分钟)',
   PAPER_PRICE          numeric(8,2) comment '试卷价格',
   PAPER_YEAR           varchar(30) comment '试卷年份',
   PAPER_QUALITY        numeric(1,0) not null default 0 comment '试卷推荐等级 (0:默认等级; 1-5:推荐等级)',
   PAPER_QST_COUNT      int comment '试题数量',
   ATTR_SUBJECT_ID      int comment '属性-学科ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   ATTR_GRADE_ID        int comment '属性-年级ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   ATTR_EDITION_ID      int comment '属性-教材版本ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   ATTR_PROVINCE_ID     int comment '属性-省份ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   ATTR_PAPERKIND_ID    int comment '属性-试卷种类ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   ATTR_SOURCE_ID       int comment '属性-试卷来源ID (参照T_RES_PAPER_ATTR.ATTR_ID)',
   PAPER_ID_FZ          int not null default 0 comment '原试卷ID (方正)',
   PAPER_CONTENT        text comment '试卷内容',
   FZ_DOC_ID            int comment 'FZ_DOC_ID (试题与试卷关联)',
   FZ_PAPER_SCORE       numeric(8,2) comment 'FZ_PAPER_SCORE',
   FZ_PAPER_ANSWERTIME  int comment 'FZ_PAPER_ANSWERTIME',
   FZ_PAPER_SCOPEID     int comment 'FZ_PAPER_SCOPEID',
   FZ_PAPER_SCOPE       varchar(100) comment 'FZ_PAPER_SCOPE',
   FZ_PAPER_SUBJECTID   int comment 'FZ_PAPER_SUBJECTID',
   FZ_PAPER_SUBJECT     varchar(100) comment 'FZ_PAPER_SUBJECT',
   FZ_PAPER_TYPE        int comment 'FZ_PAPER_TYPE',
   FZ_QST_COUNT         int comment 'FZ_QST_COUNT',
   FZ_DOC_PRODUCTLIBID  int comment 'FZ_DOC_PRODUCTLIBID',
   FZ_DOC_PRODUCTID     int comment 'FZ_DOC_PRODUCTID',
   FZ_DOC_PRODUCT       varchar(255) comment 'FZ_DOC_PRODUCT',
   FZ_PAPER_SOURCE      varchar(200) comment 'FZ_PAPER_SOURCE',
   FZ_PAPER_AREA        varchar(50) comment 'FZ_PAPER_AREA',
   FZ_PAPER_AREAID      int comment 'FZ_PAPER_AREAID',
   FZ_PAPER_KIND        varchar(50) comment 'FZ_PAPER_KIND',
   FZ_PAPER_KINDID      int comment 'FZ_PAPER_KINDID',
   FZ_PAPER_GRADE       varchar(50) comment 'FZ_PAPER_GRADE',
   FZ_PAPER_GRADEID     int comment 'FZ_PAPER_GRADEID',
   FZ_PAPER_YEAR        varchar(50) comment 'FZ_PAPER_YEAR',
   FZ_PAPER_YEARID      int comment 'FZ_PAPER_YEARID',
   DEL_STATUS           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   CREATE_TIME          datetime not null comment '创建时间',
   MODIFY_TIME          datetime not null comment '最后修改时间',
   RELEASE_TIME         datetime not null comment '发布时间 (初始与最后修改时间相同)',
   primary key (PAPER_ID)
);

alter table T_RES_PAPER comment '试卷';

/*==============================================================*/
/* Table: T_RES_PAPER_ATTR                                      */
/*==============================================================*/
create table T_RES_PAPER_ATTR
(
   ATTR_ID              int not null comment '属性ID',
   PARENT_ID            int not null comment '上级ID',
   ATTR_LEVEL           smallint not null comment '属性级别 (1开始)',
   ATTR_NAME            varchar(50) comment '属性名称',
   ATTR_TYPE_TAB        varchar(50) comment '属性类别标签',
   GRADE_LEVEL          smallint comment '学段 (0:初中; 1:高中; 2:小学;)',
   primary key (ATTR_ID)
);

alter table T_RES_PAPER_ATTR comment '试卷属性表';

/*==============================================================*/
/* Table: T_RES_PAPER_CUSTOM                                    */
/*==============================================================*/
create table T_RES_PAPER_CUSTOM
(
   CSTM_PAPER_ID        int not null auto_increment comment '自定义试卷ID',
   PAPER_NAME           varchar(255) not null comment '试卷名称',
   USER_ID              int not null comment '用户ID (组卷用户ID)',
   PAPER_CONTENT_ARRAY  text comment '题卷内容数组',
   ATTR_SUBJECT_ID      int comment '属性-学科ID',
   ATTR_GRADE_ID        int comment '属性-年级ID',
   ATTR_EDITION_ID      int comment '属性-教材版本ID',
   CREATE_TIME          datetime not null comment '创建时间',
   primary key (CSTM_PAPER_ID)
)
auto_increment = 1;

alter table T_RES_PAPER_CUSTOM comment '自定义试卷';

/*==============================================================*/
/* Table: T_RES_PAPER_REL_TEACH                                 */
/*==============================================================*/
create table T_RES_PAPER_REL_TEACH
(
   PAPER_ID             int not null comment '试卷ID (表T_RES_PAPER)',
   PAPER_TEACH_ID       int comment '试卷教材目录ID',
   PAPER_KEY_ID         int comment '试卷知识点ID',
   CLASS_1              int comment '级联1',
   CLASS_2              int comment '级联2',
   CLASS_3              int comment '级联3',
   CLASS_4              int comment '级联4',
   CLASS_5              int comment '级联5',
   CLASS_6              int comment '级联6',
   CLASS_7              int comment '级联7',
   CLASS_8              int comment '级联8',
   CLASS_9              int comment '级联9',
   CLASS_10             int comment '级联10',
   PAPER_TEACH_CASCADEID varchar(200) comment '试卷教材目录级联ID',
   PAPER_KEY_CASCADEID  varchar(400) comment '试卷知识点级联ID',
   CREATE_TIME          datetime comment '创建时间',
   MODIFY_TIME          datetime comment '最后修改时间',
   primary key (PAPER_ID)
);

alter table T_RES_PAPER_REL_TEACH comment '试卷教材体系关系表';

/*==============================================================*/
/* Table: T_RES_QST_ERROR                                       */
/*==============================================================*/
create table T_RES_QST_ERROR
(
   QST_ERROR_ID         int not null auto_increment comment '试题纠错ID',
   USER_ID              int not null comment '用户ID (参照T_SYS_USER.USER_ID)',
   QST_ID               int not null comment '试题ID',
   ERROR_TYPE           varchar(50) not null default '0' comment '错误类型 (json格式:{t1:1;t2:0,t3:1,t4:1}) (t1:排版有误; t2:试题有误; t3:答案有误; t4:解析有误;)',
   ERROR_STATUS         numeric(1,0) not null default 0 comment '错误状态 (0:未处理; 1:有效的纠错; 2:无效的纠错;)',
   ERROR_INFO           varchar(500) not null comment '纠错信息',
   REPLAY_INFO          varchar(500) comment '回复信息',
   ADD_TIME             datetime not null comment '添加时间',
   REPLAY_TIME          datetime comment '回复时间',
   primary key (QST_ERROR_ID)
)
auto_increment = 1;

alter table T_RES_QST_ERROR comment '试题纠错表';

/*==============================================================*/
/* Table: T_RES_QST_IMAGE                                       */
/*==============================================================*/
create table T_RES_QST_IMAGE
(
   IMAGE_ID             varchar(50) not null comment '公式图UUID',
   QST_ID               int not null comment '试题ID',
   IMG_LARGE_PATH       varchar(500) comment '大尺寸图片路径',
   IMG_HEIGHT           int comment '图片高度',
   IMG_WIDTH            int comment '图片宽度',
   IMG_FORMAT           varchar(6) comment '图片格式',
   CREATE_TIME          datetime not null comment '创建时间',
   primary key (IMAGE_ID)
);

alter table T_RES_QST_IMAGE comment '试题图片表';

/*==============================================================*/
/* Table: T_RES_QST_MATHML_IMG                                  */
/*==============================================================*/
create table T_RES_QST_MATHML_IMG
(
   MMLIMG_UUID          varchar(50) not null comment '公式图UUID',
   QST_ID               int not null comment '试题ID',
   FILE_PATH            varchar(255) comment '文件路径',
   CREATE_TIME          datetime not null comment '创建时间',
   primary key (MMLIMG_UUID)
);

alter table T_RES_QST_MATHML_IMG comment '试题公式图片表';

/*==============================================================*/
/* Table: T_RES_QST_REL_KEY                                     */
/*==============================================================*/
create table T_RES_QST_REL_KEY
(
   QST_ID               int not null comment '试题ID',
   QST_SUBJECT          varchar(100) comment '试题学科',
   QST_SUBJECTID        int comment '试题学科ID',
   QST_TEACHID          int comment '试题教材目录ID',
   QST_KEYID            varchar(100) comment '试题知识点ID',
   QST_DIFICULTYID      int comment '试题难度ID',
   QST_TYPEID           int comment '试题类型ID',
   QST_LEVELID          int comment '试题等级ID',
   QST_QUALITYID        int comment '试题质量等级ID',
   CLASS_1              int comment '级联1',
   CLASS_2              int comment '级联2',
   CLASS_3              int comment '级联3',
   CLASS_4              int comment '级联4',
   CLASS_5              int comment '级联5',
   CLASS_6              int comment '级联6',
   CLASS_7              int comment '级联7',
   CLASS_8              int comment '级联8',
   CLASS_9              int comment '级联9',
   CLASS_10             int comment '级联10',
   QST_TEACH_CASCADEID  varchar(200) comment '试题教材目录级联ID',
   QST_KEY_CASCADEID    varchar(400) comment '试题知识点级联ID',
   QST_YAER             varchar(30) comment '试题年份',
   GRADE                varchar(100) comment '年级名',
   GRADEID              int comment '年级ID',
   QST_MODEL            varchar(100) comment '模块名',
   QST_MODELID          int comment '模块ID',
   QST_UNIT             varchar(100) comment '单元名',
   QST_UNITID           int comment '单元ID',
   DEL_STATUS           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   CREATE_TIME          datetime comment '创建时间',
   MODIFY_TIME          datetime comment '最后修改时间'
);

alter table T_RES_QST_REL_KEY comment '试题知识点关系表';

/*==============================================================*/
/* Index: QST_ID                                                */
/*==============================================================*/
create index QST_ID on T_RES_QST_REL_KEY
(
   QST_ID
);

/*==============================================================*/
/* Table: T_RES_QST_REL_TEACH                                   */
/*==============================================================*/
create table T_RES_QST_REL_TEACH
(
   QST_ID               int not null comment '试题ID',
   QST_SUBJECT          varchar(100) comment '试题学科',
   QST_SUBJECTID        int comment '试题学科ID',
   QST_TEACHID          int comment '试题教材目录ID',
   QST_KEYID            varchar(100) comment '试题知识点ID',
   QST_DIFICULTYID      int comment '试题难度ID',
   QST_TYPEID           int comment '试题类型ID',
   QST_LEVELID          int comment '试题等级ID',
   QST_QUALITYID        int comment '试题质量等级ID',
   CLASS_1              int comment '级联1',
   CLASS_2              int comment '级联2',
   CLASS_3              int comment '级联3',
   CLASS_4              int comment '级联4',
   CLASS_5              int comment '级联5',
   CLASS_6              int comment '级联6',
   CLASS_7              int comment '级联7',
   CLASS_8              int comment '级联8',
   CLASS_9              int comment '级联9',
   CLASS_10             int comment '级联10',
   QST_TEACH_CASCADEID  varchar(200) comment '试题教材目录级联ID',
   QST_KEY_CASCADEID    varchar(400) comment '试题知识点级联ID',
   GRADE                varchar(100) comment '年级名',
   GRADEID              int comment '年级ID',
   DEL_STATUS           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   CREATE_TIME          datetime comment '创建时间',
   MODIFY_TIME          datetime comment '最后修改时间'
);

alter table T_RES_QST_REL_TEACH comment '试题教材体系关系表';

/*==============================================================*/
/* Index: QST_ID                                                */
/*==============================================================*/
create index QST_ID on T_RES_QST_REL_TEACH
(
   QST_ID
);

/*==============================================================*/
/* Table: T_RES_QUESTION                                        */
/*==============================================================*/
create table T_RES_QUESTION
(
   QST_ID               int not null comment '试题ID',
   QST_CONTENT          text comment '试题内容',
   QST_TEXT             text comment '试题文本内容',
   QST_TITLE            text comment '试题题目部分',
   QST_RESULT           text comment '试题答案部分',
   QST_ANALYSIS         text comment '试题解析部分',
   QST_QUALITYID        int comment '试题质量等级ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   QST_DIFICULTYID      int comment '试题难度ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   QST_TYPEID           int comment '试题题型ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   QST_YAER             varchar(30) comment '试题年份',
   QST_SUBJECT_ID       int comment '试题学科ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   QST_TEACH_ID         int comment '试题教材目录ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   QST_TEACH_CASCADEID  varchar(200) comment '试题教材目录级联ID',
   QST_KEYID            varchar(100) comment '试题知识点ID (参照T_RES_ORIGINAL_ATTR.ATTR_ID)',
   QST_KEY_CASCADEID    varchar(400) comment '试题知识点级联ID',
   FZ_DOC_ID            int comment 'FZ_DOC_ID (试题与试卷关联)',
   DEL_STATUS           numeric(1,0) not null default 0 comment '删除状态 (0:未删除; 1:已删除;)',
   CREATE_TIME          datetime not null comment '创建时间',
   MODIFY_TIME          datetime not null comment '最后修改时间',
   RELEASE_TIME         datetime not null comment '发布时间 (初始与最后修改时间相同)',
   primary key (QST_ID)
);

alter table T_RES_QUESTION comment '试题';

/*==============================================================*/
/* Table: T_SYS_USER                                            */
/*==============================================================*/
create table T_SYS_USER
(
   USER_ID              int not null auto_increment comment '用户ID (自增长，起始值100000)',
   USER_ACCOUNT         varchar(50) not null comment '用户帐号',
   USER_PASSWORD        varchar(40) not null comment '密码 (40位的加密密钥)',
   USER_TYPE            numeric(1,0) not null default 0 comment '用户类型 (0-系统; 1-教师; 2-学生;)',
   USER_STATUS          numeric(1,0) not null default 1 comment '用户状态 (0-未激活; 1-激活; 2-失效;)',
   SCHOOL_ID            int not null default 0 comment '学校ID (0:非学校用户;)',
   NICKNAME             varchar(40) comment '昵称',
   TRUENAME             varchar(40) comment '姓名',
   GENDER               numeric(1,0) comment '性别 (1:男; 2:女)',
   EMAIL                varchar(40) comment '邮箱',
   MOBILE               varchar(20) comment '手机号',
   QQ                   varchar(20) comment 'QQ号',
   WEIXIN               varchar(40) comment '微信号',
   CREATE_TIME          datetime comment '创建时间',
   primary key (USER_ID)
)
auto_increment = 100000;

alter table T_SYS_USER comment '用户表：用户ID（自增长，起始值100000）';

/*==============================================================*/
/* Table: T_SYS_USER_STUDENT                                    */
/*==============================================================*/
create table T_SYS_USER_STUDENT
(
   USER_ID              int not null comment '用户ID',
   CLASS_ID             int comment '班级ID',
   primary key (USER_ID)
);

alter table T_SYS_USER_STUDENT comment '学生表';

/*==============================================================*/
/* Table: T_SYS_USER_TEACHER_REL                                */
/*==============================================================*/
create table T_SYS_USER_TEACHER_REL
(
   TREL_ID              int not null auto_increment comment '教师关系ID',
   USER_ID              int not null comment '用户ID',
   CLASS_ID             int not null comment '班级ID',
   SUBJECT_ID           int comment '学科ID',
   primary key (TREL_ID)
)
auto_increment = 1;

alter table T_SYS_USER_TEACHER_REL comment '教师信息表';

/*==============================================================*/
/* Table: T_USER_QST_COLLECT                                    */
/*==============================================================*/
create table T_USER_QST_COLLECT
(
   QST_CLT_ID           int not null auto_increment comment '试题收藏ID',
   USER_ID              int not null comment '用户ID',
   QST_ID               int comment '试题ID',
   QST_SUBJECT_ID       int comment '试题学科ID',
   CLT_TYPE             smallint not null default 0 comment '收藏类型(0-自动错题; 1-手动收藏;)',
   ADD_TIME             datetime comment '添加时间',
   primary key (QST_CLT_ID),
   key AK_QST_SUBJECT_ID (QST_SUBJECT_ID)
)
auto_increment = 1;

alter table T_USER_QST_COLLECT comment '试题收藏，错题或个性收藏';

alter table T_LOG_RECOMMEND_PAPER add constraint FK_Relationship_28 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;

alter table T_LOG_RECOMMEND_PAPER add constraint FK_Relationship_29 foreign key (PAPER_ID)
      references T_RES_PAPER (PAPER_ID) on delete restrict on update restrict;

alter table T_LOG_RECOMMEND_QST add constraint FK_Relationship_26 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;

alter table T_LOG_RECOMMEND_QST add constraint FK_Relationship_27 foreign key (QST_ID)
      references T_RES_QUESTION (QST_ID) on delete restrict on update restrict;

alter table T_LOG_TEST_ASSIGN_DETAIL_QST add constraint FK_Relationship_36 foreign key (ASSIGN_ID)
      references T_LOG_TEST_ASSIGN (ASSIGN_ID) on delete restrict on update restrict;

alter table T_LOG_TEST_ASSIGN_DETAIL_USER add constraint FK_Relationship_35 foreign key (ASSIGN_ID)
      references T_LOG_TEST_ASSIGN (ASSIGN_ID) on delete restrict on update restrict;

alter table T_LOG_TEST_RESULT add constraint FK_Relationship_24 foreign key (PAPER_ID)
      references T_RES_PAPER (PAPER_ID) on delete restrict on update restrict;

alter table T_LOG_TEST_RESULT add constraint FK_Relationship_25 foreign key (CSTM_PAPER_ID)
      references T_RES_PAPER_CUSTOM (CSTM_PAPER_ID) on delete restrict on update restrict;

alter table T_LOG_TEST_RESULT add constraint FK_Relationship_9 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;

alter table T_LOG_USER_ACTION add constraint FK_Relationship_20 foreign key (ACTION_ID)
      references T_CDE_USER_ACTION (ACTION_ID) on delete restrict on update restrict;

alter table T_LOG_USER_ACTION add constraint FK_Relationship_21 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;

alter table T_ORG_SCHOOL add constraint FK_Relationship_3 foreign key (REGION_CODE)
      references T_ORG_REGION (REGION_CODE) on delete restrict on update restrict;

alter table T_ORG_SCHOOL_CLASS add constraint FK_Relationship_12 foreign key (SCHOOL_ID)
      references T_ORG_SCHOOL (SCHOOL_ID) on delete restrict on update restrict;

alter table T_ORG_SCHOOL_CLASS add constraint FK_Relationship_14 foreign key (GRADE_ID)
      references T_CDE_GRADE (GRADE_ID) on delete restrict on update restrict;

alter table T_RES_ORIGINAL_ATTR add constraint FK_Relationship_30 foreign key (ATTR_TYPE_ID)
      references T_CDE_RES_ORIGINAL_ATTR_TYPE (ATTR_TYPE_ID) on delete restrict on update restrict;

alter table T_RES_QST_ERROR add constraint FK_Relationship_31 foreign key (QST_ID)
      references T_RES_QUESTION (QST_ID) on delete restrict on update restrict;

alter table T_SYS_USER_STUDENT add constraint FK_Relationship_13 foreign key (CLASS_ID)
      references T_ORG_SCHOOL_CLASS (CLASS_ID) on delete restrict on update restrict;

alter table T_SYS_USER_STUDENT add constraint FK_Relationship_8 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;

alter table T_SYS_USER_TEACHER_REL add constraint FK_Relationship_32 foreign key (SUBJECT_ID)
      references T_CDE_SUBJECT (SUBJECT_ID) on delete restrict on update restrict;

alter table T_SYS_USER_TEACHER_REL add constraint FK_Relationship_33 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;

alter table T_SYS_USER_TEACHER_REL add constraint FK_Relationship_34 foreign key (CLASS_ID)
      references T_ORG_SCHOOL_CLASS (CLASS_ID) on delete restrict on update restrict;

alter table T_USER_QST_COLLECT add constraint FK_Relationship_11 foreign key (QST_ID)
      references T_RES_QUESTION (QST_ID) on delete restrict on update restrict;

alter table T_USER_QST_COLLECT add constraint FK_Relationship_6 foreign key (USER_ID)
      references T_SYS_USER (USER_ID) on delete restrict on update restrict;
