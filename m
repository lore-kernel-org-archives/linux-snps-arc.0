Return-Path: <SRS0=mK5U=3W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D332C3524A
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Feb 2020 11:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D1BA206D3
	for <linux-snps-arc@archiver.kernel.org>; Sun,  2 Feb 2020 11:26:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yp4+BvLc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="ktqi1Si5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D1BA206D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0NmyEANw3E/Av+E5IOupncvQ0iDhVwhqC5BX6cg7ts=; b=Yp4+BvLcL64fvp
	ZIxQR9gmn2Xbafo63bGMK4+reePILWHXAc1V0+ZMab5p+iG0DOvG4DWiC4dSLCEBgSLeKs039XHNJ
	OqmkFlDSzolKIU6lQGHPljAZlrVdjNWbLJMCjdDtN/ugIuTYRJjc7Upg1HEt9V7B5tjzesXXAczQv
	DYZ8+staIr7/Sj1dlnsxlb6SZLXL53v60s3nv7+0wWV+kwus9L8D5rGkt0Y+mJ4j4R8OFJ5cN+TJK
	N/XCti23KLpA5KwnguRGVgMOan4vWlQllF2T2Ns75g+xQWksxRv5mfEe1OywEvh/Ia7GPbaXgCZuW
	HLdz76bVj4eMyECsxPhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyDOj-00042D-Gj; Sun, 02 Feb 2020 11:26:41 +0000
Received: from mail-qk1-f195.google.com ([209.85.222.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyDOh-00041Y-P4
 for linux-snps-arc@lists.infradead.org; Sun, 02 Feb 2020 11:26:40 +0000
Received: by mail-qk1-f195.google.com with SMTP id j20so11398724qka.10
 for <linux-snps-arc@lists.infradead.org>; Sun, 02 Feb 2020 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=haUAAZdbmdU3COyJ/sqnDbNti6tUXhiH5WpEb5CUu3o=;
 b=ktqi1Si5IANgowqGSuWt2goxaefj9MArH9hBL4drDxYpQy5gO9eIMpaj4x1g9qz0Ft
 wJg8PZziG/0FMCaYMFvU0R1ed/sRIgt60RVYo/fiPoIuWPHtw5CoKADSbrdPinp59eNX
 GqmqoNXOemL5q0rosXYIx2UJ1orNdlYcFK73Ygg0a/RE2arXPeSnjr+QO/TuQNX54JbP
 bi9ii20//c0h4YooeibM3yZGm2vZjIxTdT2q1agyMmadm90FFuyO+OFJ2urFPdZeXwtw
 AgKWNyLv5Arxyw8debfI90Lt1gaaDIBA8bYeatlKiESPBREuLesS3poug3ybj8+iH21/
 Psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=haUAAZdbmdU3COyJ/sqnDbNti6tUXhiH5WpEb5CUu3o=;
 b=IhgWbfJUlFkUyqbuGxxYyMF/bbPbVTk3/yZaOs65QnKK/v3HUmQwRgwyVB3DNiWRKN
 BwF2NiUK95hD3k/AfOGna51Ny6Hd4R0VMmJhe+ri0XG4wgwp/y7uWv/0thUgHg7hdU9e
 9gEsCIYIPeqVeGMBB3pfTCGstSIDwo5Wq5x5dxq9X5RFVKDlpr3qhLQo+ROid+t8T4Tk
 6/bX22mUtPx44BnzfuRYVilLm8ctg4C+N4eUWXytIw5lVm53LhfOIc2VN10wce6sGglx
 l0Vmq10VUImZi7hiOOoAyAbSXeDyZm+v5NKS/3KyYnw2Hcj8RcHqWo/NXaL7UBmYuRrE
 IjnA==
X-Gm-Message-State: APjAAAXHimBq6S2xI51tyvOviEHwBDcrv/GhIk+oGim1zE6Th9YHbDd7
 C3ialuHMGmkk07s6f2Qx+mEb569295l0xw==
X-Google-Smtp-Source: APXvYqz2LMXXgwCpUXH7EnnO/Ck2Cj8Gc2SWzAj6pxocjOsHmdsAhT1kwXiGUD+liMIX2mq/rCkMKw==
X-Received: by 2002:a05:620a:218d:: with SMTP id
 g13mr19497581qka.286.1580642791619; 
 Sun, 02 Feb 2020 03:26:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id s1sm7274932qkm.84.2020.02.02.03.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2020 03:26:30 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Sun, 2 Feb 2020 06:26:29 -0500
Message-Id: <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
In-Reply-To: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_032639_818413_552CFA30 
X-CRM114-Status: UNSURE (   9.16  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
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



> On Jan 30, 2020, at 9:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
> config DEBUG_VM_PGTABLE
>    bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>    depends on MMU
>    default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
>    default 'y' if DEBUG_VM

Does it really necessary to potentially force all bots to run this? Syzbot, kernel test robot etc? Does it ever pay off for all their machine times there?
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
