.class Lcom/android/supl/commprocessor/NDKCommProcessor$1;
.super Landroid/os/Handler;
.source "NDKCommProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/supl/commprocessor/NDKCommProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;


# direct methods
.method constructor <init>(Lcom/android/supl/commprocessor/NDKCommProcessor;)V
    .registers 2
    .param p1, "this$0"    # Lcom/android/supl/commprocessor/NDKCommProcessor;

    .prologue
    .line 1
    iput-object p1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    .line 213
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 218
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_56

    .line 251
    :cond_5
    :goto_5
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 252
    return-void

    .line 220
    :pswitch_9
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 222
    :try_start_11
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/supl/loc/SETLocationManager;->registerEmergencyReceiver()V
    :try_end_1a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_11 .. :try_end_1a} :catch_1b

    goto :goto_5

    .line 223
    :catch_1b
    move-exception v0

    .local v0, "argumentException":Ljava/lang/IllegalArgumentException;
    goto :goto_5

    .line 229
    .end local v0    # "argumentException":Ljava/lang/IllegalArgumentException;
    :pswitch_1d
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 231
    :try_start_25
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/supl/loc/SETLocationManager;->unregisterEmergencyReceiver()V
    :try_end_2e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_25 .. :try_end_2e} :catch_2f

    goto :goto_5

    .line 232
    :catch_2f
    move-exception v0

    .restart local v0    # "argumentException":Ljava/lang/IllegalArgumentException;
    goto :goto_5

    .line 238
    .end local v0    # "argumentException":Ljava/lang/IllegalArgumentException;
    :pswitch_31
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 239
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/supl/loc/SETLocationManager;->startLocationIdListener()V

    goto :goto_5

    .line 243
    :pswitch_43
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 244
    iget-object v1, p0, Lcom/android/supl/commprocessor/NDKCommProcessor$1;->this$0:Lcom/android/supl/commprocessor/NDKCommProcessor;

    invoke-static {v1}, Lcom/android/supl/commprocessor/NDKCommProcessor;->-get1(Lcom/android/supl/commprocessor/NDKCommProcessor;)Lcom/android/supl/loc/SETLocationManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/supl/loc/SETLocationManager;->stopListening()V

    goto :goto_5

    .line 218
    nop

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_9
        :pswitch_1d
        :pswitch_31
        :pswitch_43
    .end packed-switch
.end method
