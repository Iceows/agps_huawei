.class public Lcom/android/supl/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field private static final SPACE:Ljava/lang/String; = " "

.field private static sdf:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 16
    invoke-static {}, Lcom/android/supl/Log;->init()V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 20
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 0

    .line 24
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 28
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 0

    .line 32
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 36
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 0

    .line 40
    invoke-static {p0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static init()V
    .locals 2

    .line 44
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd-MM hh:mm:ss zzz"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/android/supl/Log;->sdf:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public static println(ILjava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 48
    invoke-static {p0, p1, p2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 52
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 0

    .line 56
    invoke-static {p0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    .line 60
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 0

    .line 64
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 0

    .line 68
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result p0

    return p0
.end method
