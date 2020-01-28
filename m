Return-Path: <SRS0=i8W8=3R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A4FC33CB2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 19:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC9F2468D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jan 2020 19:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oI6AmaIy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="rZzl+qEA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC9F2468D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBUhUSxWAx8PVUdDoa1fjR4tUMmTVtuC6PWoRlyYnYo=; b=oI6AmaIyvzNPDX
	irfBiGNdo68Y6z/3CfHxLnuC+cF9jkOQASw8ePgEzLgw4TDddsNvl+sVE2RzLlFkMY4OHo6VfIsu8
	tj67P2OhkSMkqzfjRutTa1IFMcs3FXK70oB80ZbvyqPwuVe2jwt7fF6GzxIyE3pvaHiYhLC5qRGB+
	utU5Wb4f4yGmU0k/W2RzcDJaYqBhWnheExzM/ik3wwSUu38RT8BFdLse5DKK2OeDm/wlN5kwT4WyP
	WYjVP6Z2RlxzJY5V8x0RbsljTi14Iggw5fT0eyB4bbE9ZtMmgO0Jjg9KU3dHdAP/aDaVWeTU2y8xs
	sC7mxQnGDRfxmxQObrCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwWCj-0000eR-Kl; Tue, 28 Jan 2020 19:07:17 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwWCg-0000dO-OO
 for linux-snps-arc@lists.infradead.org; Tue, 28 Jan 2020 19:07:16 +0000
Received: by mail-qt1-x842.google.com with SMTP id w47so11163187qtk.4
 for <linux-snps-arc@lists.infradead.org>; Tue, 28 Jan 2020 11:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=ZSIv5JurPysNixS3YWSkJ+cqh/2vHLB/JAVHcGR/4Zo=;
 b=rZzl+qEAYLTBtMp9ssPK9Ejc0IQXfIjcMlCwc8RZJ/Poapm8WZnOmSKjpPGU/CRTsz
 s49j6egQsNv+bATXo82MSoiXpQi3N3QHvgnyq6VfzcooOemBU6djud+xflwQG7RGqoPc
 L5M9+QbKcXOUUg0U09rJgFyuy4M0BvZq0fS3S49pfbq8xDC/uRvuAV9T3NJ2dNoyS3t+
 r0VLb2Wpo+pntt9bwsRP15mZe1cOZg5vc4u8F4VRwv/pqDLOhfKGv0d7nyNY7llsOI2p
 sOz+jYkbLFQ6oe89WgJeyG/Pa023GcDt5lsRxS1gRMmySONFqvaE1MUA5AHjPWyKvzIK
 /yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=ZSIv5JurPysNixS3YWSkJ+cqh/2vHLB/JAVHcGR/4Zo=;
 b=henMV6jdj2PVCUZku7m69HL/97wH2Sf8uu7jOeJJNWSDJaSzHSYZL4kJZilh6CN/ZT
 XGBfB4T62ZvuCh7czRYMAx1cepQciSvWSBi6jwmEGefoD+x1TRO7VYVkMbsRMxqSaXXc
 81TX5CAzhNArmrTG8IzeW2v0G3hbolrCyvCoKCDnraeIikrNL+mOhQA3k1opBCh7bCi9
 dzM0aRZQ+hj8BGlNRYcSxGStK1Y0EqoMbSrF5mOkrU+sttsR2M6P8VdH2ldlnC4Pcxnk
 6k5tUKD022qiwDO+hm0Fv5rl+xouOhaMrb/bIk/pJNO3aHTGDIPUcpIpnrVvB1AiSZEJ
 IvOQ==
X-Gm-Message-State: APjAAAWTEtFDNE3NAmKp2rLlbHUdBV+p7Qq2StD/ZAv1P/bmHDEMIhmF
 HHcuU1Yyim7uEEduuT9Axwroxw==
X-Google-Smtp-Source: APXvYqwfcEAdtsZ+rCamZtj0MvoXkHQbqikImH2K21Z7lN9o0ZlEjUgJncOajxaQBGEujZOyMJYZkQ==
X-Received: by 2002:ac8:2b86:: with SMTP id m6mr23384923qtm.190.1580238432152; 
 Tue, 28 Jan 2020 11:07:12 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id f7sm13273329qtp.86.2020.01.28.11.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 11:07:10 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 14:07:10 -0500
Message-Id: <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
References: <20200128174709.GK655507@arrakis.emea.arm.com>
In-Reply-To: <20200128174709.GK655507@arrakis.emea.arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_110714_825213_9EC80952 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 Vlastimil Babka <vbabka@suse.cz>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



> On Jan 28, 2020, at 12:47 PM, Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> The primary goal here is not finding regressions but having clearly
> defined semantics of the page table accessors across architectures. x86
> and arm64 are a good starting point and other architectures will be
> enabled as they are aligned to the same semantics.

This still does not answer the fundamental question. If this test is simply inefficient to find bugs, who wants to spend time to use it regularly?  If this is just one off test that may get running once in a few years (when introducing a new arch), how does it justify the ongoing cost to maintain it?

I do agree there could be a need to clearly define this thing but that belongs to documentation rather than testing purpose. It is confusing to mix this with other config options which have somewhat a different purpose, it will then be a waste of time for people who mistakenly enable this for regular automatic testing and never found any bug from it.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
