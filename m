Return-Path: <SRS0=zcuS=5S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11203C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 17:53:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D29D22074D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Apr 2020 17:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wizps+A/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D29D22074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4lNQDzHYS9lG4OeuErrZQ7rvxGFEJWAzb3ogDGunSvM=; b=Wizps+A/4dGs6B
	YVwLd7pqWob9OJl2MT9bl+ezOtAjiE2gyWobeiagED4Yx5m4VnmEM7FLCssUXfmnmfUSrhrNDT/4Y
	E7sTmafjG7BZx+kDI8WRHKDnKFdBC3Y/mH2GgJ44zAnVrZuXP5h4OZUHNkfAoEK8MQbLPHlJ8KLBA
	vrPx7BGFPd837NaRQdJXLKfe36OcjLVyCPXBhU4Fv4U25dvJMRztLRekomsDq6Zdyv9hyZCTY2zFQ
	QLQ1ui9GSW3+p6jHn0tcRgXlQNjQotDIKgUhKufk61Dxho5j0Isxt+gaYsn0WFvQMPl4Zzn7ZsOjW
	leWahtKrUd0OO54fqMig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK41Y-0002f9-Uv; Thu, 02 Apr 2020 17:53:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK41V-0002dm-OZ
 for linux-snps-arc@lists.infradead.org; Thu, 02 Apr 2020 17:53:03 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF9B82077D;
 Thu,  2 Apr 2020 17:52:59 +0000 (UTC)
Date: Thu, 2 Apr 2020 13:52:57 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [RFC] ARC: initial ftrace support
Message-ID: <20200402135257.7dd14f36@gandalf.local.home>
In-Reply-To: <fe7ae84c-745a-04b4-dcc0-5df8cc35ee0c@synopsys.com>
References: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
 <20200327131020.79e68313@gandalf.local.home>
 <fe7ae84c-745a-04b4-dcc0-5df8cc35ee0c@synopsys.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_105301_817108_76F549F1 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 2 Apr 2020 01:17:01 +0000
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> +CC Claudiu
> 
> On 3/27/20 10:10 AM, Steven Rostedt wrote:
> > On Fri, 27 Mar 2020 18:53:55 +0300
> > Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:  
> 
> Maybe add a comment that gcc does the heavy lifting: I have following in glibc
> 
> +/* this is very simple as gcc does all the heavy lifting at _mcount call site
> + *  - sets up caller's blink in r0, so frompc is setup correctly
> + *  - preserve argument registers for original call */
> 
> >> +noinline void _mcount(unsigned long parent_ip)
> >> +{
> >> +	unsigned long ip = (unsigned long)__builtin_return_address(0);
> >> +
> >> +	if (unlikely(ftrace_trace_function != ftrace_stub))
> >> +		ftrace_trace_function(ip - MCOUNT_INSN_SIZE, parent_ip,
> >> +				      NULL, NULL);
> >> +}
> >> +EXPORT_SYMBOL(_mcount);  
> > 
> > So, ARCv2 allows the _mcount code to be written in C? Nice!  
> 
> Yeah, the gcc backend for -pg was overhauled recently so it is a first class "lib
> call" meaning we get all the register save/restore for free as well as caller PC
> (blink) as explicit argument to _mcount
> 
> void bar(int a, int b, int c) {
> 	printf("%d\n", a, b, c);
> }
> 
> bar:
> 	push_s	blink
> 	std.a r14,[sp,-8]
> 	push_s	r13
> 	mov_s	r14,r1
> 	mov_s	r13,r0
> 	mov_s	r0,blink
> 	bl.d @_mcount
> 	mov_s	r15,r2
> 
> 	mov_s	r3,r15   <-- restore args for call

We really don't want this. :-/

This will make it really difficult to implement the dynamic ftrace, and
this causes more overhead when tracing is not enabled.

Also, ftrace is much more complex, and this will make it difficult to have
function graph tracing and other features.

Gcc has an "instrument-functions" which people asked me why I didn't go
that route, as it lets you do the same (call C code), and its because of
the overhead it adds to each function that I turned it down.

-- Steve



> 	mov_s	r2,r14
> 	mov_s	r1,r13
> 	mov_s	r0,@.LC0
> 	ld	blink,[sp,12]
> 	pop_s	r13
> 	b.d	@printf
> 	ldd.ab r14,[sp,12]
> 
> @Eugeniy, this patch looks ok to me, but a word of caution. This won't work with
> elf32 toolchain which some of the build systems tend to use (Alexey ?)
> 
> The above _mcount semantics is only implemented for the linux tool-chains.
> elf32-gcc generates "legacy" __mcount (2 underscores, blink not provided as arg)
> likely done by Claudiu to keep newlib stuff unchanged. Perhaps elf32 gcc can add a
> toggle to get new _mcount.
> 
> And this is conditional to ARCv2 due to future ties into dynamic ftrace and
> instruction fudging etc ? We may have to revisit that for BE anyhow given such a
> customer lining up.
> 
> -Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
