Return-Path: <SRS0=iL9E=4P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952F8C4BA24
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2020 02:34:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67636208E4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2020 02:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYAdDvKo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67636208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GfLrxswDlSrv3cVG1Yk6GrTanc/TcD17joEKlY7ieWE=; b=bYAdDvKoIEFCul
	ilxbbflyRvX3ZiGdVmE4uhXnXA5abqNU6BeU6vO4UrM7gzLskEA7bjfPXFIlss3TRg5NSa6Wl5vbi
	c0MFBIEbPqv9WzquPzZ1AkOPB02M/16AqiGyffb9rUukcgEHYbxZKpxGKjEDGlNbfvabKVqHRwfgb
	wwAEAEK4k4Tx9MEtsA2ljGA+smfhii3R0x456/yw7TBEMmWy8EsGY8bV8MCYb5Wb2Y7GC/ewcypgk
	mvUVFukJNUH87JrNdkqWrdguOvMjYz8BJqlInqCrAk9bdNjCyK1Vxjw0/LU3p7Hah9QzRfqeZpMPn
	1Zjme1Fg3xdkjiBKqN+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j790Y-0005Qm-Fu; Thu, 27 Feb 2020 02:34:38 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j790E-0005C4-Lb; Thu, 27 Feb 2020 02:34:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D9F1FB;
 Wed, 26 Feb 2020 18:34:15 -0800 (PST)
Received: from [10.163.1.119] (unknown [10.163.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D8323F819;
 Wed, 26 Feb 2020 18:34:06 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>,
 linux-mm@kvack.org
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw> <1582726340.7365.124.camel@lca.pw>
 <eb154054-68ab-a659-065b-f4f7dcbb8671@c-s.fr>
Message-ID: <52db1e9b-83b3-c41f-ef03-0f43e2159a83@arm.com>
Date: Thu, 27 Feb 2020 08:04:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <eb154054-68ab-a659-065b-f4f7dcbb8671@c-s.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_183418_750168_0EB2F9C1 
X-CRM114-Status: GOOD (  14.19  )
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
 James Morse <james.morse@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMDIvMjYvMjAyMCAwODoxNCBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBM
ZSAyNi8wMi8yMDIwIMOgIDE1OjEyLCBRaWFuIENhaSBhIMOpY3JpdMKgOgo+PiBPbiBXZWQsIDIw
MjAtMDItMjYgYXQgMDk6MDkgLTA1MDAsIFFpYW4gQ2FpIHdyb3RlOgo+Pj4gT24gTW9uLCAyMDIw
LTAyLTE3IGF0IDA4OjQ3ICswNTMwLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Cj4+PiBI
b3cgdXNlZnVsIGlzIHRoaXMgdGhhdCBzdHJhaWdodGx5IGNyYXNoIHRoZSBwb3dlcnBjPwo+Pgo+
PiBBbmQgdGhlbiBnZW5lcmF0ZSB3YXJuaW5ncyBvbiBhcm02NCwKPj4KPj4gW8KgwqAxNDYuNjM0
NjI2XVvCoMKgwqDCoFQxXSBkZWJ1Z192bV9wZ3RhYmxlOiBkZWJ1Z192bV9wZ3RhYmxlOiBWYWxp
ZGF0aW5nCj4+IGFyY2hpdGVjdHVyZSBwYWdlIHRhYmxlIGhlbHBlcnMKPj4gW8KgwqAxNDYuNjQz
OTk1XVvCoMKgwqDCoFQxXSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4g
W8KgwqAxNDYuNjQ5MzUwXVvCoMKgwqDCoFQxXSB2aXJ0X3RvX3BoeXMgdXNlZCBmb3Igbm9uLWxp
bmVhciBhZGRyZXNzOgo+PiAoX19fX3B0cnZhbF9fX18pIChzdGFydF9rZXJuZWwrMHgwLzB4NTgw
KQo+IAo+IE11c3QgYmUgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlIGZvbGxvd2luZyBpbiBkZWJ1
Z192bV9wZ3RhYmxlKCkKPiAKPiDCoMKgwqDCoHBhZGRyID0gX19wYSgmc3RhcnRfa2VybmVsKTsK
PiAKPiBJcyB0aGVyZSBhbnkgZXhwbGFpbmF0aW9uIHdoeSBzdGFydF9rZXJuZWwoKSBpcyBub3Qg
aW4gbGluZWFyIG1lbW9yeSBvbiBBUk02NCA/CgoKQ2M6ICsgSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+CgpUaGlzIHdhcm5pbmcgZ2V0cyBleHBvc2VkIHdpdGggREVCVUdfVklSVFVB
TCBkdWUgdG8gX19wYSgpIG9uIGEga2VybmVsIHN5bWJvbAppLmUgJ3N0YXJ0X2tlcm5lbCcgd2hp
Y2ggbWlnaHQgYmUgb3V0c2lkZSB0aGUgbGluZWFyIG1hcC4gVGhpcyBoYXBwZW5zIGR1ZSB0bwpr
ZXJuZWwgbWFwcGluZyBwb3NpdGlvbiByYW5kb21pemF0aW9uIHdpdGggS0FTTFIuIEFkZGluZyBK
YW1lcyBoZXJlIGluIGNhc2UgaGUKbWlnaHQgbGlrZSB0byBhZGQgbW9yZS4KCl9fcGFfc3ltYm9s
KCkgc2hvdWxkIGhhdmUgYmVlbiB1c2VkIGluc3RlYWQsIGZvciBhY2Nlc3NpbmcgdGhlIHBoeXNp
Y2FsIGFkZHJlc3MKaGVyZS4gT24gYXJtNjQgX19wYSgpIGRvZXMgY2hlY2sgZm9yIGxpbmVhciBh
ZGRyZXNzIHdpdGggX19pc19sbV9hZGRyZXNzKCkgYW5kCnN3aXRjaCBhY2NvcmRpbmdseSBpZiBp
dCBpcyBhIGtlcm5lbCB0ZXh0IHN5bWJvbC4gTmV2ZXJ0aGVsZXNzLCBpdHMgbXVjaCBiZXR0ZXIK
dG8gdXNlIF9fcGFfc3ltYm9sKCkgaGVyZSByYXRoZXIgdGhhbiBfX3BhKCkuCgpSYXRoZXIgdGhh
biByZXNwaW5pbmcgdGhlIHBhdGNoIG9uY2UgbW9yZSwgd2lsbCBqdXN0IHNlbmQgYSBmaXggcmVw
bGFjaW5nIHRoaXMKaGVscGVyIF9fcGEoKSB3aXRoIF9fcGFfc3ltYm9sKCkgZm9yIEFuZHJldyB0
byBwaWNrIHVwIGFzIHRoaXMgcGF0Y2ggaXMgYWxyZWFkeQpwYXJ0IG9mIGxpbnV4LW5leHQgKG5l
eHQtMjAyMDAyMjYpLiBCdXQgY2FuIGRlZmluaXRlbHkgcmVzcGluIGlmIHRoYXQgd2lsbCBiZQpw
cmVmZXJyZWQuCgpUaGFua3MgUWlhbiBmb3IgY2F0Y2hpbmcgdGhpcy4KCj4gCj4gQ2hyaXN0b3Bo
ZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBz
LWFyYwo=
