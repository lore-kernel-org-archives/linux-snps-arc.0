Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D7CC433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 17:05:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C20F22C9F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 17:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C20F22C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WFhE/fUx5FqqUSXxx8oonAn+9nIKrSUgUsEAV66PHIw=; b=pk0eE+eFo5Kf8FgHaFmRtTtLy
	0gfAjjMWTgdyFoR6PV48lvsAnedJWWW1nPdOilcqTKLj9VgjTDSUJLlfKCt88zVJG3nnK8OuxFLZQ
	WZTEddH+ysn0Ebf/sNJ+QI3L/N0pYrQILWgyE0/Tq1Ew84y6gQMbBaiPY5bUcZxsHWcad9PpAag0z
	IqTN90/SdL4BsyvuHQ4ZKVQy8P0YjN1AihKPNbdUiMfN3cs28L4mGk6k7oYkrzvA10ch9VbFwYblU
	RA83UH5G+Dl16QbcwE2fEbmRjtBUHb8YUAUn8LIwWOCzdmG+wv4iYhvs2jtUSeWGW3cXq0YT8C35J
	Nth5jYDDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxYid-0002jL-HR; Thu, 07 Jan 2021 17:05:03 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxYia-0002hj-Oj
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 17:05:01 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1610039097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MMfq/PKouT6ktPEQMdn1ZCdmFrDqGcaa8I0x2b98/NQ=;
 b=l8DMIk0AM0Lx8ZD6OSuzfMbW4nKMZ6WKVw4MmA4GAuTcv53Hdenl9On+h9HXtdA+/xAPXr
 cUe6J95cuctNrrZP/mnhnUDsoh5ySn3oqhO7saQZKtELu73+m19Bk2rkzJscpvzBePRNTR
 6UYUcPdDBWuo/CrWCbGlTwdwN74UYKg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 626DDAD57;
 Thu,  7 Jan 2021 17:04:57 +0000 (UTC)
Date: Thu, 7 Jan 2021 18:04:56 +0100
From: Petr Mladek <pmladek@suse.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
Message-ID: <X/c/ONCYz2QQdvOP@alley>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_120500_972516_BD825FC4 
X-CRM114-Status: GOOD (  18.67  )
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

On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
> Hi John,
> 
> On 1/7/21 1:02 AM, John Ogness wrote:
> > Hi Vineet,
> > 
> > On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
> > > This breaks ARC booting (no output on console).
> > 
> > Could you provide the kernel boot arguments that you use? This series is
> > partly about addressing users that have used boot arguments that are
> > technically incorrect (even if had worked). Seeing the boot arguments of
> > users that are not experiencing problems may help to reveal some of the
> > unusual console usages until now.
> 
> 
> Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
> console=ttyS0,115200n8 debug print-fatal-signals=1

This is strange, the problematic patch should use ttynull
only as a fallback. It should not be used when a particular console
is defined on the command line.

The only explanation would be that ttyS0 gets registered too late
and ttynull is added as a fallback in the meantime.

Anyway, I propose the revert the problematic patch for 5.11-rc3,
see
https://lore.kernel.org/lkml/20210107164400.17904-2-pmladek@suse.com/
This mystery is a good reason to avoid bigger changes at this stage.

Best Regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
