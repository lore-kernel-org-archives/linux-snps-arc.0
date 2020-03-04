Return-Path: <SRS0=fm4X=4V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A51C3F2CD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2020 11:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7511F20848
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Mar 2020 11:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egaaMMut";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="qUya1I+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7511F20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kezl49Fn/Xmk5yF1pN+3L3P5fq2ya69G57MdJf6sxFY=; b=egaaMMutqG47UH
	bY/P1tC/fDZAM9dub4VwaRBv3nHCCdXXLsa6RkBbpfjQK5iQJStIe9H3sDwidbo/id6sEj7B80Qst
	qMmy/qpTK8kZuGGrZxytHgR2q6YJ/TnvEoHLGjEfs7FHz5DRZyKPuKJipE5+q5QM1uHvb2yDDowBK
	8Giz1SqBCvwJVTjCAgNQ51W0OBK1E1/9GCgS5abvDrnwfM1GU48VesC2nwU6MZpWWnJvM3wsNoScH
	0AETqGpGuSrZxqotJ83k6tpS0hK3GhPnvGczJLv/tXx/5D5BYj5S9jabx/Oh2Xn9miER/QBHPlRSB
	SJCIB7I+GRUEbPigRRpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9SDT-0000ac-9r; Wed, 04 Mar 2020 11:29:31 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9SDP-0000Z4-9Z
 for linux-snps-arc@lists.infradead.org; Wed, 04 Mar 2020 11:29:30 +0000
Received: by mail-qk1-x743.google.com with SMTP id j7so929699qkd.5
 for <linux-snps-arc@lists.infradead.org>; Wed, 04 Mar 2020 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Jx+iSwpjH1MMUgtvqiqrwQ2sYugCQ9UmLyXay35eB1Q=;
 b=qUya1I+ID7bIC0Bkj4Q0zp0EdHdSdO6ykJWvMXw4HKDFjWyXV8ds3Bs9MArm+vdQdc
 RpunjqglWR6mGJe2Lv7g9advYS1SvRo9LA3gCW5QqI/AMIgsHiHRUFAsdYeij2rtzyTk
 sNSh4wHESGW+6lSzw7OKW4psbfNeqxjoimBZufpM/BoHmrYBRoQNs3Xc2GtPgWnsfXPf
 igl3aC/5VPWbzpP3KfCNQ0wpC8Mh4VlwHq19u+9gw6f3Ulw8FCMZG8YCqNbscon2aj4Z
 WYfZ5PGzedI3tG7vyVtTX+unDExTi5VMHoWYOeG+xlDzhECpmkCqkM7aufo6LUVMsIwj
 NApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Jx+iSwpjH1MMUgtvqiqrwQ2sYugCQ9UmLyXay35eB1Q=;
 b=lLUtTiJwAp2SxJodPqNbKWthiI16/EC3v2DA8WkQ2/N6IMrXDVS+YWZe3ZpyLPs8TZ
 gGl/mhopZNAwUN4Z7jZAI85nw+qqIF+z/DQy6z+keij5afhBK+F0SXEI7xB80RN7QhaZ
 w6C9TcnpR+BjX+nBymO8PkusrlbBj07sQRJHUXUF6s1dhl0ZH3MS738H36AuV2SC/6Sp
 MzIryMVHgWMvCxzqJnxNwyE4ACGJnQ1KVDni+mKsxZowuMATiKhazxG0ioiMkRBO6xa6
 LwscOE6jXXEyv8FjOOKQYv3vd71hz7X/Z+DEeSx4GPv3HTgSaoEe6U464Luk0x63/38c
 hBtQ==
X-Gm-Message-State: ANhLgQ2sciwL8ZHaSyJ5QSLIpsYfU/4OqGLYYgkQ+leGnJZrsbZpbHO8
 i8KB3mlxS4wHqqSWscCDEAJOQQ==
X-Google-Smtp-Source: ADFU+vsraAELUldtqJkt+JLHLEkp9XWZWryntOEccYsrwg70reKk2W+439zfYVSLClVswo3lxz5LLw==
X-Received: by 2002:a37:6115:: with SMTP id v21mr2464683qkb.105.1583321365177; 
 Wed, 04 Mar 2020 03:29:25 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id u48sm85943qtc.79.2020.03.04.03.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 03:29:24 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
Date: Wed, 4 Mar 2020 06:29:23 -0500
Message-Id: <11F41980-97CF-411F-8120-41287DC1A382@lca.pw>
References: <c022e863-0807-fab1-cd41-3c320381f448@c-s.fr>
In-Reply-To: <c022e863-0807-fab1-cd41-3c320381f448@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-Mailer: iPhone Mail (17D50)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_032927_339901_438E1F9D 
X-CRM114-Status: UNSURE (   6.99  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



> On Mar 4, 2020, at 1:49 AM, Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
> AFAIU, you are not taking an interrupt here. You are stuck in the pte_update(), most likely due to nested locks. Try with LOCKDEP ?

Not exactly sure what did you mean here, but the kernel has all lockdep enabled and did not flag anything here.
_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
