.class public Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_NeighModeSpecMeas;
.super Ljava/lang/Object;
.source "SUPL_OTDOA_NeighModeSpecMeas.java"


# instance fields
.field public stModeSpecificFDDMeas:Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_ModeSpecMeasFDD;

.field public stModeSpecificTDDMeas:Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_MDSpecINF_TDD;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getNeighModeSpecMeas()[B
    .registers 3

    .prologue
    .line 49
    const/4 v0, 0x0

    .line 50
    .local v0, "bData":[B
    iget-object v1, p0, Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_NeighModeSpecMeas;->stModeSpecificFDDMeas:Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_ModeSpecMeasFDD;

    if-eqz v1, :cond_c

    .line 51
    iget-object v1, p0, Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_NeighModeSpecMeas;->stModeSpecificFDDMeas:Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_ModeSpecMeasFDD;

    invoke-virtual {v1}, Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_ModeSpecMeasFDD;->getModeSpecMeasFDD()[B

    move-result-object v0

    .line 55
    .end local v0    # "bData":[B
    :cond_b
    :goto_b
    return-object v0

    .line 52
    .restart local v0    # "bData":[B
    :cond_c
    iget-object v1, p0, Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_NeighModeSpecMeas;->stModeSpecificTDDMeas:Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_MDSpecINF_TDD;

    if-eqz v1, :cond_b

    .line 53
    iget-object v1, p0, Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_NeighModeSpecMeas;->stModeSpecificTDDMeas:Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_MDSpecINF_TDD;

    invoke-virtual {v1}, Lcom/android/supl/loc/measure/odtoa/SUPL_OTDOA_MDSpecINF_TDD;->getMDSpecINF_TDD()[B

    move-result-object v0

    .local v0, "bData":[B
    goto :goto_b
.end method
