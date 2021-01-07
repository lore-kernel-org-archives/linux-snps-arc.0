Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=BAYES_00,
	BUG6152_INVALID_DATE_TZ_ABSURD,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INVALID_DATE_TZ_ABSURD,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEB1C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 09:02:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B33E2313B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 09:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B33E2313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HQ9fuslji1DERWa1/KUFQDpurWBPs/Purp4ap41IRRU=; b=fvf8RDT7Z61qLKaMgDxx6pU5n
	xmofGjKoDB3RZTIoG9HpZVzPw+mUrOz00rNyhqI2/twKMxKNb5U4ekb2f0BCo3Xv/0+3aydZtCFP9
	BWWU8JYGrhWh862BLK2UyI1NaRh/3SdMkAmvjk7o49NWyS4XnEvRiPeuhLUhjMJG/O11XfbhdM/T9
	f5my9XuWnsLTailhA0wOMf4cRFXEHgck2jD4mjfe9LnXblf45WsNI2eiLemNevmRMt2cePKqiUYId
	NlEoo+XKZrpLAp6691yHAujzIDFwOS7mAcS+rcnJuh8ueA7vq4//ua17pZzTnw7g/3VOaj7/uIDIl
	TIOdJXJyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRBQ-0003uy-C1; Thu, 07 Jan 2021 09:02:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxRBN-0003su-Ut
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 09:02:14 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1610010130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVXm8eLyu9SHQUOj7PCWR7viWOvxmFLsGxPEqO5tchs=;
 b=3zIkgnQwiutgllhJI+dulqEta0vLyVMkxev2q/+IXrilO8QScqYYax2H2yC+nvJwL3jjV/
 ijDlRfGHGoZi27ASPmsTx8WXgMYbnvBoNBNwGXIi0W/4KRzd8NYRuTCddJiC0cXBG/vU78
 mz0mz6hcTNz4TIPQ6FarKMNBz4hPcz4/Q7kmNMC+l6tKUMCEcLePEM2qC059PtweUQGa8U
 KepyyS7qpgPBDxv3gaM8uZltA6KzcIs0L8FFid7gdk33h3PVnxhP2p5NgBjaE8V5dr6coC
 oKdKhZR6MUOFNY1G/O2gyY/kHt2J1MGBIEmD3QA8VNlEnT/bAe2ZRMasKcXfsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1610010130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zVXm8eLyu9SHQUOj7PCWR7viWOvxmFLsGxPEqO5tchs=;
 b=IjGPX0bES31qEuYvRNFDP+4I9ii3bzJW7f8Bpm+h8+jlNt0FLo1NoLXETUkdDWbNFjRg1q
 P7PrGQzl3vW4LuCg==
To: Vineet Gupta <vgupta@synopsys.com>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
In-Reply-To: <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
Date: Thu, 07 Jan 2021 10:08:09 +0106
Message-ID: <8735zdm86m.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_040214_120717_49F199CE 
X-CRM114-Status: UNSURE (   5.12  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
> This breaks ARC booting (no output on console).

Could you provide the kernel boot arguments that you use? This series is
partly about addressing users that have used boot arguments that are
technically incorrect (even if had worked). Seeing the boot arguments of
users that are not experiencing problems may help to reveal some of the
unusual console usages until now.

John Ogness

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
