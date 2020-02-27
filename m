Return-Path: <SRS0=iL9E=4P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75775C4BA24
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2020 04:07:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 438D924687
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2020 04:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nrjzraOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 438D924687
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylz5FsLSMCw5PdyjrEE4RopMo7M3pcAxX1B/ijQE3mA=; b=nrjzraOcYk79cc
	AyEVrV3HLRulFwbv5p6QCzA738qSd4hmNL3KhKqL/W7QGdXr+Q4axvHs9ThbohTqX7h/2pwmpgbPo
	TSNexjYpZMhMcUMKCgC9BnSxmsP4gSPCmwSmizOB8BXTXmbC1zgLqGw8WwOIkgCjNL/OUFkSkZ2Xh
	xJDcemLpSvwyaQhfgQTtzAB+mQA/v9zdOcwakGO1RvC5CQoxisiGVQQoXyk9++YBDjkquMOSu/89u
	Nm+bd/MBW/sM2JUTmHftMRfFwKbJIg6Sa+tswGLCq92P2Io/E3kPx79rMhi4qHuU7rYf34AoqLCQj
	QJrehztAqNpywA6EJqsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ASc-0003UX-HY; Thu, 27 Feb 2020 04:07:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ASJ-0003Eh-3L; Thu, 27 Feb 2020 04:07:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75D6F30E;
 Wed, 26 Feb 2020 20:07:21 -0800 (PST)
Received: from [10.163.1.119] (unknown [10.163.1.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E40F83F73B;
 Wed, 26 Feb 2020 20:07:11 -0800 (PST)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: Andrew Morton <akpm@linux-foundation.org>
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
 <1582726182.7365.123.camel@lca.pw> <1582726340.7365.124.camel@lca.pw>
 <eb154054-68ab-a659-065b-f4f7dcbb8671@c-s.fr>
 <52db1e9b-83b3-c41f-ef03-0f43e2159a83@arm.com>
 <20200226200353.ea5c8ec2efacfb1192f3f3f4@linux-foundation.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6a4518d5-9306-8f84-b676-26a40c594bd9@arm.com>
Date: Thu, 27 Feb 2020 09:37:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200226200353.ea5c8ec2efacfb1192f3f3f4@linux-foundation.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_200723_226688_821BF9DF 
X-CRM114-Status: GOOD (  20.77  )
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
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Qian Cai <cai@lca.pw>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwMi8yNy8yMDIwIDA5OjMzIEFNLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFRodSwg
MjcgRmViIDIwMjAgMDg6MDQ6MDUgKzA1MzAgQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmto
YW5kdWFsQGFybS5jb20+IHdyb3RlOgo+IAo+Pj4gTXVzdCBiZSBzb21ldGhpbmcgd3Jvbmcgd2l0
aCB0aGUgZm9sbG93aW5nIGluIGRlYnVnX3ZtX3BndGFibGUoKQo+Pj4KPj4+IMKgwqDCoMKgcGFk
ZHIgPSBfX3BhKCZzdGFydF9rZXJuZWwpOwo+Pj4KPj4+IElzIHRoZXJlIGFueSBleHBsYWluYXRp
b24gd2h5IHN0YXJ0X2tlcm5lbCgpIGlzIG5vdCBpbiBsaW5lYXIgbWVtb3J5IG9uIEFSTTY0ID8K
Pj4KPj4KPj4gQ2M6ICsgSmFtZXMgTW9yc2UgPGphbWVzLm1vcnNlQGFybS5jb20+Cj4+Cj4+IFRo
aXMgd2FybmluZyBnZXRzIGV4cG9zZWQgd2l0aCBERUJVR19WSVJUVUFMIGR1ZSB0byBfX3BhKCkg
b24gYSBrZXJuZWwgc3ltYm9sCj4+IGkuZSAnc3RhcnRfa2VybmVsJyB3aGljaCBtaWdodCBiZSBv
dXRzaWRlIHRoZSBsaW5lYXIgbWFwLiBUaGlzIGhhcHBlbnMgZHVlIHRvCj4+IGtlcm5lbCBtYXBw
aW5nIHBvc2l0aW9uIHJhbmRvbWl6YXRpb24gd2l0aCBLQVNMUi4gQWRkaW5nIEphbWVzIGhlcmUg
aW4gY2FzZSBoZQo+PiBtaWdodCBsaWtlIHRvIGFkZCBtb3JlLgo+Pgo+PiBfX3BhX3N5bWJvbCgp
IHNob3VsZCBoYXZlIGJlZW4gdXNlZCBpbnN0ZWFkLCBmb3IgYWNjZXNzaW5nIHRoZSBwaHlzaWNh
bCBhZGRyZXNzCj4+IGhlcmUuIE9uIGFybTY0IF9fcGEoKSBkb2VzIGNoZWNrIGZvciBsaW5lYXIg
YWRkcmVzcyB3aXRoIF9faXNfbG1fYWRkcmVzcygpIGFuZAo+PiBzd2l0Y2ggYWNjb3JkaW5nbHkg
aWYgaXQgaXMgYSBrZXJuZWwgdGV4dCBzeW1ib2wuIE5ldmVydGhlbGVzcywgaXRzIG11Y2ggYmV0
dGVyCj4+IHRvIHVzZSBfX3BhX3N5bWJvbCgpIGhlcmUgcmF0aGVyIHRoYW4gX19wYSgpLgo+Pgo+
PiBSYXRoZXIgdGhhbiByZXNwaW5pbmcgdGhlIHBhdGNoIG9uY2UgbW9yZSwgd2lsbCBqdXN0IHNl
bmQgYSBmaXggcmVwbGFjaW5nIHRoaXMKPj4gaGVscGVyIF9fcGEoKSB3aXRoIF9fcGFfc3ltYm9s
KCkgZm9yIEFuZHJldyB0byBwaWNrIHVwIGFzIHRoaXMgcGF0Y2ggaXMgYWxyZWFkeQo+PiBwYXJ0
IG9mIGxpbnV4LW5leHQgKG5leHQtMjAyMDAyMjYpLiBCdXQgY2FuIGRlZmluaXRlbHkgcmVzcGlu
IGlmIHRoYXQgd2lsbCBiZQo+PiBwcmVmZXJyZWQuCj4gCj4gSSBkaWRuJ3Qgc2VlIHRoaXMgZml4
PyAgSSBhc3N1bWUgaXQncyB0aGlzPyAgSWYgc28sIGFyZSB3ZSBzdXJlIGl0J3MgT0sgdG8gYmUK
PiBhZGRlZCB0byAtbmV4dCB3aXRob3V0IHRlc3Rpbmc/PwoKTXkgcGF0Y2gganVzdCBtaXNzZWQg
eW91ciByZXNwb25zZSBoZXJlIHdpdGhpbiBhIG1pbnV0ZSA6KSBQbGVhc2UgY29uc2lkZXIgdGhp
cy4KSXQgaGFzIGJlZW4gdGVzdGVkIG9uIHg4NiBhbmQgYXJtNjQuCgpodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3BhdGNoLzExNDA3NzE1LwoKPiAKPiAKPiAKPiBGcm9tOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFN1YmplY3Q6IG1tLWRlYnVnLWFkZC10
ZXN0cy12YWxpZGF0aW5nLWFyY2hpdGVjdHVyZS1wYWdlLXRhYmxlLWhlbHBlcnMtZml4Cj4gCj4g
QSB3YXJuaW5nIGdldHMgZXhwb3NlZCB3aXRoIERFQlVHX1ZJUlRVQUwgZHVlIHRvIF9fcGEoKSBv
biBhIGtlcm5lbCBzeW1ib2wKPiBpLmUgJ3N0YXJ0X2tlcm5lbCcgd2hpY2ggbWlnaHQgYmUgb3V0
c2lkZSB0aGUgbGluZWFyIG1hcC4gIFRoaXMgaGFwcGVucwo+IGR1ZSB0byBrZXJuZWwgbWFwcGlu
ZyBwb3NpdGlvbiByYW5kb21pemF0aW9uIHdpdGggS0FTTFIuCj4gCj4gX19wYV9zeW1ib2woKSBz
aG91bGQgaGF2ZSBiZWVuIHVzZWQgaW5zdGVhZCwgZm9yIGFjY2Vzc2luZyB0aGUgcGh5c2ljYWwK
PiBhZGRyZXNzIGhlcmUuICBPbiBhcm02NCBfX3BhKCkgZG9lcyBjaGVjayBmb3IgbGluZWFyIGFk
ZHJlc3Mgd2l0aAo+IF9faXNfbG1fYWRkcmVzcygpIGFuZCBzd2l0Y2ggYWNjb3JkaW5nbHkgaWYg
aXQgaXMgYSBrZXJuZWwgdGV4dCBzeW1ib2wuIAo+IE5ldmVydGhlbGVzcywgaXRzIG11Y2ggYmV0
dGVyIHRvIHVzZSBfX3BhX3N5bWJvbCgpIGhlcmUgcmF0aGVyIHRoYW4KPiBfX3BhKCkuCj4gCj4g
UmVwb3J0ZWQtYnk6IFFpYW4gQ2FpIDxjYWlAbGNhLnB3Pgo+IENjOiBBbnNodW1hbiBLaGFuZHVh
bCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPiBDYzogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1z
LmZyPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Cj4gLS0tCj4gCj4gIG1tL2RlYnVnX3ZtX3BndGFibGUuYyB8ICAgIDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gLS0tIGEvbW0v
ZGVidWdfdm1fcGd0YWJsZS5jfm1tLWRlYnVnLWFkZC10ZXN0cy12YWxpZGF0aW5nLWFyY2hpdGVj
dHVyZS1wYWdlLXRhYmxlLWhlbHBlcnMtZml4Cj4gKysrIGEvbW0vZGVidWdfdm1fcGd0YWJsZS5j
Cj4gQEAgLTMzMSw3ICszMzEsNyBAQCB2b2lkIF9faW5pdCBkZWJ1Z192bV9wZ3RhYmxlKHZvaWQp
Cj4gIAkgKiBoZWxwcyBhdm9pZCBsYXJnZSBtZW1vcnkgYmxvY2sgYWxsb2NhdGlvbnMgdG8gYmUg
dXNlZCBmb3IgbWFwcGluZwo+ICAJICogYXQgaGlnaGVyIHBhZ2UgdGFibGUgbGV2ZWxzLgo+ICAJ
ICovCj4gLQlwYWRkciA9IF9fcGEoJnN0YXJ0X2tlcm5lbCk7Cj4gKwlwYWRkciA9IF9fcGFfc3lt
Ym9sKCZzdGFydF9rZXJuZWwpOwo+ICAKPiAgCXB0ZV9hbGlnbmVkID0gKHBhZGRyICYgUEFHRV9N
QVNLKSA+PiBQQUdFX1NISUZUOwo+ICAJcG1kX2FsaWduZWQgPSAocGFkZHIgJiBQTURfTUFTSykg
Pj4gUEFHRV9TSElGVDsKPiBfCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1h
cmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
