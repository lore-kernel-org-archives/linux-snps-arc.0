Return-Path: <SRS0=kWcA=ZT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AC2C432C0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 08:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1DE2064B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 27 Nov 2019 08:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N6mujLbW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY2M7DDe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1DE2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSCY0lDrOLHkEUN/v61yuesVvaY+QH8BRNbHzYusumQ=; b=N6mujLbWI5Dcwh
	TE7c5UB6qjBnOlWsC8kLU17t83N6A8d4/eeSySddiCn5KxCl8tz1+1wJ6tO5M/vxiPWjBFXMXHs65
	nNkWVyowGneYfu4MsRYOYkbR7JI6bebQoQPlbpKpEqr18kjdSD49L9yv0+qLYOjFgtcX1ut+p8fng
	jLlvtF4H7SGA3y2gKU128PrpPmcXXSDkp7Bo4yfaUn7SywP4AtWtVtL7LKa8GHM39SDRXibrZOLRF
	rBLBpCY486zu7EwcTkIjnie4dsr0CKrlBRgeY/0L0IMs9WG0gbDMB90O9OOvrInme4OPj7V9cSiaf
	+jL0BfBYlN+QXlsPRqEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZsky-0007MG-8T; Wed, 27 Nov 2019 08:33:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZskw-0007Ln-2J
 for linux-snps-arc@lists.infradead.org; Wed, 27 Nov 2019 08:33:03 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D2332064B;
 Wed, 27 Nov 2019 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574843580;
 bh=EOkaLp9VA78EaVRbhZB/baFiW0sHTjl/nkgMW86i0J0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aY2M7DDejEL6xmYArZ2UWQXAU0S4CoK8Z8MIMiWqpU0M8qt++aKk4evt4kIDwGIFD
 lRXRX4lJUCookzsKRUyP/kPhxEifIGixPM9yR6N2BH8m5pD6snTcICKKfpYqD5zAKl
 EB1qPj5hIdF95KMASFCsK2+6cfNbL1NAnF++Rr2Y=
Date: Wed, 27 Nov 2019 09:32:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] ARC: perf: Accommodate big-endian CPU
Message-ID: <20191127083258.GA1834144@kroah.com>
References: <20191127080123.21890-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191127080123.21890-1-abrodkin@synopsys.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_003302_137139_7E52B613 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-snps-arc@lists.infradead.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Nov 27, 2019 at 11:01:23AM +0300, Alexey Brodkin wrote:
> 8-letter strings representing ARC perf events are stores in two
> 32-bit registers as ASCII characters like that: "IJMP", "IALL", "IJMPTAK" etc.
> 
> And the same order of bytes in the word is used regardless CPU endianness.
> 
> Which means in case of big-endian CPU core we need to swap bytes to get
> the same order as if it was on little-endian CPU.
> 
> Otherwise we're seeing the following error message on boot:
> ------------------------->8----------------------
> ARC perf        : 8 counters (32 bits), 40 conditions, [overflow IRQ support]
> sysfs: cannot create duplicate filename '/devices/arc_pct/events/pmji'
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.18 #3
> Stack Trace:
>   arc_unwind_core+0xd4/0xfc
>   dump_stack+0x64/0x80
>   sysfs_warn_dup+0x46/0x58
>   sysfs_add_file_mode_ns+0xb2/0x168
>   create_files+0x70/0x2a0
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at kernel/events/core.c:12144 perf_event_sysfs_init+0x70/0xa0
> Failed to register pmu: arc_pct, reason -17
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.18 #3
> Stack Trace:
>   arc_unwind_core+0xd4/0xfc
>   dump_stack+0x64/0x80
>   __warn+0x9c/0xd4
>   warn_slowpath_fmt+0x22/0x2c
>   perf_event_sysfs_init+0x70/0xa0
> ---[ end trace a75fb9a9837bd1ec ]---
> ------------------------->8----------------------
> 
> What happens here we're trying to register more than one raw perf event
> with the same name "PMJI". Why? Because ARC perf events are 4 to 8 letters
> and encoded into two 32-bit words. In this particular case we deal with 2
> events:
>  * "IJMP____" which counts all jump & branch instructions
>  * "IJMPC___" which counts only conditional jumps & branches
> 
> Those strings are split in two 32-bit words this way "IJMP" + "____" &
> "IJMP" + "C___" correspondingly. Now if we read them swapped due to CPU core
> being big-endian then we read "PMJI" + "____" & "PMJI" + "___C".
> 
> And since we interpret read array of ASCII letters as a null-terminated string
> on big-endian CPU we end up with 2 events of the same name "PMJI".
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: stable@vger.kernel.org
> ---
> 
> Greg, Sasha, this is the same patch as
> commit 5effc09c4907 ("ARC: perf: Accommodate big-endian CPU")
> but fine-tuned to be applicable to kernels 4.19 and older.

Thanks, now queued up.

greg k-h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
