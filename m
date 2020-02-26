Return-Path: <SRS0=BbR1=4O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED57C4BA12
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 14:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883D321D7E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Feb 2020 14:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fs9ZxIZj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="F43a6Y7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883D321D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CK53Rqk7g22Nxc3Ww4vP5VHQSh7AZTUk7z87hdOkipU=; b=Fs9ZxIZjeKUmHlboBThOV29Ia
	DO0zfC0RzlZ26QZ1+2nV143FCHQPW3vdOGCwODa6m4Gi109gKNJAtbBV9Mq+pjXBSF4tLsnDReP5x
	PMpn2Ke74CRj+BGORnw+z4Xh8wkSG3O1Cd185lZR8GC2vwEBzdwsH/hZ9O57FLHF/FcPyP7xxvPI0
	Nx4/9flghzlD9oRboLHX8jwm8BGUTdtZ2iLsNPAluuurCv6V3EOXDqd4Bwr6+0L25FFdEokHbObj5
	Laufw7foC1Ps9uT54Mt766NkoT6jEJXktevnrmG3d8z5TjH8uUo5OTJc1dDIXEVRvrXeIfMh+uFi9
	s+z1VaJgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6xvh-0001lp-1d; Wed, 26 Feb 2020 14:44:53 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6xvR-0001XQ-JE; Wed, 26 Feb 2020 14:44:39 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SJV63yfQz9tyg0;
 Wed, 26 Feb 2020 15:44:30 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=F43a6Y7B; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YgDcVuTElqgx; Wed, 26 Feb 2020 15:44:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SJV62fxZz9tyfy;
 Wed, 26 Feb 2020 15:44:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582728270; bh=eO3lF+ZJhQsxeyroK19gjLYfnwGpenLTxOUpnfp6wIk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F43a6Y7Bxj1cRpGgJ7No4+FNv3wTeZbfoxyElYJ0hEHpoYieZmf8wLqib3772js/j
 V7r+2th2c39Iqgq6QxqRNoWCuCyEV5w4Ghrc4DhY5VHlRD+vD7FF2/hwfv7xQkX5JV
 +qPa3ePbwcE1RNrdMbzmCHIISGg1CoUMAAXeaTgU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C9FD18B857;
 Wed, 26 Feb 2020 15:44:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ES6wKYHYICe8; Wed, 26 Feb 2020 15:44:31 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D97098B776;
 Wed, 26 Feb 2020 15:44:29 +0100 (CET)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-mm@kvack.org
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw> <1582726340.7365.124.camel@lca.pw>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <eb154054-68ab-a659-065b-f4f7dcbb8671@c-s.fr>
Date: Wed, 26 Feb 2020 15:44:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582726340.7365.124.camel@lca.pw>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_064437_929771_0CA03292 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAyNi8wMi8yMDIwIMOgIDE1OjEyLCBRaWFuIENhaSBhIMOpY3JpdMKgOgo+IE9uIFdlZCwg
MjAyMC0wMi0yNiBhdCAwOTowOSAtMDUwMCwgUWlhbiBDYWkgd3JvdGU6Cj4+IE9uIE1vbiwgMjAy
MC0wMi0xNyBhdCAwODo0NyArMDUzMCwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+Cj4+IEhv
dyB1c2VmdWwgaXMgdGhpcyB0aGF0IHN0cmFpZ2h0bHkgY3Jhc2ggdGhlIHBvd2VycGM/Cj4gCj4g
QW5kIHRoZW4gZ2VuZXJhdGUgd2FybmluZ3Mgb24gYXJtNjQsCj4gCj4gW8KgwqAxNDYuNjM0NjI2
XVvCoMKgwqDCoFQxXSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxpZGF0
aW5nCj4gYXJjaGl0ZWN0dXJlIHBhZ2UgdGFibGUgaGVscGVycwo+IFvCoMKgMTQ2LjY0Mzk5NV1b
wqDCoMKgwqBUMV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gW8KgwqAx
NDYuNjQ5MzUwXVvCoMKgwqDCoFQxXSB2aXJ0X3RvX3BoeXMgdXNlZCBmb3Igbm9uLWxpbmVhciBh
ZGRyZXNzOgo+IChfX19fcHRydmFsX19fXykgKHN0YXJ0X2tlcm5lbCsweDAvMHg1ODApCgpNdXN0
IGJlIHNvbWV0aGluZyB3cm9uZyB3aXRoIHRoZSBmb2xsb3dpbmcgaW4gZGVidWdfdm1fcGd0YWJs
ZSgpCgoJcGFkZHIgPSBfX3BhKCZzdGFydF9rZXJuZWwpOwoKSXMgdGhlcmUgYW55IGV4cGxhaW5h
dGlvbiB3aHkgc3RhcnRfa2VybmVsKCkgaXMgbm90IGluIGxpbmVhciBtZW1vcnkgb24gCkFSTTY0
ID8KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
