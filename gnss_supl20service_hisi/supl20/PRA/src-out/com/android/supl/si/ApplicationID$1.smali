.class final Lcom/android/supl/si/ApplicationID$1;
.super Ljava/lang/Object;
.source "ApplicationID.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/supl/si/ApplicationID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/android/supl/si/ApplicationID;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/android/supl/si/ApplicationID;
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 146
    new-instance v0, Lcom/android/supl/si/ApplicationID;

    invoke-direct {v0, p1}, Lcom/android/supl/si/ApplicationID;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 145
    invoke-virtual {p0, p1}, Lcom/android/supl/si/ApplicationID$1;->createFromParcel(Landroid/os/Parcel;)Lcom/android/supl/si/ApplicationID;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/android/supl/si/ApplicationID;
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 150
    new-array v0, p1, [Lcom/android/supl/si/ApplicationID;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 149
    invoke-virtual {p0, p1}, Lcom/android/supl/si/ApplicationID$1;->newArray(I)[Lcom/android/supl/si/ApplicationID;

    move-result-object v0

    return-object v0
.end method
