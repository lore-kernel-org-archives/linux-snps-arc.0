Return-Path: <SRS0=wHoL=5D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FE1C4332B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Mar 2020 23:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE8B2076E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Mar 2020 23:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLTOK7NK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QluPPfnb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE8B2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWAyjwoaXfSxt4socV9j+47okr7wunSUPcCaE7pOoHw=; b=tLTOK7NKi9Yuo4
	rrzRnrDXLqDWNAEcO7AlQZdz5FFlH4hKrTjK0XRhAEtr6AvbHyYdAayq2AuQjYGDf0Vaq+O+1NO3b
	keb7pbWHWroE58ev/lOBpAFgJcGfnNmKIi5YEy0w0txHZztyFO06yvx0lT5Lff16sok8viHWJIS8J
	6NqKq41rCBBkyjT3U/3NGQgZnVHruaTLvBtj64TvbNw3bG+04i1wdTjCjcwAqGjr5K8DG0L877Q1o
	X6URrkMOGwpzyt1jv+io7tTKzZqOVr1nUGcL3oA6NWbMX9ZPWofE9C3DRJCh6i1cj0u5BHHvyYnfW
	+8o9k7fyyxbl44xvwAdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEhyE-0005ls-Tv; Wed, 18 Mar 2020 23:19:30 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEhyB-0005jy-6c
 for linux-snps-arc@lists.infradead.org; Wed, 18 Mar 2020 23:19:29 +0000
Received: by mail-ua1-x941.google.com with SMTP id o16so68867uap.6
 for <linux-snps-arc@lists.infradead.org>; Wed, 18 Mar 2020 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0qzmvjRcSn2ROKQVRWkuJ/hIfos35F8kWzYfPJUO+0=;
 b=QluPPfnbuO1Qkmg4r+FFcNBvXdkaamGk6RAi6ynUY/ygjkXZkq5kcYk523tkrCq1rh
 ptLgWUFwuPHjEZ54kWapRUbqenlP2Jc4rw9OLfRH8VzG9lWKcag4EBKtdge83E3OxhtC
 msggMO/+KLfCEDbF0LUgzXdgHaX8pCT+L50tAKYTs04tZVyGvEX2IMJdIIeG+SKxx6rN
 fhAzY1vavm0Y00TQLqFoYfvGG2wcpHfSC1v7w4q1nhog7MFESgVVeu6DssztLrRHpDW6
 lMxA/7SjnsQhRCEPgwhFJDv5lECI2RtHTZTUDXpjmn93XkFo/PAkv3GkvSjcpsue+QvS
 TuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0qzmvjRcSn2ROKQVRWkuJ/hIfos35F8kWzYfPJUO+0=;
 b=WWuEpnlzQabV3+xjNOuTFA56WtMT8LvErXMmjr8nSyyuqKe/XdEhAl3jl4Oc+DxqgO
 QUZg1mYjrFZkGS84IkIIi2YZv0i5oXQdzXvweDbUcKcil28Ky9LyAJBYBc2OUIrDmW4l
 u2Zu5rM0LADnY5xV1lqvOpiIw+qLTf/gj1t8iIeKjOX7hQ933nlMflRHbFgTc0mUOjA3
 3Uh4ik7TZyg28s7vkzOr/Ct+NhCVAqAauo9a7p+RcZyjv/3TgfIZad3QMY2p30NHqjZs
 WSdwIO+6BbQKebg3I1UqKsf451vnTZfw8QdcHxfv93xHZsQv9wuGh0V8zDSq2SgGNSnX
 C+tA==
X-Gm-Message-State: ANhLgQ23sFXqRmEPxd6YSudhrPw/rAP6nYal2oz4BGth/kuGShBIjroj
 0rB7M9upmFv03t3TaH63R9TOKookpzG3YHm3dGU=
X-Google-Smtp-Source: ADFU+vvZpw3B5ewXcDHBPc2mLNiDn8rkQDQPLLRoGs+2y00LGIV0czWFldSxBDCMZQvsUvT4c1CjpYoVBNajZmMNzIE=
X-Received: by 2002:a9f:3311:: with SMTP id o17mr23767uab.30.1584573564540;
 Wed, 18 Mar 2020 16:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200305012605.26870-1-alistair.francis@wdc.com>
 <20200305012605.26870-4-alistair.francis@wdc.com>
 <69e30ee6-30a4-81d6-141e-1a42f15a5c8e@synopsys.com>
In-Reply-To: <69e30ee6-30a4-81d6-141e-1a42f15a5c8e@synopsys.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 18 Mar 2020 16:11:29 -0700
Message-ID: <CAKmqyKP2qHv4NgbWw0hcxeX1En3AG7asWwFujzqLMp6z0H4ekg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] sysv: linux: Pass 64-bit version of semctl syscall
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_161927_245721_FBFB7BD1 
X-CRM114-Status: GOOD (  25.13  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 5:29 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
> Hi Alistair,
>
> On 3/4/20 5:26 PM, Alistair Francis wrote:
> > The semctl_syscall() function passes a union semun to the kernel. The
> > union includes struct semid_ds as a member. On 32-bit architectures the
> > Linux kernel provides a *_high version of the 32-bit sem_otime and
> > sem_ctime values. These can be combined to get a 64-bit version of the
> > time.
> >
> > This patch adjusts the struct semid_ds to support the *_high versions
> > of sem_otime and sem_ctime. For 32-bit systems with a 64-bit time_t
> > this can be used to get a 64-bit time from the two 32-bit values.
> >
> > We protect this new code via the __IPC_TIME64 marco, which is only true
> > for 32-bit architectures with a 64-bit time_t.
> > ---
> >  bits/ipc.h                                    |  6 ++++-
> >  sysdeps/gnu/bits/ipc.h                        |  6 ++++-
> >  sysdeps/unix/sysv/linux/bits/ipc.h            |  6 ++++-
> >  sysdeps/unix/sysv/linux/bits/semid_ds_t.h     | 15 +++++++++++
> >  .../unix/sysv/linux/hppa/bits/semid_ds_t.h    | 15 +++++++++++
> >  .../unix/sysv/linux/mips/bits/semid_ds_t.h    | 13 ++++++++++
> >  .../unix/sysv/linux/powerpc/bits/semid_ds_t.h | 15 +++++++++++
> >  sysdeps/unix/sysv/linux/semctl.c              | 25 ++++++++++++++++---
> >  .../unix/sysv/linux/sparc/bits/semid_ds_t.h   | 15 +++++++++++
> >  sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h | 15 +++++++++++
> >  10 files changed, 124 insertions(+), 7 deletions(-)
> >
> > diff --git a/bits/ipc.h b/bits/ipc.h
> > index e2981fd5c3..9ac8485193 100644
> > --- a/bits/ipc.h
> > +++ b/bits/ipc.h
> > @@ -29,7 +29,11 @@
> >  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
> >  #define IPC_RMID     0               /* remove identifier */
> >  #define IPC_SET              1               /* set `ipc_perm' options */
> > -#define IPC_STAT     2               /* get `ipc_perm' options */
> > +#if __TIMESIZE == 64 && __WORDSIZE == 32
> > +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
> > +#else
> > +# define IPC_STAT 2   /* Get `ipc_perm' options.  */
> > +#endif
>
> Why is this needed. Linux kernel seems to be returning EINVAL for this cmd-id and
> following fail for ARC.
>
> FAIL: sysvipc/test-sysvmsg
> FAIL: sysvipc/test-sysvsem
> FAIL: sysvipc/test-sysvshm
>
> Shouldn't this use the default __IPC_64 value which is 0 not 0x100.

I think you are right. I have fixed this up in the next version.

Alistair

>
> >
> >  /* Special key values.  */
> >  #define IPC_PRIVATE  ((key_t) 0)     /* private key */
> > diff --git a/sysdeps/gnu/bits/ipc.h b/sysdeps/gnu/bits/ipc.h
> > index 47df305e1c..328c11a0d7 100644
> > --- a/sysdeps/gnu/bits/ipc.h
> > +++ b/sysdeps/gnu/bits/ipc.h
> > @@ -29,7 +29,11 @@
> >  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
> >  #define IPC_RMID     0               /* Remove identifier.  */
> >  #define IPC_SET              1               /* Set `ipc_perm' options.  */
> > -#define IPC_STAT     2               /* Get `ipc_perm' options.  */
> > +#if __TIMESIZE == 64 && __WORDSIZE == 32
> > +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
> > +#else
> > +# define IPC_STAT 2   /* Get `ipc_perm' options.  */
> > +#endif
> >  #ifdef __USE_GNU
> >  # define IPC_INFO    3               /* See ipcs.  */
> >  #endif
> > diff --git a/sysdeps/unix/sysv/linux/bits/ipc.h b/sysdeps/unix/sysv/linux/bits/ipc.h
> > index 085dd628ac..44449de62f 100644
> > --- a/sysdeps/unix/sysv/linux/bits/ipc.h
> > +++ b/sysdeps/unix/sysv/linux/bits/ipc.h
> > @@ -29,7 +29,11 @@
> >  /* Control commands for `msgctl', `semctl', and `shmctl'.  */
> >  #define IPC_RMID     0               /* Remove identifier.  */
> >  #define IPC_SET              1               /* Set `ipc_perm' options.  */
> > -#define IPC_STAT     2               /* Get `ipc_perm' options.  */
> > +#if __TIMESIZE == 64 && __WORDSIZE == 32
> > +# define IPC_STAT 0x102     /* Get `ipc_perm' options.  */
> > +#else
> > +# define IPC_STAT    2               /* Get `ipc_perm' options.  */
> > +#endif
> >  #ifdef __USE_GNU
> >  # define IPC_INFO    3               /* See ipcs.  */
> >  #endif
> > diff --git a/sysdeps/unix/sysv/linux/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/bits/semid_ds_t.h
> > index d9d902ed0d..b135301356 100644
> > --- a/sysdeps/unix/sysv/linux/bits/semid_ds_t.h
> > +++ b/sysdeps/unix/sysv/linux/bits/semid_ds_t.h
> > @@ -20,6 +20,21 @@
> >  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
> >  #endif
> >
> > +#if __WORDSIZE == 32
> > +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> > + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> > +struct __semid_ds32 {
> > +  struct ipc_perm sem_perm;              /* operation permission struct */
> > +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> > +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> > +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> > +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> > +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> > +  __syscall_ulong_t   __glibc_reserved3;
> > +  __syscall_ulong_t   __glibc_reserved4;
> > +};
> > +#endif
> > +
> >  /* Data structure describing a set of semaphores.  */
> >  #if __TIMESIZE == 32
> >  struct semid_ds
> > diff --git a/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h
> > index 39c0e53f38..3613c5ec94 100644
> > --- a/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h
> > +++ b/sysdeps/unix/sysv/linux/hppa/bits/semid_ds_t.h
> > @@ -20,6 +20,21 @@
> >  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
> >  #endif
> >
> > +#if __WORDSIZE == 32
> > +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> > + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> > +struct __semid_ds32 {
> > +  struct ipc_perm sem_perm;              /* operation permission struct */
> > +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> > +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> > +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> > +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> > +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> > +  __syscall_ulong_t   __glibc_reserved3;
> > +  __syscall_ulong_t   __glibc_reserved4;
> > +};
> > +#endif
> > +
> >  /* Data structure describing a set of semaphores.  */
> >  #if __TIMESIZE == 32
> >  struct semid_ds
> > diff --git a/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h
> > index 1ab16492dd..e26906a67f 100644
> > --- a/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h
> > +++ b/sysdeps/unix/sysv/linux/mips/bits/semid_ds_t.h
> > @@ -20,6 +20,19 @@
> >  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
> >  #endif
> >
> > +#if __WORDSIZE == 32
> > +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> > + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> > +struct __semid_ds32 {
> > +  struct ipc_perm sem_perm;              /* operation permission struct */
> > +  __syscall_ulong_t   sem_otime;          /* last semop time */
> > +  __syscall_ulong_t   sem_ctime;          /* last change time */
> > +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> > +  __syscall_ulong_t   sem_otime_high;
> > +  __syscall_ulong_t   sem_ctime_high;
> > +};
> > +#endif
> > +
> >  /* Data structure describing a set of semaphores.  */
> >  struct semid_ds
> >  {
> > diff --git a/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h
> > index 79b4cba939..ec2ff552eb 100644
> > --- a/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h
> > +++ b/sysdeps/unix/sysv/linux/powerpc/bits/semid_ds_t.h
> > @@ -20,6 +20,21 @@
> >  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
> >  #endif
> >
> > +#if __WORDSIZE == 32
> > +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> > + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> > +struct __semid_ds32 {
> > +  struct ipc_perm sem_perm;              /* operation permission struct */
> > +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> > +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> > +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> > +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> > +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> > +  __syscall_ulong_t   __glibc_reserved3;
> > +  __syscall_ulong_t   __glibc_reserved4;
> > +};
> > +#endif
> > +
> >  /* Data structure describing a set of semaphores.  */
> >  #if __TIMESIZE == 32
> >  struct semid_ds
> > diff --git a/sysdeps/unix/sysv/linux/semctl.c b/sysdeps/unix/sysv/linux/semctl.c
> > index 0c3eb0932f..3ac6d01b84 100644
> > --- a/sysdeps/unix/sysv/linux/semctl.c
> > +++ b/sysdeps/unix/sysv/linux/semctl.c
> > @@ -23,11 +23,16 @@
> >  #include <shlib-compat.h>
> >  #include <errno.h>
> >
> > +#define __IPC_TIME64 (IPC_STAT & __IPC_64)
> > +
> >  /* Define a `union semun' suitable for Linux here.  */
> >  union semun
> >  {
> >    int val;                   /* value for SETVAL */
> >    struct semid_ds *buf;              /* buffer for IPC_STAT & IPC_SET */
> > +#if __WORDSIZE == 32
> > +  struct __semid_ds32 *buf32;   /* 32-bit buffer for IPC_STAT & IPC_SET */
> > +#endif
> >    unsigned short int *array; /* array for GETALL & SETALL */
> >    struct seminfo *__buf;     /* buffer for IPC_INFO */
> >  };
> > @@ -43,13 +48,25 @@ union semun
> >  static int
> >  semctl_syscall (int semid, int semnum, int cmd, union semun arg)
> >  {
> > +  int ret;
> >  #ifdef __ASSUME_DIRECT_SYSVIPC_SYSCALLS
> > -  return INLINE_SYSCALL_CALL (semctl, semid, semnum, cmd | __IPC_64,
> > -                           arg.array);
> > +  ret = INLINE_SYSCALL_CALL (semctl, semid, semnum, cmd | __IPC_64,
> > +                             arg.array);
> >  #else
> > -  return INLINE_SYSCALL_CALL (ipc, IPCOP_semctl, semid, semnum, cmd | __IPC_64,
> > -                           SEMCTL_ARG_ADDRESS (arg));
> > +  ret = INLINE_SYSCALL_CALL (ipc, IPCOP_semctl, semid, semnum, cmd | __IPC_64,
> > +                             SEMCTL_ARG_ADDRESS (arg));
> > +#endif
> > +
> > +#if __IPC_TIME64
> > +  if (ret == 0 && (cmd & __IPC_TIME64))
> > +    {
> > +      arg.buf->sem_ctime = arg.buf32->sem_ctime |
> > +                               ((time_t) arg.buf32->sem_ctime_high << 32);
> > +      arg.buf->sem_otime = arg.buf32->sem_otime |
> > +                               ((time_t) arg.buf32->sem_otime_high << 32);
> > +    }
> >  #endif
> > +  return ret;
> >  }
> >
> >  int
> > diff --git a/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h
> > index f8de676e79..b08fb8a79e 100644
> > --- a/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h
> > +++ b/sysdeps/unix/sysv/linux/sparc/bits/semid_ds_t.h
> > @@ -20,6 +20,21 @@
> >  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
> >  #endif
> >
> > +#if __WORDSIZE == 32
> > +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> > + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> > +struct __semid_ds32 {
> > +  struct ipc_perm sem_perm;              /* operation permission struct */
> > +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> > +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> > +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> > +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> > +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> > +  __syscall_ulong_t   __glibc_reserved3;
> > +  __syscall_ulong_t   __glibc_reserved4;
> > +};
> > +#endif
> > +
> >  /* Data structure describing a set of semaphores.  */
> >  #if __TIMESIZE == 32
> >  struct semid_ds
> > diff --git a/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h b/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h
> > index 42694069d5..c7b9adce88 100644
> > --- a/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h
> > +++ b/sysdeps/unix/sysv/linux/x86/bits/semid_ds_t.h
> > @@ -20,6 +20,21 @@
> >  # error "Never include <bits/semid_ds_t.h> directly; use <sys/sem.h> instead."
> >  #endif
> >
> > +#if __WORDSIZE == 32
> > +/* This is the "new" y2038 types defined after the 5.1 kernel. It allows
> > + * the kernel to use {o,c}time{_high} values to support a 64-bit time_t.  */
> > +struct __semid_ds32 {
> > +  struct ipc_perm sem_perm;              /* operation permission struct */
> > +  __syscall_ulong_t   sem_otime;         /* last semop() time */
> > +  __syscall_ulong_t   sem_otime_high;    /* last semop() time high */
> > +  __syscall_ulong_t   sem_ctime;         /* last time changed by semctl() */
> > +  __syscall_ulong_t   sem_ctime_high;    /* last time changed by semctl() high */
> > +  __syscall_ulong_t   sem_nsems;         /* number of semaphores in set */
> > +  __syscall_ulong_t   __glibc_reserved3;
> > +  __syscall_ulong_t   __glibc_reserved4;
> > +};
> > +#endif
> > +
> >  /* Data structure describing a set of semaphores.  */
> >  struct semid_ds
> >  {
> >
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
