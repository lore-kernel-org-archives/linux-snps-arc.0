Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDE1C677F0
	for <linux-snps-arc@archiver.kernel.org>; Sat,  7 Jan 2023 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+wKJTf4BbdGkyQs6AlEqn8A2LVBOxeq73iGMxiM/v4=; b=Hz7KtdMu0IFpnM
	H9WjNPDgJqg28I+2SJFcCBOObAnM/t0CI6C5W9d1W85qVO+kmMArQ1fx9a4ZspYTc86DRBL00CJ5S
	tN+PcpP0oaIV3t3pGJ2aFSpWsXN+3JEzq7WTKAWA8kFLENlhprTrA1Y7Erw5bQJD0HpANmWOrXlVD
	d9xqQgbkiBgyo5oQLBjFWcxMPh9I+rrE9noFtCPaLU2hGHQ9KdTZlF0uCRZkr0zUZ+QzdSqKTe6Iv
	OwiONVkoFv0B8lZKNkjRghvlaLbRwcrEu3m0uH8mSBrVMCiYcSQ6CX7wUZZsEKJIp1Z1Pg0akEe3M
	7tmF7KOUkF8Sr2t/PQZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE70V-004LuY-5O; Sat, 07 Jan 2023 11:04:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE70S-004Ls4-2x; Sat, 07 Jan 2023 11:04:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o15so2686414wmr.4;
        Sat, 07 Jan 2023 03:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jV2yBF+mbkDE0BvyOwe05ARE6EO7XhtOfB/KJLMsfFA=;
        b=BzPTx+ODS2RwGu5d9Av3CGI6XJ0NbmKP1pStUzg0M0m6+VF6wu2vf0tqTwK0k6q0qV
         Fbx7Y4Wluy9p+k8PZjL3FOoLufHJHxtq2K/BaarEwd/dPtd/DgO4uDiDqLUXCcfzSy4g
         Wd0wz4xfpZYGbxR/O6enZWRjIhs25ZrrKgwvTGouDcupcbkSfLeRveiApotbcr4XMgph
         w/4+08uhP/RwKAozhcyw6lYPvScMk8zL6fmWwbkyxQOkT9WdSUz8lze9ta3Mlh7zLg9k
         cM2v76pe7iQT/2ZR+EkGweLVXlhhfTIoWJwjo2u32vXfi3qjeDrWte72tROnSs3wxhtS
         1Wwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jV2yBF+mbkDE0BvyOwe05ARE6EO7XhtOfB/KJLMsfFA=;
        b=ySwtjwBZeLxIbOfl0AMj0zv7153oPDutsOoJjb/y/66jRAomMeSBuSGqk6Fm93L7dx
         +B6BPJ0sVf6y3PkzW1fm89FqjLOw74nGGnEuU7GQzmVY0aw7MfF6W4Rv3F6b6ZJP0U0K
         +4GUNlxkV1PojPyeElol5rV6TyUx+zbqvlpN3AWQbW21MAyC/9h1cpYBc5m96PISH1IT
         2OdqVtzwaaQueBH94zgJHl+6H8JgkJbdnDTvu5XMupUQkXk3uWlCJkPrR7gXSqB0z5OC
         rrTBQP3eHiIeznPlIm5kL5w8PwDDVDahVdl9Qs2W381abj01U6IABi8Dqfbgp5rhez5S
         1iMA==
X-Gm-Message-State: AFqh2kqaOCJebIsCNdhawlo0RscMCKSbaxtMGoF71HPyLkKpzjP12YBq
	5wng67e0suFtcFA+HsTO1O4=
X-Google-Smtp-Source: AMrXdXuUafS1AFxogNrZXZJj6k6oC1QjVGeJmfZCRFdf2sgwNHMbrVBUD4+y7GGme2gWJhcqxBhA0A==
X-Received: by 2002:a05:600c:601e:b0:3c6:e61e:ae71 with SMTP id az30-20020a05600c601e00b003c6e61eae71mr50341357wmb.1.1673089493118;
        Sat, 07 Jan 2023 03:04:53 -0800 (PST)
Received: from gmail.com (1F2EF507.nat.pool.telekom.hu. [31.46.245.7])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm10657278wms.31.2023.01.07.03.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 03:04:50 -0800 (PST)
Date: Sat, 7 Jan 2023 12:04:47 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	x86@kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3 3/8] sched, smp: Trace IPIs sent via
 send_call_function_single_ipi()
Message-ID: <Y7lRz7oCaAmAhoqS@gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-4-vschneid@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202155817.2102944-4-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_030456_193633_9E66E5DD 
X-CRM114-Status: GOOD (  13.24  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


* Valentin Schneider <vschneid@redhat.com> wrote:

> send_call_function_single_ipi() is the thing that sends IPIs at the bottom
> of smp_call_function*() via either generic_exec_single() or
> smp_call_function_many_cond(). Give it an IPI-related tracepoint.
> 
> Note that this ends up tracing any IPI sent via __smp_call_single_queue(),
> which covers __ttwu_queue_wakelist() and irq_work_queue_on() "for free".
> 
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Acked-by: Ingo Molnar <mingo@kernel.org>

Patch series logistics:

 - No objections from the scheduler side, this feature looks pretty useful.

 - Certain patches are incomplete, others are noted as being merged 
   separately, so I presume you'll send an updated/completed series 
   eventually?

 - We can merge this via the scheduler tree I suspect, as most callbacks 
   affected relate to tip:sched/core and tmp:smp/core - but if you have 
   some other preferred tree that's fine too.

Thanks,

	Ingo

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
