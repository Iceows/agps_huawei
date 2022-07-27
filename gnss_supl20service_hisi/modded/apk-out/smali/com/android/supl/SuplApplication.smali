.class public Lcom/android/supl/SuplApplication;
.super Landroid/app/Application;
.source "SuplApplication.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "SUPL20_Main"

.field private static context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .line 13
    sget-object v0, Lcom/android/supl/SuplApplication;->context:Landroid/content/Context;

    return-object v0
.end method

.method private startSuplServices()V
    .locals 2

    const-string v0, "SUPL20_Main"

    const-string v1, "Starting startSuplServices"

    .line 22
    invoke-static {v0, v1}, Lcom/android/supl/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 1

    .line 27
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 28
    invoke-virtual {p0}, Lcom/android/supl/SuplApplication;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sput-object v0, Lcom/android/supl/SuplApplication;->context:Landroid/content/Context;

    .line 29
    invoke-direct {p0}, Lcom/android/supl/SuplApplication;->startSuplServices()V

    return-void
.end method
