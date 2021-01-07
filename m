Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAA2C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 09:10:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3DE22CF8
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 09:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3DE22CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8LkdtbMs+KMjj4swX825k5dIu+ZfvZrgNV72UH74Q0g=; b=BZDcwqDsaZdRYR6uRDXyBcna7
	kvD6+Sb/J2QQTJl5D5sJwvXvbvO7tKXfEK8+eHLislIn+uIB7qtek/rcugrfLvXoo0BsN8fZt72p3
	8zLKyRYO01O8KMJ8h9BX9AUeSyUnGCx+eJB62BscO9oaXxI1WzbbPfxIxgBnYDo4YUyZdDQqG/w4f
	FRoxYIpDApBePP4MwzqmcYil3BI4GuwBf+Fr2ZTIHY9Oty+vp14zAzDJpeEY31Vcw1syAMjb7F/To
	eo07LRNMvQnVYi7JWW3zC1gociklaj51nijz7R91lm0MnxGyKD0SxAVf6WXOtq3jpbIobczkf5R+6
	bx4ynAvvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRJ8-0006Qn-Tl; Thu, 07 Jan 2021 09:10:14 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRJ5-0006Ps-Ev
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 09:10:12 +0000
Received: by mail-qv1-xf35.google.com with SMTP id p12so2442585qvj.13
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Jan 2021 01:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Up4Ntbnm2tP6xhuwNTf6jt4BMxiwenQSJFbALrVSgbw=;
 b=pJR3veNo3lZ3KZnRKIw+Cmk7JHB8WP0ijaTxMGz7wlMZZTrhxn8sgMU7/TDyBjpgmD
 /rrEPrp2CSoxb/QyWNdiHrcytrroWriHUxfjqXe/ULNUGmCC+9n5gTs3O+uiMx9cPxgz
 mfEwFmEJDBgFPz46bFbpXjx3pZM62G01MHRyipP+6qiSstlwKJfZlulg3zb6eKB/dRc0
 7lhG6DjBlwQaP88IIdhyoD1lW+/QLMRsxPJksdAmLtbADmsZYgg2eSZ36raeQCM5JxxT
 IJ2+m4+UG81nn6C8aLYo4TFVl+IiQxKa/z9IOeARU2UTvNqzOV4aZVIVCutR+S2hfZ/a
 Bj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Up4Ntbnm2tP6xhuwNTf6jt4BMxiwenQSJFbALrVSgbw=;
 b=KvUIU0t4KvSGe7OG3ZrUDZt/UKv3xGN9EYqg6WFhrb0GvXQ+HMKpKJbxg5YcfN4GEN
 HW6d8ai957NgSW40mOay8t4IirsV0sgZPTZSWBpX0f/JvkrOa0HA9O0q8ZW0u4cZdZCM
 VqsqwYiQxTWfCKb8vcLe5K3r4uB2wW9GAtBtevAHfNPw6GreysrOJT1p83tHbK1N5GBR
 YRL7ncEiBfpaaVO4FbzPEPzFP0YQnYeG4k5MrGMxGUELpoaI0fGlIO2vLksvH1Ono/A6
 jbguOTUk28X+oyDmdLQB+iGTa4pefFd+gEk/jkDHLBClhboTf21iS14DrcyXLD3bNOGi
 DUYw==
X-Gm-Message-State: AOAM533id65BhoY4UzSPi+jDOTnMuSa8/Tz8M4Xz5cA0CePrWt3MUtzN
 Q4JawrXNk9KeRcArkMG0kep8EjfmzBhcPQ2J5YI=
X-Google-Smtp-Source: ABdhPJyv2vjMXd5QQiayCiX4F/wULYWEZQdbYLZILnd10SKrAJd4SHv4m7ukUAU0F1t47B7hJTYSkbnFfTI6/7pqWhw=
X-Received: by 2002:a05:6214:a03:: with SMTP id
 dw3mr7888692qvb.24.1610010607854; 
 Thu, 07 Jan 2021 01:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
In-Reply-To: <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 7 Jan 2021 10:09:56 +0100
Message-ID: <CAFLxGvw=Qy9UHoa3N015hZvT9zj6YF_AiwE2ZHq3SU3cjjVDOA@mail.gmail.com>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
To: Vineet Gupta <vgupta@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_041011_561927_B5448032 
X-CRM114-Status: GOOD (  27.00  )
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Shreyas Joshi <shreyas.joshi@biamp.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Meyer <thomas@m3y3r.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

[CC'in linux-um since there is a similar issue]




On Thu, Jan 7, 2021 at 12:38 AM Vineet Gupta <vgupta@synopsys.com> wrote:
>
> +CC Buildroot folks
>
> Hi Petr,
>
> On 11/11/20 5:54 AM, Petr Mladek wrote:
> > stdin, stdout, and stderr standard I/O stream are created for the init
> > process. They are not available when there is no console registered
> > for /dev/console. It might lead to a crash when the init process
> > tries to use them, see the commit 48021f98130880dd742 ("printk: handle
> > blank console arguments passed in.").
> >
> > Normally, ttySX and ttyX consoles are used as a fallback when no consoles
> > are defined via the command line, device tree, or SPCR. But there
> > will be no console registered when an invalid console name is configured
> > or when the configured consoles do not exist on the system.
> >
> > Users even try to avoid the console intentionally, for example,
> > by using console="" or console=null. It is used on production
> > systems where the serial port or terminal are not visible to
> > users. Pushing messages to these consoles would just unnecessary
> > slowdown the system.
> >
> > Make sure that stdin, stdout, stderr, and /dev/console are always
> > available by a fallback to the existing ttynull driver. It has
> > been implemented for exactly this purpose but it was used only
> > when explicitly configured.
> >
> > Signed-off-by: Petr Mladek <pmladek@suse.com>
>
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -1470,8 +1470,14 @@ void __init console_on_rootfs(void)
> >       struct file *file = filp_open("/dev/console", O_RDWR, 0);
> >
> >       if (IS_ERR(file)) {
> > -             pr_err("Warning: unable to open an initial console.\n");
> > -             return;
> > +             pr_err("Warning: unable to open an initial console. Fallback to ttynull.\n");
> > +             register_ttynull_console();
> > +
> > +             file = filp_open("/dev/console", O_RDWR, 0);
> > +             if (IS_ERR(file)) {
> > +                     pr_err("Warning: Failed to add ttynull console. No stdin, stdout, and stderr for the init process!\n");
> > +                     return;
> > +             }
>
>
> This breaks ARC booting (no output on console).
>
> Our Buildroot based setup has dynamic /dev where /dev/console doesn't
> exist statically and there's a primoridla /init shell script which does
> following
>
> /bin/mount -t devtmpfs devtmpfs /dev
> exec 0</dev/console
> exec 1>/dev/console
> exec 2>/dev/console
> exec /sbin/init "$@"
>
> Buildroot has had this way of handling missing /dev/console since 2011
> [1] and [2].
>
> Please advise what needs to be done to unbork boot. Otherwise this seems
> like a kernel change which breaks user-space and needs to be backed-out
> (or perhaps conditionalize on CONFIG_NULL_TTY. I'm surprised it hasn't
> been reported by any other  embedded folks
>
> Thx,
> -Vineet
>
> [1] http://lists.busybox.net/pipermail/buildroot/2011-July/044505.html
> [2] http://lists.busybox.net/pipermail/buildroot/2011-August/044832.html



--
Thanks,
//richard

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
