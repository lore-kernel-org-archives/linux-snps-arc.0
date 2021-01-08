Return-Path: <SRS0=cuW9=GL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D073C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 09:30:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B2A22BE8
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 09:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B2A22BE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lsm2+EN456u4S1rkz8Nw556fRZ0iimXKsyOjSZIa0k0=; b=2JGzbY2AsBLOyS7OSc4N9ba8G
	di4QSV7fClPMPKP8JaL75jG4uq+PpU2Uf3taW6YOM0F7/4GPfBDIEYQLIe6Qsnc5PGshQKoxrTFHb
	RpLLzK+mNtx0Kqx7ktalPiEFT7ViN1zNaJywUjiZtEQMDqq44rFfLeIgQ6pnUcQiISV4tz8+J959R
	mVEkZRsxOfBmCaTUlBeGl1C4YiUIdOwW51UBTkQ+7sBLSpyYX6pMMI3BbQkf20gTSlxBpfev6Tu1E
	j86hadkHHKrERB6uib06G8JnG1H5spPerCOUqCGEWnKS8txRuJwMd1AK6HvaTHwsqLfJQtQ8tjDWL
	qt3nc+pyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxo6T-0005Fy-Uv; Fri, 08 Jan 2021 09:30:42 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxo6P-0005DE-MI
 for linux-snps-arc@lists.infradead.org; Fri, 08 Jan 2021 09:30:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1610098234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xfgKJpMAHp8Rvytw3TE0W+1mkInelAxdQ/ewwANtj8Q=;
 b=C9zvaA4tcvVEzY61cFjTG0aG6Xs3pGfGgZ5ltAWj6AwsAN6jEzLoYT3Zg2GfiX/PFAd6YK
 HKCLR0e1Pc5yHesrNNe0VMKDO301cl1S9ade8FWeJ/vZ5mosclvvuDUlbsUCH/6GUaG90W
 09bOjXnMVIoHJUmT5ugwEX1JSE7kEZs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3887AACAF;
 Fri,  8 Jan 2021 09:30:34 +0000 (UTC)
Date: Fri, 8 Jan 2021 10:30:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
Message-ID: <X/gmOSvgzrPxBdIk@alley>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
 <X/c/ONCYz2QQdvOP@alley>
 <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
 <X/fWGjYI5LapMdGW@jagdpanzerIV.localdomain>
 <d7db7948-4831-8dac-0d16-7933bcd9d995@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d7db7948-4831-8dac-0d16-7933bcd9d995@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_043038_148024_9F58177D 
X-CRM114-Status: GOOD (  28.10  )
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

On Thu 2021-01-07 21:18:20, Vineet Gupta wrote:
> On 1/7/21 7:48 PM, Sergey Senozhatsky wrote:
> > On (21/01/07 09:58), Vineet Gupta wrote:
> > > On 1/7/21 9:04 AM, Petr Mladek wrote:
> > > > On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
> > > > > Hi John,
> > > > > 
> > > > > On 1/7/21 1:02 AM, John Ogness wrote:
> > > > > > Hi Vineet,
> > > > > > 
> > > > > > On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
> > > > > > > This breaks ARC booting (no output on console).
> > > > > > 
> > > > > > Could you provide the kernel boot arguments that you use? This series is
> > > > > > partly about addressing users that have used boot arguments that are
> > > > > > technically incorrect (even if had worked). Seeing the boot arguments of
> > > > > > users that are not experiencing problems may help to reveal some of the
> > > > > > unusual console usages until now.
> > > > > 
> > > > > 
> > > > > Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
> > > > > console=ttyS0,115200n8 debug print-fatal-signals=1
> > > > 
> > > > This is strange, the problematic patch should use ttynull
> > > > only as a fallback. It should not be used when a particular console
> > > > is defined on the command line.
> > > 
> > > What happens in my case is console_on_rootfs() doesn't find /dev/console and
> > > switching to ttynull. /dev is not present because devtmpfs doesn't automount
> > > for initramfs.

I see. I did not though about a possibility that /dev/console could
not be opened from other reasons.

> > I wonder if we'll move the nulltty fallback logic into printk code [1]
> > will it fix the problem?
> > 
> > [1] https://lore.kernel.org/lkml/X6x%2FAxD1qanC6evJ@jagdpanzerIV.localdomain/
> 
> Your reasoning in the post above makes total sense.
> 
> I tired the patch: adding register_ttynull_console() call in
> console_device(), removing from console_on_rootfs() band that works too.

IMHO, this worked because you removed the change in console_on_rootfs().

I guess that the change in console_device() did not make any
difference. It was likely not called because
filp_open("/dev/console", O_RDWR, 0) failed earlier because
/dev/ did not exists.

Anyway, the proposed change in console_device() has some
more problems that I realized this week:

   + It does not check whether console_drivers really contains
     any console with tty binding.

   + register_ttynull_console() calls
    add_preferred_console(ttynull_console.name, 0, NULL).
    The ttynull console stays preferred even when any better
    console gets registered later. As a result, it would
    stay associated with /dev/console.

The right solution would be to enable ttynull console and
do _not_ modify the list of preferred consoles. And it makes
sense to add the console only there is no console with
tty binding at the moment.

I still have to think whether console_device() is a better or
worse location for adding tyynull as a fallback.

Anyway, it has to wait. The proper solution can't be done easily
with the existing register_console() code. We need to clean
it up first.

Best Regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
