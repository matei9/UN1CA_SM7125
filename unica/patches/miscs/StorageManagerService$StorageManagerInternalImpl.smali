.class public final Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;
.super Ljava/lang/Object;
.source "qb/109487026 64f64e04c38a1349853defed53f04f2a76c9f6d83a38c196e8113dd25483dcfc"


# instance fields
.field public mCloudProviderChangeListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

.field public mResetListeners:Ljava/util/List;

.field public synthetic this$0:Lcom/android/server/StorageManagerService;


# direct methods
.method public static killAppForOpChange(II)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/app/ActivityManager;->getService()Landroid/app/IActivityManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    :try_start_0
    invoke-static {p1}, Landroid/os/UserHandle;->getAppId(I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Landroid/app/AppOpsManager;->opToName(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p0, " changed."

    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v1, -0x1

    .line 31
    invoke-interface {v0, p1, v1, p0}, Landroid/app/IActivityManager;->killUid(IILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    return-void
.end method


# virtual methods
.method public final createUserStorageKeys(IZ)V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/server/StorageManagerService;->mVold:Landroid/os/IVold;

    .line 4
    .line 5
    invoke-interface {v0, p1, p2}, Landroid/os/IVold;->createUserStorageKeys(IZ)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 9
    .line 10
    iget-object p2, p2, Lcom/android/server/StorageManagerService;->mLock:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    :try_start_1
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/server/StorageManagerService;->mCeUnlockedUsers:Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;->users:[I

    .line 18
    .line 19
    invoke-static {v0, p1}, Lcom/android/internal/util/ArrayUtils;->appendInt([II)[I

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;->users:[I

    .line 24
    .line 25
    invoke-static {}, Landroid/os/UserManager;->invalidateIsUserUnlockedCache()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/os/storage/StorageManager;->invalidateVolumeListCache()V

    .line 29
    .line 30
    .line 31
    monitor-exit p2

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    const-string/jumbo p1, "StorageManagerService"

    .line 38
    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/sysfwutil/Slog;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final destroyUserStorageKeys(I)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/server/StorageManagerService;->mVold:Landroid/os/IVold;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Landroid/os/IVold;->destroyUserStorageKeys(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/android/server/StorageManagerService;->mLock:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    :try_start_1
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/server/StorageManagerService;->mCeUnlockedUsers:Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;->users:[I

    .line 18
    .line 19
    invoke-static {v1, p1}, Lcom/android/internal/util/ArrayUtils;->removeInt([II)[I

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;->users:[I

    .line 24
    .line 25
    invoke-static {}, Landroid/os/UserManager;->invalidateIsUserUnlockedCache()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/os/storage/StorageManager;->invalidateVolumeListCache()V

    .line 29
    .line 30
    .line 31
    monitor-exit v0

    .line 32
    return-void

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 36
    :catch_0
    move-exception p0

    .line 37
    const-string/jumbo p1, "StorageManagerService"

    .line 38
    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/sysfwutil/Slog;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final getExternalStorageMountMode(ILjava/lang/String;)I
    .locals 8

    .line 1
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    invoke-static {p1}, Landroid/os/Process;->isIsolated(I)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_e

    .line 9
    .line 10
    invoke-static {p1}, Landroid/os/Process;->isSdkSandboxUid(I)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    goto/16 :goto_6

    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lcom/android/server/StorageManagerService;->mIPackageManager:Landroid/content/pm/IPackageManager;

    .line 19
    .line 20
    invoke-interface {v1, p1}, Landroid/content/pm/IPackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {v1}, Lcom/android/internal/util/ArrayUtils;->isEmpty([Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    goto/16 :goto_6

    .line 31
    .line 32
    :cond_1
    if-nez p2, :cond_2

    .line 33
    .line 34
    aget-object p2, v1, v0

    .line 35
    .line 36
    :cond_2
    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J

    .line 37
    .line 38
    .line 39
    move-result-wide v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    :try_start_1
    iget-object v4, p0, Lcom/android/server/StorageManagerService;->mPmInternal:Landroid/content/pm/PackageManagerInternal;

    .line 41
    .line 42
    invoke-static {p1}, Landroid/os/UserHandle;->getUserId(I)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    invoke-virtual {v4, p2, v5}, Landroid/content/pm/PackageManagerInternal;->isInstantApp(Ljava/lang/String;I)Z

    .line 47
    .line 48
    .line 49
    move-result v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    if-eqz v4, :cond_3

    .line 51
    .line 52
    :try_start_2
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 53
    .line 54
    .line 55
    goto/16 :goto_6

    .line 56
    .line 57
    :cond_3
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/server/StorageManagerService;->mStorageManagerInternal:Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 63
    .line 64
    iget v2, v2, Lcom/android/server/StorageManagerService;->mMediaStoreAuthorityAppId:I

    .line 65
    .line 66
    invoke-static {p1}, Landroid/os/UserHandle;->getAppId(I)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    const/4 v4, 0x1

    .line 71
    if-ne v2, v3, :cond_4

    .line 72
    .line 73
    move v2, v4

    .line 74
    goto :goto_0

    .line 75
    :cond_4
    move v2, v0

    .line 76
    :goto_0
    if-eqz v2, :cond_5

    .line 77
    .line 78
    const/4 v0, 0x3

    .line 79
    goto/16 :goto_6

    .line 80
    .line 81
    :cond_5
    iget v2, p0, Lcom/android/server/StorageManagerService;->mDownloadsAuthorityAppId:I

    .line 82
    .line 83
    invoke-static {p1}, Landroid/os/UserHandle;->getAppId(I)I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eq v2, v3, :cond_d

    .line 88
    .line 89
    iget v2, p0, Lcom/android/server/StorageManagerService;->mExternalStorageAuthorityAppId:I

    .line 90
    .line 91
    invoke-static {p1}, Landroid/os/UserHandle;->getAppId(I)I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    if-ne v2, v3, :cond_6

    .line 96
    .line 97
    goto :goto_5

    .line 98
    :cond_6
    iget-object v2, p0, Lcom/android/server/StorageManagerService;->mIPackageManager:Landroid/content/pm/IPackageManager;

    .line 99
    .line 100
    const-string/jumbo v3, "android.permission.ACCESS_MTP"

    .line 101
    .line 102
    .line 103
    invoke-interface {v2, v3, p1}, Landroid/content/pm/IPackageManager;->checkUidPermission(Ljava/lang/String;I)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-nez v2, :cond_7

    .line 108
    .line 109
    iget-object v2, p0, Lcom/android/server/StorageManagerService;->mIPackageManager:Landroid/content/pm/IPackageManager;

    .line 110
    .line 111
    invoke-static {p1}, Landroid/os/UserHandle;->getUserId(I)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    const-wide/16 v5, 0x0

    .line 116
    .line 117
    invoke-interface {v2, p2, v5, v6, v3}, Landroid/content/pm/IPackageManager;->getApplicationInfo(Ljava/lang/String;JI)Landroid/content/pm/ApplicationInfo;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    if-eqz p2, :cond_7

    .line 122
    .line 123
    invoke-virtual {p2}, Landroid/content/pm/ApplicationInfo;->isSignedWithPlatformKey()Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_7

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :cond_7
    iget-object p2, p0, Lcom/android/server/StorageManagerService;->mIPackageManager:Landroid/content/pm/IPackageManager;

    .line 131
    .line 132
    const-string/jumbo v2, "android.permission.INSTALL_PACKAGES"

    .line 133
    .line 134
    .line 135
    invoke-interface {p2, v2, p1}, Landroid/content/pm/IPackageManager;->checkUidPermission(Ljava/lang/String;I)I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    if-nez p2, :cond_8

    .line 140
    .line 141
    move p2, v4

    .line 142
    goto :goto_1

    .line 143
    :cond_8
    move p2, v0

    .line 144
    :goto_1
    array-length v2, v1

    .line 145
    move v3, v0

    .line 146
    :goto_2
    if-ge v3, v2, :cond_a

    .line 147
    .line 148
    aget-object v5, v1, v3

    .line 149
    .line 150
    iget-object v6, p0, Lcom/android/server/StorageManagerService;->mIAppOpsService:Lcom/android/internal/app/IAppOpsService;

    .line 151
    .line 152
    const/16 v7, 0x42

    .line 153
    .line 154
    invoke-interface {v6, v7, p1, v5}, Lcom/android/internal/app/IAppOpsService;->checkOperation(IILjava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result v5

    .line 158
    if-nez v5, :cond_9

    .line 159
    .line 160
    move v0, v4

    .line 161
    goto :goto_3

    .line 162
    :cond_9
    add-int/lit8 v3, v3, 0x1

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_a
    :goto_3
    if-nez p2, :cond_c

    .line 166
    .line 167
    if-eqz v0, :cond_b

    .line 168
    .line 169
    goto :goto_4

    .line 170
    :cond_b
    move v0, v4

    .line 171
    goto :goto_6

    .line 172
    :cond_c
    :goto_4
    const/4 v0, 0x2

    .line 173
    goto :goto_6

    .line 174
    :cond_d
    :goto_5
    const/4 v0, 0x4

    .line 175
    goto :goto_6

    .line 176
    :catchall_0
    move-exception p0

    .line 177
    invoke-static {v2, v3}, Landroid/os/Binder;->restoreCallingIdentity(J)V

    .line 178
    .line 179
    .line 180
    throw p0
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 181
    :catch_0
    :cond_e
    :goto_6
    sget-object p0, Lcom/android/server/StorageManagerService;->sSelf:Lcom/android/server/StorageManagerService;

    .line 182
    .line 183
    return v0
.end method

.method public final hasExternalStorageAccess(ILjava/lang/String;)Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/android/server/StorageManagerService;->mIAppOpsService:Lcom/android/internal/app/IAppOpsService;

    .line 5
    .line 6
    const/16 v2, 0x5c

    .line 7
    .line 8
    invoke-interface {v1, v2, p1, p2}, Lcom/android/internal/app/IAppOpsService;->checkOperation(IILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x3

    .line 13
    const/4 v3, 0x1

    .line 14
    if-ne v1, v2, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/server/StorageManagerService;->mIPackageManager:Landroid/content/pm/IPackageManager;

    .line 17
    .line 18
    const-string/jumbo v1, "android.permission.MANAGE_EXTERNAL_STORAGE"

    .line 19
    .line 20
    .line 21
    invoke-interface {p0, v1, p1}, Landroid/content/pm/IPackageManager;->checkUidPermission(Ljava/lang/String;I)I

    .line 22
    .line 23
    .line 24
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    return v3

    .line 28
    :cond_0
    return v0

    .line 29
    :catch_0
    move-exception p0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    if-nez v1, :cond_2

    .line 32
    .line 33
    return v3

    .line 34
    :cond_2
    return v0

    .line 35
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v1, "Failed to check MANAGE_EXTERNAL_STORAGE access for "

    .line 38
    .line 39
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p1, p0}, Landroid/util/sysfwutil/Slog;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 50
    .line 51
    .line 52
    return v0
.end method

.method public final isCeStoragePrepared(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/server/StorageManagerService;->mLock:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/server/StorageManagerService;->mCeStoragePreparedUsers:Ljava/util/Set;

    .line 9
    .line 10
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p0, Landroid/util/ArraySet;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    monitor-exit v0

    .line 21
    return p0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public final onReset()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->mResetListeners:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->mResetListeners:Ljava/util/List;

    .line 5
    .line 6
    check-cast p0, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    throw p0

    .line 30
    :cond_1
    new-instance p0, Ljava/lang/ClassCastException;

    .line 31
    .line 32
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 33
    .line 34
    .line 35
    throw p0

    .line 36
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public final prepareStorageDirs(ILjava/lang/String;Ljava/util/Set;)V
    .locals 5

    .line 1
    const-string/jumbo v0, "User "

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 5
    .line 6
    iget-object v1, v1, Lcom/android/server/StorageManagerService;->mLock:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v1

    .line 9
    :try_start_0
    iget-object v2, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/android/server/StorageManagerService;->mFuseMountedUser:Ljava/util/Set;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v2, Landroid/util/ArraySet;

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    const-string/jumbo p0, "StorageManagerService"

    .line 26
    .line 27
    .line 28
    new-instance p2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, " is not unlocked yet so skip mounting obb"

    .line 37
    .line 38
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {p0, p1}, Landroid/util/sysfwutil/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    monitor-exit v1

    .line 49
    return-void

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto/16 :goto_2

    .line 52
    .line 53
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    :try_start_1
    const-string/jumbo v0, "vold"

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Landroid/os/ServiceManager;->getServiceOrThrow(Ljava/lang/String;)Landroid/os/IBinder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Landroid/os/IVold$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IVold;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Ljava/lang/String;

    .line 80
    .line 81
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 82
    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v3, "/storage/emulated/"

    .line 89
    .line 90
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v3, "/Android/obb/"

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v3, "/"

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    new-instance v3, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    const-string v4, "/storage/emulated/"

    .line 119
    .line 120
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v4, "/Android/data/"

    .line 127
    .line 128
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v4, "/"

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    iget-object v4, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 144
    .line 145
    iget-object v4, v4, Lcom/android/server/StorageManagerService;->mPmInternal:Landroid/content/pm/PackageManagerInternal;

    .line 146
    .line 147
    invoke-virtual {v4, v1}, Landroid/content/pm/PackageManagerInternal;->getPackage(Ljava/lang/String;)Lcom/android/server/pm/pkg/AndroidPackage;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-interface {v1}, Lcom/android/server/pm/pkg/AndroidPackage;->getUid()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    invoke-static {p1, v1}, Landroid/os/UserHandle;->getUid(II)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-interface {v0, v2, v1}, Landroid/os/IVold;->ensureAppDirsCreated([Ljava/lang/String;I)V
    :try_end_1
    .catch Landroid/os/ServiceManager$ServiceNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :catch_0
    move-exception p0

    .line 168
    goto :goto_1

    .line 169
    :cond_1
    return-void

    .line 170
    :goto_1
    const-string/jumbo p1, "StorageManagerService"

    .line 171
    .line 172
    .line 173
    new-instance p3, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string/jumbo v0, "Unable to create obb and data directories for "

    .line 176
    .line 177
    .line 178
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    invoke-static {p1, p2, p0}, Landroid/util/sysfwutil/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 189
    .line 190
    .line 191
    return-void

    .line 192
    :goto_2
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 193
    throw p0
.end method

.method public final unlockCeStorage(I[B[B)V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/storage/StorageManager;->isFileEncrypted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/server/StorageManagerService;->mVold:Landroid/os/IVold;

    .line 10
    .line 11
    const-string p2, ""
    :goto_0
    invoke-interface {v0, p1, p2, p3}, Landroid/os/IVold;->unlockCeStorage(ILjava/lang/String;[B)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :catch_0
    move-exception p2

    .line 29
    invoke-virtual {p2}, Landroid/os/RemoteException;->rethrowAsRuntimeException()Ljava/lang/RuntimeException;

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_1
    iget-object p2, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/android/server/StorageManagerService;->mLock:Ljava/lang/Object;

    .line 35
    .line 36
    monitor-enter p2

    .line 37
    :try_start_1
    iget-object p0, p0, Lcom/android/server/StorageManagerService$StorageManagerInternalImpl;->this$0:Lcom/android/server/StorageManagerService;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/server/StorageManagerService;->mCeUnlockedUsers:Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;

    .line 40
    .line 41
    iget-object p3, p0, Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;->users:[I

    .line 42
    .line 43
    invoke-static {p3, p1}, Lcom/android/internal/util/ArrayUtils;->appendInt([II)[I

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/android/server/StorageManagerService$WatchedUnlockedUsers;->users:[I

    .line 48
    .line 49
    invoke-static {}, Landroid/os/UserManager;->invalidateIsUserUnlockedCache()V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Landroid/os/storage/StorageManager;->invalidateVolumeListCache()V

    .line 53
    .line 54
    .line 55
    monitor-exit p2

    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    throw p0
.end method
