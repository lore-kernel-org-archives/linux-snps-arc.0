Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3950CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:In-Reply-To:
	References:To:Subject:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3fKr+jO/s3X+bCg4o6KBHOZW+nCQ6BhXQYqwjaSZ1A=; b=jd07NmM4cfCbu2
	QWYK5cR+buNoSH16dwc8hlSLCW2RY99NmXzPkGTG+z1KtzFOwHwkKu1ncE7acELU/MQQCfzGjbVzb
	9uSaU/Gcb0D0J4ip2uWYvwZITGTLUuxQWLghYpHyzhyBgxx4YdKIsUjXo3/65sWy2RhFUj9Wo6FIJ
	iWD3ORjcWrHj1Fl/3Y4gIXJEs0td6QpwfFZdm3ECTmYI+hHLgjmXxqRtGNnRh7cKSSwy3eDUWlH++
	vgianUyjn39X48GpCtUiSU1neqk2kUYwdFY4qcy13y42hWppx3kKdzaAoWoEzqoFEkgX0MAdmNvHK
	fpMSNtAMIWGl8GFDTXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrI3G-00FX0w-Dl; Sun, 28 Nov 2021 11:08:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrI3B-00FWyh-SH; Sun, 28 Nov 2021 11:08:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id y7so9830654plp.0;
 Sun, 28 Nov 2021 03:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=RLGVormZNrRFWCDJ7jdRt19siDEPnOtSgoMRMWSMPpw=;
 b=JS75cm1kNmau6QTu2rqjTEH1lacCTylUddbQig/MfaOv87fU1R4ixeZwUTvWkojCLe
 FVsH5wJQluo9fnDCJtLxlNsFRugI2zkbabpCQ9VhDSP+vCMkQ9XcDyPUZsKoAN0XUVPp
 aHUTDQx+GNGjfhDN5ufjzO429xe7p71bZ6QrT/eU2apwdj3VV4bcd4Oz9OEiXGFLWmkO
 KTg66HtHflRGYT80QQO1K0h4MxrasFS2dEY2Sip94P5OybBl2LvseRqW7ZJqQswnXYN6
 Cntrs/UrWT/QrCgRauE5NdDXQthF0aHKCC9fzaz2Cb2jdPmYhTY0PX3z2F7VkaSzQTfW
 T9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RLGVormZNrRFWCDJ7jdRt19siDEPnOtSgoMRMWSMPpw=;
 b=O/LncbGoLpdLKlV24tj1sAFIqhDZAjT83i7gM8JiXVGcf/zkId/8TsIweGRo1wcQG5
 bUioK4N8ouXwa0LDHw1MFO//RVAMiEBovNMQ4H4CeCStQVh8TNPlZQ4YSo5fw6m+UX0d
 Hstu+5yWzjTztCP8mEdgAZnxFtzl0oX1S8v9v/H2nZ5Q2E84VWxxVEOAv2cpDIaZOmAR
 W+iGhtgeN91mZmHEhEIu2uazt8In+f4ebJR3mBCaHaUkAxfD7xG+FVlatCwiNXi5F0Wh
 QNg8Qdjd9f6WuHSlVFdpeDBb/QRC/gOiR8BlyDQnUnGLAXuDMheQC9QBM/o1B+L1dKGz
 fH0w==
X-Gm-Message-State: AOAM530VpeLVcobu4puQTGOHUTNsLmJItcxzgjghL3p5Xf0PVbVLT3n6
 U/1HkulIebpFe7Jju5bpd1Q=
X-Google-Smtp-Source: ABdhPJwy0Op9mcVC2NuBsFMopKknqC2dkNsLfr7KDw0piI/fX2AvzDRr44yqwWjkuQxAQyAX4DCrnA==
X-Received: by 2002:a17:902:7fc3:b0:144:e29c:228d with SMTP id
 t3-20020a1709027fc300b00144e29c228dmr51588052plb.4.1638097728470; 
 Sun, 28 Nov 2021 03:08:48 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id 9sm9412647pgq.57.2021.11.28.03.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 03:08:48 -0800 (PST)
Date: Sun, 28 Nov 2021 21:08:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/9] lib/bitmap: optimize bitmap_weight() usage
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Gross
 <agross@kernel.org>, David Airlie <airlied@linux.ie>, Alexey Klimov
 <aklimov@redhat.com>, Andi Kleen <ak@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Amitkumar Karwar
 <amitkarwar@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko
 <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel
 <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@fb.com>,
 bcm-kernel-feedback-list@broadcom.com, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Dennis Zhou <dennis@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, Christoph Hellwig <hch@lst.de>, Hans de Goede
 <hdegoede@redhat.com>, Ian Rogers <irogers@google.com>, Jason Wessel
 <jason.wessel@windriver.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Jonathan Cameron <jic23@kernel.org>, Jiri Olsa <jolsa@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Jakub Kicinski
 <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, kvm@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Andy Lutomirski <luto@kernel.org>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Marc Zyngier <maz@kernel.org>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mel Gorman <mgorman@suse.de>, Mike Marciniszyn
 <mike.marciniszyn@cornelisnetworks.com>, Ingo Molnar <mingo@redhat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Marcin Wojtas <mw@semihalf.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Solomon Peachy <pizza@shaftnet.org>,
 Petr Mladek <pmladek@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Roy Pledge <Roy.Pledge@nxp.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Stephen Boyd <sboyd@kernel.org>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Sunil Goutham <sgoutham@marvell.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Tariq Toukan <tariqt@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
 Tejun Heo <tj@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vlastimil Babka <vbabka@suse.cz>,
 Vineet Gupta <vgupta@kernel.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
Message-Id: <1638096766.3elxdzb8ly.astroid@bobo.none>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_030853_969086_59D176FD 
X-CRM114-Status: GOOD (  14.49  )
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

Excerpts from Yury Norov's message of November 28, 2021 1:56 pm:
> In many cases people use bitmap_weight()-based functions like this:
> 
> 	if (num_present_cpus() > 1)
> 		do_something();
> 
> This may take considerable amount of time on many-cpus machines because
> num_present_cpus() will traverse every word of underlying cpumask
> unconditionally.
> 
> We can significantly improve on it for many real cases if stop traversing
> the mask as soon as we count present cpus to any number greater than 1:
> 
> 	if (num_present_cpus_gt(1))
> 		do_something();
> 
> To implement this idea, the series adds bitmap_weight_{eq,gt,le}
> functions together with corresponding wrappers in cpumask and nodemask.

There would be no change to callers if you maintain counters like what
is done for num_online_cpus() today. Maybe some fixes to arch code that
does not use set_cpu_possible() etc APIs required, but AFAIKS it would
be better to fix such cases anyway.

Thanks,
Nick

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
