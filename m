Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315B8C2D0E5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 15:24:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06EE920748
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 15:24:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wl/vQrZd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="QJhesD4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06EE920748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBE1Xta8PlAEBYPF/yWjxFeJVW+YWIdONGtyxpINsHI=; b=Wl/vQrZd7yCqWqMIuSRRZJitk
	ayaxRtWGaAgQwy/fhxo7vm34IsbGGYaYYFcYS9OT15STmTdfzkbVGC+PxgwfnrMbE/eSxQ/mr3e/x
	rGo3W1CQ6yNprdqGPKTMjOI2VZ8a7q1A1CTSf17agpQBfJSLX64Iz5MU9i4zvs3Ra3CZnIYVrWEdT
	Rux0UK+p7+S41GKaTJNnUnx3BKj6IjuUIAea2j2Dy8sQEQbQS/9ZZojUINVuziDoZcakCbvhLs8Lk
	O+9d4XlHTLAgpJrFjyxZi05f5fLNR/GL3WxLJKPP0dhnKFFYdbtEbfKVkjDjYfgL7Y/qccgfig7Ck
	HY0+WaE5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHUN3-00034X-Ft; Thu, 26 Mar 2020 15:24:37 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHUMr-0002st-EE; Thu, 26 Mar 2020 15:24:27 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48p80G6F1Wz9txjy;
 Thu, 26 Mar 2020 16:23:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QJhesD4w; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NWGJWPMaCs17; Thu, 26 Mar 2020 16:23:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48p80G4yWsz9txhw;
 Thu, 26 Mar 2020 16:23:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585236238; bh=CZedNiiqJ0UJZqFGucqz7RH9S4VZ89sV2dm5t35m/bE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QJhesD4wQa2bJoneY1MwenUCwgUwqSk2wALQ4yKJw1XPxljgbdfEt2iVUC9DtiB+7
 Qp03KQsLcMtvm5iloRRcoXG4f/w4u0Ph+bkyIf3LO/PICDIkvttB2JptzPRNVcj3XJ
 QgjL01MGEvkgL+EWDjA6KH2h4clUrwIDk63DVcjQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2ED0F8B7AB;
 Thu, 26 Mar 2020 16:24:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H0WwrU9lWfFS; Thu, 26 Mar 2020 16:24:00 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 343758B756;
 Thu, 26 Mar 2020 16:23:58 +0100 (CET)
Subject: Re: [PATCH V2 0/3] mm/debug: Add more arch page table helper tests
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1585027375-9997-1-git-send-email-anshuman.khandual@arm.com>
 <2bb4badc-2b7a-e15d-a99b-b1bd38c9d9bf@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a46d18ed-8911-1ec3-c32f-58b6e0d959d7@c-s.fr>
Date: Thu, 26 Mar 2020 16:23:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2bb4badc-2b7a-e15d-a99b-b1bd38c9d9bf@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_082425_829439_BB33E7AC 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpMZSAyNi8wMy8yMDIwIMOgIDAzOjIzLCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDAzLzI0LzIwMjAgMTA6NTIgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+
PiBUaGlzIHNlcmllcyBhZGRzIG1vcmUgYXJjaCBwYWdlIHRhYmxlIGhlbHBlciB0ZXN0cy4gVGhl
IG5ldyB0ZXN0cyBoZXJlIGFyZQo+PiBlaXRoZXIgcmVsYXRlZCB0byBjb3JlIG1lbW9yeSBmdW5j
dGlvbnMgYW5kIGFkdmFuY2VkIGFyY2ggcGd0YWJsZSBoZWxwZXJzLgo+PiBUaGlzIGFsc28gY3Jl
YXRlcyBhIGRvY3VtZW50YXRpb24gZmlsZSBlbmxpc3RpbmcgYWxsIGV4cGVjdGVkIHNlbWFudGlj
cyBhcwo+PiBzdWdnZXN0ZWQgYnkgTWlrZSBSYXBvcG9ydCAoaHR0cHM6Ly9sa21sLm9yZy9sa21s
LzIwMjAvMS8zMC80MCkuCj4+Cj4+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCBvbiBhcm02
NCBhbmQgeDg2IHBsYXRmb3Jtcy4KPiAKPiBJZiBmb2xrcyBjYW4gdGVzdCB0aGVzZSBwYXRjaGVz
IG91dCBvbiByZW1haW5pbmcgQVJDSF9IQVNfREVCVUdfVk1fUEdUQUJMRQo+IGVuYWJsZWQgcGxh
dGZvcm1zIGkuZSBzMzkwLCBhcmMsIHBvd2VycGMgKDMyIGFuZCA2NCksIHRoYXQgd2lsbCBiZSBy
ZWFsbHkKPiBhcHByZWNpYXRlZC4gVGhhbmsgeW91Lgo+IAoKT24gcG93ZXJwYyA4eHggKFBQQzMy
KSwgSSBnZXQ6CgpbICAgNTMuMzM4MzY4XSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3Rh
YmxlOiBWYWxpZGF0aW5nIAphcmNoaXRlY3R1cmUgcGFnZSB0YWJsZSBoZWxwZXJzClsgICA1My4z
NDc0MDNdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQpbICAgNTMuMzUxODMy
XSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0IG1tL2RlYnVnX3ZtX3BndGFibGUuYzo2NDcgCmRl
YnVnX3ZtX3BndGFibGUrMHgyODAvMHgzZjQKWyAgIDUzLjM2MDE0MF0gQ1BVOiAwIFBJRDogMSBD
b21tOiBzd2FwcGVyIE5vdCB0YWludGVkIAo1LjYuMC1yYzctczNrLWRldi0wMTA5MC1nOTI3MTBl
OTk4ODFmICMzNTQ0ClsgICA1My4zNjg3MThdIE5JUDogIGMwNzc3YzA0IExSOiBjMDc3N2JiOCBD
VFI6IDAwMDAwMDAwClsgICA1My4zNzM3MjBdIFJFR1M6IGM5MDIzZGYwIFRSQVA6IDA3MDAgICBO
b3QgdGFpbnRlZCAKKDUuNi4wLXJjNy1zM2stZGV2LTAxMDkwLWc5MjcxMGU5OTg4MWYpClsgICA1
My4zODIwNDJdIE1TUjogIDAwMDI5MDMyIDxFRSxNRSxJUixEUixSST4gIENSOiAyMjAwMDIyMiAg
WEVSOiAyMDAwMDAwMApbICAgNTMuMzg4NjY3XQpbICAgNTMuMzg4NjY3XSBHUFIwMDogYzA3Nzdi
YjggYzkwMjNlYTggYzYxMjAwMDAgMDAwMDAwMDEgMWU0MTAwMDAgCjAwMDAwMDAwIDAwMDAwMDAw
IDAwNzY0MWM5ClsgICA1My4zODg2NjddIEdQUjA4OiAwMDAwMDAwMCAwMDAwMDAwMSAwMDAwMDAw
MCBmZmZmZmZmZiA4MjAwMDIyMiAKMDAwMDAwMDAgYzAwMDM5YjggMDAwMDAwMDAKWyAgIDUzLjM4
ODY2N10gR1BSMTY6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIGZmZmZmZmYwIDA2NWZjMDAw
IAoxZTQxMDAwMCBjNjYwMDAwMCAwMDAwMDFlNApbICAgNTMuMzg4NjY3XSBHUFIyNDogMDAwMDAx
ZDkgYzA2MmQxNGMgYzY1ZmMwMDAgYzY0MmQ0NDggMDAwMDA2YzkgCjAwMDAwMDAwIGM2NWY4MDAw
IGM2NWZjMDQwClsgICA1My40MjM0MDBdIE5JUCBbYzA3NzdjMDRdIGRlYnVnX3ZtX3BndGFibGUr
MHgyODAvMHgzZjQKWyAgIDUzLjQyODU1OV0gTFIgW2MwNzc3YmI4XSBkZWJ1Z192bV9wZ3RhYmxl
KzB4MjM0LzB4M2Y0ClsgICA1My40MzM1OTNdIENhbGwgVHJhY2U6ClsgICA1My40MzYwNDhdIFtj
OTAyM2VhOF0gW2MwNzc3YmI4XSBkZWJ1Z192bV9wZ3RhYmxlKzB4MjM0LzB4M2Y0IAoodW5yZWxp
YWJsZSkKWyAgIDUzLjQ0MjkzNl0gW2M5MDIzZjI4XSBbYzAwMDM5ZTBdIGtlcm5lbF9pbml0KzB4
MjgvMHgxMjQKWyAgIDUzLjQ0ODE4NF0gW2M5MDIzZjM4XSBbYzAwMGYxNzRdIHJldF9mcm9tX2tl
cm5lbF90aHJlYWQrMHgxNC8weDFjClsgICA1My40NTQyNDVdIEluc3RydWN0aW9uIGR1bXA6Clsg
ICA1My40NTcxODBdIDQxYTIwMDA4IDRiZWEzZWQ5IDYyODkwMDIxIDdkMzZiOTJlIDdkMzZiODJl
IDcxMjkwZmQwIAozMTQ5ZmZmZiA3ZDJhNDkxMApbICAgNTMuNDY0ODM4XSAwZjA5MDAwMCA1Nzg5
MDc3ZSAzMTQ5ZmZmZiA3ZDJhNDkxMCA8MGYwOTAwMDA+IDM4YzAwMDAwIAozOGEwMDAwMCAzODgw
MDAwMApbICAgNTMuNDcyNjcxXSAtLS1bIGVuZCB0cmFjZSBmZDVkZDkyNzQ0ZGMwMDY1IF0tLS0K
WyAgIDUzLjUxOTc3OF0gRnJlZWluZyB1bnVzZWQga2VybmVsIG1lbW9yeTogNjA4SwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
