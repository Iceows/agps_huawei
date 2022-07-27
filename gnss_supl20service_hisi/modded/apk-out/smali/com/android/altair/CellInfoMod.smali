.class public Lcom/android/altair/CellInfoMod;
.super Ljava/lang/Object;
.source "CellInfoMod.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private checkSelfPermission(Ljava/lang/String;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public GetInfosTel(Landroid/telephony/TelephonyManager;)V
    .locals 3

    const-string v0, "android.permission.ACCESS_COARSE_LOCATION"

    .line 24
    invoke-direct {p0, v0}, Lcom/android/altair/CellInfoMod;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 37
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_1

    goto :goto_2

    .line 50
    :cond_1
    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getAllCellInfo()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 51
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_2
    invoke-virtual {p1}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result p1

    if-lez p1, :cond_5

    const/4 p1, 0x0

    .line 52
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_5

    .line 53
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/telephony/CellInfo;

    .line 54
    instance-of v2, v1, Landroid/telephony/CellInfoGsm;

    if-eqz v2, :cond_3

    .line 55
    check-cast v1, Landroid/telephony/CellInfoGsm;

    invoke-virtual {v1}, Landroid/telephony/CellInfoGsm;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthGsm;

    .line 56
    invoke-virtual {v1}, Landroid/telephony/CellInfoGsm;->getCellIdentity()Landroid/telephony/CellIdentityGsm;

    goto :goto_1

    .line 59
    :cond_3
    instance-of v2, v1, Landroid/telephony/CellInfoLte;

    if-eqz v2, :cond_4

    .line 60
    check-cast v1, Landroid/telephony/CellInfoLte;

    invoke-virtual {v1}, Landroid/telephony/CellInfoLte;->getCellSignalStrength()Landroid/telephony/CellSignalStrengthLte;

    .line 61
    invoke-virtual {v1}, Landroid/telephony/CellInfoLte;->getCellIdentity()Landroid/telephony/CellIdentityLte;

    :cond_4
    :goto_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    return-void
.end method
