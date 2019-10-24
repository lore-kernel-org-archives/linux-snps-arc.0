Return-Path: <SRS0=lfWa=YR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A656ACA9EAF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Oct 2019 16:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79560205C9
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Oct 2019 16:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LIPebFjv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="sB2Jn2rl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79560205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oSEspAleO3poQvvV0/jGzf4kP88blSMnV6ewTucn4NU=; b=LIPebFjvkRgI0E
	U4S9SBC8ARM99PClovR7h03u390Nbea0fjEhsEXWoDPpChYAs0KDlbgwt/WQ+Kka9ZYxu32WNrXgL
	VxK+6xG+wHUAE7IA1Vax+kbZQuIchAUNwulE5eqTfZgmw5t2qts/iZbn7oeRbpX+gODoPP7cCIewh
	bHNnlftJxR0RW3k8EE/d8VQFwBJM0JjBn3RlM8kkPYiSfutw49QrXz5khV60St9h3WvRufvYeSn0q
	5sxsb7YHezBjrHFn1C1bks31bpquaxZmu69nZxj7/sIno7HGWfQjAycGvjNhcJRMtwZzG2ENO/g5M
	c0Ngve1s58tkcZxNgIVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNgLM-0006N7-0F; Thu, 24 Oct 2019 16:52:12 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNgLB-0006CG-0B
 for linux-snps-arc@lists.infradead.org; Thu, 24 Oct 2019 16:52:02 +0000
Received: by mail-qt1-x844.google.com with SMTP id m15so38946452qtq.2
 for <linux-snps-arc@lists.infradead.org>; Thu, 24 Oct 2019 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=MD1pbzPN74Cooi+p6oJbLof2wiDKOMhFaRekjLXUrZs=;
 b=sB2Jn2rl37IzEiSgyk42DahVjDex25NdgPPfI1R0zFA09tT7ZrEMPasarAoAIcvKxN
 +n+x+G/+I18JPbiGrp5t2JZcqhYPVeiElEGSvhaL9nzJ8Ww77rBhXEczirB9UWDjC+HR
 FGu6S9JSyxY5ETieOFNYQcEvWt2BfiJWwkUuEuoDsJvJztOWzJQGE+BFr2DaG5QlopyQ
 ABJd/lChwAngBkE3q9AXNi+BbvxqNkFBoPMDPmKsYKQMDx8sAaTnfM/AZCbzTa94uXWS
 F+ZruUfTIm9SwZJdBHY7xPH/3MaUjJC8g0ITbr2z/pLULsaIH5B4UY62/g4sqHyx5zRc
 ID7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=MD1pbzPN74Cooi+p6oJbLof2wiDKOMhFaRekjLXUrZs=;
 b=JDV+MaMaKiEjSQJ2hzqTET3tdjG1jyyGpq2V6qAYjgsjv0zcg68f6R+EF/hiC3uelR
 bSQybLgJA+IXeexJBLGsSeuQUjM9OIEybIr49R8jvqgAvJoXeE1UpjaEm7GqpPB4wpLa
 uUwvqMXckMgZwLVu6afRb3LczmlyDoVDCgxT7BPabVIX8XRqPnFPPO42QBKeWQA6kea2
 2IGtjd49NkJpCqABkSC0swAcvhSTYPmBq9afMGxZd7GLanerpF+9fh2QgFQXj0yjHpJz
 mLuA+7himzTLYwtUc+RVnrWSQAd763xVqc8AkuxwYmhvyczbCDDizODWFvVr2EtYaSm4
 kvcg==
X-Gm-Message-State: APjAAAU4w12L4n+nXcu3ebrEaukqYVQW2kKyftoiFdgf9NwJowJub42/
 mYJfnx7ujVOXyQheY+OXKksv6zJPGgAjlQ==
X-Google-Smtp-Source: APXvYqxQOBVx3ITKJVFCZM4JTBqxBQ++B+FV+OPeFAZHzhypJMMzaZu2sZwLWN1gjap9nOuKNtEYxQ==
X-Received: by 2002:ac8:1b45:: with SMTP id p5mr1975446qtk.330.1571935918881; 
 Thu, 24 Oct 2019 09:51:58 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id u9sm1610352qkk.34.2019.10.24.09.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2019 09:51:58 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V7] mm/debug: Add tests validating architecture page table
 helpers
Date: Thu, 24 Oct 2019 12:51:57 -0400
Message-Id: <FCAFFD72-3781-4474-8393-A4E40264473A@lca.pw>
References: <1571625739-29943-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1571625739-29943-1-git-send-email-anshuman.khandual@arm.com>
To: Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17A878)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_095201_042250_84E9DBD5 
X-CRM114-Status: GOOD (  10.59  )
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
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



> On Oct 24, 2019, at 10:50 AM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
> 
> Changes in V7:
> 
> - Memory allocation and free routines for mapped pages have been droped
> - Mapped pfns are derived from standard kernel text symbol per Matthew
> - Moved debug_vm_pgtaable() after page_alloc_init_late() per Michal and Qian 
> - Updated the commit message per Michal
> - Updated W=1 GCC warning problem on x86 per Qian Cai

It would be interesting to know if you actually tested  out to see if the warning went away. As far I can tell, the GCC is quite stubborn there, so I am not going to insist.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
