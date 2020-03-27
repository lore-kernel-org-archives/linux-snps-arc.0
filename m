Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC6AC2D0EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 17:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0627F2082F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 17:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPtoTRdg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0627F2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JT3OuXdSdThQPKNvM6T/AT41Z56uEA4lfJyHH1Ti3HQ=; b=IPtoTRdgQpAwBx
	/WdpRooqrFjCPx6D+lZ/TKEF5uX6gVrGM8CcyImUzlDnuMR7mN40cjIuJd//FtmN7eClnQi1iwJqm
	Ywfxi31nMXGicM/REfKGqQqEzqBxFFf3V+wNuP3N71wAm0JMrDLVX9xqGM+5akxoWpgJxSr5FKAGQ
	OBG5yE5zDFwQHCK/6RlGrF4bD88f81Hb+l3p8CT2d3vM6PWrAuymHoA1F9HriHZCPKhdQO2qHXZc4
	8bqqEbgP6MatBqjGsLwfmKZjV2LYbCxgJsk/3DV46bZuBFe+/M9/9DPhfZxHyb9KykRIGZJfTTWLw
	iaOz4wppEWeItgVRRbmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHsV0-0004zf-3V; Fri, 27 Mar 2020 17:10:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHsUy-0004zB-29
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 17:10:25 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC18C206F2;
 Fri, 27 Mar 2020 17:10:22 +0000 (UTC)
Date: Fri, 27 Mar 2020 13:10:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [RFC] ARC: initial ftrace support
Message-ID: <20200327131020.79e68313@gandalf.local.home>
In-Reply-To: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
References: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_101024_360794_CC71DD65 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, 27 Mar 2020 18:53:55 +0300
Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:

> +
> +noinline void _mcount(unsigned long parent_ip)
> +{
> +	unsigned long ip = (unsigned long)__builtin_return_address(0);
> +
> +	if (unlikely(ftrace_trace_function != ftrace_stub))
> +		ftrace_trace_function(ip - MCOUNT_INSN_SIZE, parent_ip,
> +				      NULL, NULL);
> +}
> +EXPORT_SYMBOL(_mcount);

So, ARCv2 allows the _mcount code to be written in C? Nice!

-- Steve

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
