CREATE TABLE IF NOT EXISTS "errorTab" (
	"id"	INTEGER,
	"code"	varchar(10) NOT NULL,
	"created"	TEXT NOT NULL,
	"optional"	INTEGER NOT NULL,
	"priority"	INTEGER NOT NULL,
	"atFault"	INTEGER NOT NULL,
	"category"	INTEGER NOT NULL,
	"subsysIndex"	INTEGER NOT NULL,
	"compIndex"	INTEGER NOT NULL,
	"errorIndex"	INTEGER NOT NULL,
	"errorIndex2"	INTEGER NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "otp" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"user_otp"	INTEGER NOT NULL,
	"code"	VARCHAR(6) NOT NULL,
	"created"	TEXT NOT NULL,
	"isDeleted"	INTEGER,
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id"),
	FOREIGN KEY("user_otp") REFERENCES "userProfile"("otp"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "pieces" (
	"id"	INTEGER,
	"name"	VARCHAR(6) NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "settings" (
	"id"	INTEGER,
	"name"	varchar(10) NOT NULL,
	"description"	varchar(100),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "verify" (
	"id"	INTEGER,
	"email"	VARCHAR(100) NOT NULL,
	"username"	VARCHAR(20) NOT NULL,
	"created"	TEXT NOT NULL,
	"code"	VARCHAR(6) NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "userSettings" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"settings_id"	INTEGER NOT NULL,
	"value"	INTEGER NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id"),
	FOREIGN KEY("settings_id") REFERENCES "settings"("id")
);
CREATE TABLE IF NOT EXISTS "userProfile" (
	"id"	INTEGER,
	"email"	VARCHAR(100) NOT NULL,
	"username"	VARCHAR(20) NOT NULL,
	"created"	TEXT NOT NULL,
	"avatarLink"	VARCHAR(100),
	"firstName"	VARCHAR(30),
	"lastName"	VARCHAR(60),
	"note"	VARCHAR(100),
	"otp"	INTEGER NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "thread" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"created"	TEXT NOT NULL,
	"name"	VARCHAR(50) NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id")
);
CREATE TABLE IF NOT EXISTS "chatRoom" (
	"id"	INTEGER,
	"thread_id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	"joinedAt"	TEXT NOT NULL,
	"isMute"	INTEGER,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("thread_id") REFERENCES "thread"("id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id")
);
CREATE TABLE IF NOT EXISTS "status" (
	"id"	INTEGER,
	"name"	VARCHAR(8) NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "friendship" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"friend_id"	INTEGER NOT NULL,
	"status_id"	INTEGER NOT NULL,
	"created"	TEXT NOT NULL,
	"updated"	TEXT NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("friend_id") REFERENCES "userProfile"("id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id")
);
CREATE TABLE IF NOT EXISTS "blocklist" (
	"id"	INTEGER,
	"user_id"	INTEGER NOT NULL,
	"foe_id"	INTEGER NOT NULL,
	"status_id"	INTEGER NOT NULL,
	"created"	TEXT NOT NULL,
	"updated"	TEXT NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id"),
	FOREIGN KEY("foe_id") REFERENCES "userProfile"("id")
);
CREATE TABLE IF NOT EXISTS "message" (
	"id"	INTEGER,
	"thread_id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	"content"	VARCHAR(300) NOT NULL,
	"created"	TEXT NOT NULL,
	"isDeleted"	INTEGER,
	PRIMARY KEY("id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id"),
	FOREIGN KEY("thread_id") REFERENCES "thread"("id")
);
CREATE TABLE IF NOT EXISTS "roles" (
	"user_id"	INTEGER NOT NULL,
	"pieces_id"	INTEGER NOT NULL,
	FOREIGN KEY("pieces_id") REFERENCES "pieces"("id"),
	PRIMARY KEY("user_id"),
	FOREIGN KEY("user_id") REFERENCES "userProfile"("id")
);
