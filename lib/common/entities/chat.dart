class SyncMessageRequestEntity {
  int? msgid;
  SyncMessageRequestEntity({
    this.msgid,
  });

  Map<String, dynamic> toJson() => {
        "msgid": msgid,
      };
}

class CallRequestEntity {
  String? callType; //1. voice 2. video
  String? toToken;
  String? toName;
  String? toAvatar;
  String? docID;

  CallRequestEntity({
    this.callType,
    this.toToken,
    this.toName,
    this.toAvatar,
    this.docID,
  });

  Map<String, dynamic> toJson() => {
        "callType": callType,
        "toToken": toToken,
        "toName": toName,
        "toAvatar": toAvatar,
        "docID": docID,
      };
}

class CallTokenRequestEntity {
  String? call_token;
  String? toToken;

  CallTokenRequestEntity({
    this.call_token,
    this.toToken,
  });

  Map<String, dynamic> toJson() => {
        "call_token": call_token,
        "toToken": toToken,
      };
}

class ChatRequestEntity {
  String? content;
  String? type;
  String? toToken;

  ChatRequestEntity({
    this.content,
    this.type,
    this.toToken,
  });

  Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "toToken": toToken,
      };
}

class Chat {
  String? from_token;
  String? toToken;
  int? msgid;
  String? content;
  String? type;
  int? status;
  String? created_at;

  Chat({
    this.from_token,
    this.toToken,
    this.msgid,
    this.content,
    this.type,
    this.status,
    this.created_at,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        from_token: json["from_token"],
        toToken: json["toToken"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        created_at: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "from_token": from_token,
        "toToken": toToken,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "created_at": created_at,
      };
}

class MsgListcontent {
  int? msgid;
  String? from_token;
  String? from_name;
  String? from_avatar;
  String? toToken;
  String? content;
  String? type;
  int? status;
  String? created_at;

  MsgListcontent({
    this.msgid,
    this.from_token,
    this.from_name,
    this.from_avatar,
    this.toToken,
    this.content,
    this.type,
    this.status,
    this.created_at,
  });

  factory MsgListcontent.fromJson(Map<String, dynamic> json) => MsgListcontent(
        from_token: json["from_token"],
        from_avatar: json["from_avatar"],
        from_name: json["from_name"],
        toToken: json["toToken"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        created_at: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "from_token": from_token,
        "from_name": from_name,
        "from_avatar": from_avatar,
        "toToken": toToken,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "created_at": created_at,
      };
}

class SyncMessageResponseEntity {
  int? code;
  String? msg;
  List<MsgListcontent>? data;

  SyncMessageResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory SyncMessageResponseEntity.fromJson(Map<String, dynamic> json) =>
      SyncMessageResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<MsgListcontent>.from(
                json["data"].map((x) => MsgListcontent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
