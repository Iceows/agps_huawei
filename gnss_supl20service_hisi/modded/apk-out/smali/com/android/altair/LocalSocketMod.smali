.class public Lcom/android/altair/LocalSocketMod;
.super Ljava/lang/Object;
.source "LocalSocketMod.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public SetLocalSocket()Z
    .locals 3

    .line 14
    :try_start_0
    new-instance v0, Landroid/net/LocalSocket;

    invoke-direct {v0}, Landroid/net/LocalSocket;-><init>()V

    .line 15
    new-instance v1, Landroid/net/LocalSocketAddress;

    const-string v2, "/data/gnss/mysocket"

    invoke-direct {v1, v2}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;)V

    .line 16
    invoke-virtual {v0, v1}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V

    const/16 v1, 0x2710

    .line 19
    invoke-virtual {v0, v1}, Landroid/net/LocalSocket;->setSoTimeout(I)V

    .line 20
    invoke-virtual {v0}, Landroid/net/LocalSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    const/4 v0, 0x0

    return v0
.end method
