Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8A9C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 13:14:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD43C223C8
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD43C223C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R7D+B7wXPPNvSLeNz1IqGjhMEko/1FAc1KGW8XrsSu8=; b=fAYWX+jj2CQ5c8NogSYTIwh0r
	Jsz3gnW3DfkG5w7klHSsIgsXQMfX6/RN1oc0tW8xp7XoYJ872dEhoe1VTsFbsz3LvbxzImjcGTlsc
	lRLQVkdPegqpr3PDlnocnxqAOlGZhpGiArlmk8EAG5yIsdWrbCFxZ/IaDw9Ux1NMYCzRCBgpq1TOS
	ql/wrHbDjhu1PeYtRT6XWlmU937EOki47xjAgbg0J+H3cxCJmlAhYDhzUL/xpXRfMa+czpa6RWahz
	tFUAc6k6U/6MKEeHqrgY6RQdo2BEVAYcn6QiwNIcFT/FSJu4UZbi1h3z99NetxP5wa6zI6tgFisxL
	Gz2HVcu4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxV7Z-0000ns-AE; Thu, 07 Jan 2021 13:14:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxV7X-0000nV-6J
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 13:14:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CE4B22285;
 Thu,  7 Jan 2021 13:14:25 +0000 (UTC)
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
To: John Ogness <john.ogness@linutronix.de>,
 Vineet Gupta <vgupta@synopsys.com>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <ac2aaa56-deca-8644-2a42-ca8ee8a77883@linux-m68k.org>
Date: Thu, 7 Jan 2021 23:14:22 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8735zdm86m.fsf@jogness.linutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_081431_320874_5AA7BFE2 
X-CRM114-Status: GOOD (  13.29  )
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
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi John,

On 7/1/21 7:02 pm, John Ogness wrote:
> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
>> This breaks ARC booting (no output on console).
> 
> Could you provide the kernel boot arguments that you use? This series is
> partly about addressing users that have used boot arguments that are
> technically incorrect (even if had worked). Seeing the boot arguments of
> users that are not experiencing problems may help to reveal some of the
> unusual console usages until now.

I can show an example for m68knommu which this change breaks too
(with no console output on boot).

All the ColdFire dev board targets (arch/m68k/configs/m5*) have a 
compiled in boot argument which is "root=/dev/mtdblock0". They have no
real mechanism to pass boot arguments from their boot loader, so it is
compiled in.

The default mcf serial driver is the console on these and no 
"console=ttyS0" argument was required in the past.

Regards
Greg



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
