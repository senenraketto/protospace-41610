### usersテーブル
|        Column      |  Type  |   Options   |
|・・・・・・・・・・・・・・・・・・・・・・・ |
|       email        | string | ユニーク制約 |
| encrypted_password | string |  NOT NUll   |
|        name        | string |  NOT NULL   |
|      profile       |  text  |  NOT NULL   |
|     occupation     |  text  |  NOT NULL   |
|      position      |  text  |  NOT NULL   |

### Association

 - has_many :prototypes
 - has_many :comments


### prototypesテーブル

|   Column   |    TYPE    |      OPTION      |
|・・・・・・・・・・・・・・・・・・・・・・・・|
|   title    |   string   |     NOT NULL     |
| catch_copy |    text    |     NOT NULL     |
|   concept  |    text    |     NOT NULL     | 
|    user    | references | NOT NULL,外部キー |

### Association

 - belongs_to :users
 - belongs_to :comments


### commentsテーブル

|   Column  |    Type    |      option       |
|                                            |
|  content  |    text    |      NOT NULL     |
| prototype | references | NOT NULL, 外部キー |
|   user    | references | NOT NULL, 外部キー |

### Association

 - belongs_to :users
 - belongs_to :prototypes
