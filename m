Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E45C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 12:54:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1F12336D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 12:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF1F12336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fH4iJt3pOqCxsiuA7gLp5BJP/SsSI41bbS4/InP9unQ=; b=ukWO7xNvUGj00SCxvd11GC1Py
	y50wSRnDVB6fAX39XaGXkQGSOe8a4olPUlGiu1tYjxoHNXFkqS1A94hxGg87TuckRjdy0j396X3Er
	mNQptWkDJuYWhZbNcjCCgA0rW8+esLlfTTQdmzBbhUfyJhKMcvdN5DFAWqpyQDlgj9mSOLUQ7ZHHQ
	xi/hgOr9MVi7ZmaNI00vNLIUudYYm04i7qO7gPq9SsxnnQGbBTrEvqpItLHas2JPmgSbA4G202cgN
	dpP0xAfH1YgvSSY9zcctUMs7D7ntNcDRqWu5YJ7/1YZHryltNxseFaK509I9VWhmNrsLfI8NE8Yds
	4AvYrnlQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUoJ-00060E-Dg; Thu, 07 Jan 2021 12:54:39 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUiM-0002jT-PJ
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 12:48:34 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1610023708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M3fsgJ4y1qrIo5WUjYDZW5qHVTbkdAXEHQARuQrTSQA=;
 b=l12sFVAYH+BxrN7h9cAZo1z18t+ytiRNq8XfT1CuTlVXqSX39LNptAduSG/4POUTvSWBUR
 ybQxpwK4KmW3/8V/qu3dmgAchq/w5TY2kfDWOk2ESOJxqkQrQgMN2vJbbbOR1/1i4XaDMl
 oHsTa71UqqoZ753ZAIIy9TiQzI/3E6M=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D231ACAF;
 Thu,  7 Jan 2021 12:48:28 +0000 (UTC)
Date: Thu, 7 Jan 2021 13:48:27 +0100
From: Petr Mladek <pmladek@suse.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
Message-ID: <X/cDG/xCCzSWW2cd@alley>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_074831_188404_E3928660 
X-CRM114-Status: GOOD (  28.69  )
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
Cc: linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed 2021-01-06 15:36:36, Vineet Gupta wrote:
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
> >   	struct file *file = filp_open("/dev/console", O_RDWR, 0);
> >   	if (IS_ERR(file)) {
> > -		pr_err("Warning: unable to open an initial console.\n");
> > -		return;
> > +		pr_err("Warning: unable to open an initial console. Fallback to ttynull.\n");
> > +		register_ttynull_console();
> > +
> > +		file = filp_open("/dev/console", O_RDWR, 0);
> > +		if (IS_ERR(file)) {
> > +			pr_err("Warning: Failed to add ttynull console. No stdin, stdout, and stderr for the init process!\n");
> > +			return;
> > +		}
> 
> 
> This breaks ARC booting (no output on console).

This is likely the same problem as with kunit and um kernels.
It is being discussed at
https://lore.kernel.org/linux-kselftest/X%2FSRA1P8t+ONZFKb@alley/#t

We have several workarounds. I am still squashing my head about the
right solution. The console registration code is like a vasps' nest.
It is always a pain when we touch it.

I hope that I will send a patchset for review later today.
In the worst case, we will revert the patch in the mainline.

> Our Buildroot based setup has dynamic /dev where /dev/console doesn't exist
> statically and there's a primoridla /init shell script which does following
> 
> /bin/mount -t devtmpfs devtmpfs /dev
> exec 0</dev/console
> exec 1>/dev/console
> exec 2>/dev/console
> exec /sbin/init "$@"
> 
> Buildroot has had this way of handling missing /dev/console since 2011 [1]
> and [2].

Good to know.

> Please advise what needs to be done to unbork boot. Otherwise this seems
> like a kernel change which breaks user-space and needs to be backed-out (or
> perhaps conditionalize on CONFIG_NULL_TTY. I'm surprised it hasn't been
> reported by any other  embedded folks

Two workarounds can be fount at
https://lore.kernel.org/linux-kselftest/X%2FSYhBZyudfnKY1u@alley/
https://lore.kernel.org/linux-kselftest/X%2FW2sl7RMvfaV4Ru@alley/

But I still see them as only a partial solutiuon. I still another sources
of potential problems.

Best Regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
